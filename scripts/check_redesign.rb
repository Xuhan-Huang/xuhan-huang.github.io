#!/usr/bin/env ruby

require "nokogiri"
require "pathname"
require "uri"

build_root = Pathname(ARGV.fetch(0, "/tmp/xuhan-site-redesign-build")).expand_path
pages = %w[index.html research/index.html teaching/index.html cv/index.html]
errors = []

def local_target(build_root, page_path, raw_value)
  value = raw_value.split("#", 2).first.split("?", 2).first
  return nil if value.empty?

  target = if value.start_with?("/")
             build_root.join(value.delete_prefix("/"))
           else
             page_path.dirname.join(value)
           end
  target = target.join("index.html") if value.end_with?("/")
  target.cleanpath
end

pages.each do |relative_page|
  page_path = build_root.join(relative_page)
  unless page_path.file?
    errors << "missing page: #{relative_page}"
    next
  end

  html = page_path.read
  errors << "machine-local path leaked into #{relative_page}" if html.match?(%r{/(?:tmp|mnt/ydao)/})
  doc = Nokogiri::HTML5(html)

  ids = doc.css("[id]").map { |node| node["id"] }
  ids.tally.each { |id, count| errors << "duplicate id #{id.inspect} in #{relative_page}" if count > 1 }

  doc.css("img").each do |image|
    errors << "image without alt in #{relative_page}: #{image["src"]}" unless image.key?("alt")
  end

  doc.css("iframe").each do |frame|
    errors << "iframe without title in #{relative_page}: #{frame["src"]}" if frame["title"].to_s.strip.empty?
  end

  doc.css("a[target='_blank']").each do |link|
    rel = link["rel"].to_s.split
    errors << "target=_blank without noopener in #{relative_page}: #{link["href"]}" unless rel.include?("noopener")
  end

  doc.css("a[href], img[src], iframe[src], link[href]").each do |node|
    attribute = node.name == "a" || node.name == "link" ? "href" : "src"
    value = node[attribute].to_s.strip
    if value.empty? || value == "#"
      errors << "empty or placeholder #{attribute} in #{relative_page}: #{node.to_html}"
      next
    end
    next if value.start_with?("http://", "https://", "mailto:", "tel:", "data:", "#")

    target = local_target(build_root, page_path, value)
    errors << "broken local target in #{relative_page}: #{value}" unless target&.exist?
  end
end

if errors.empty?
  puts "Redesign HTML checks passed for #{pages.length} pages."
else
  warn errors.join("\n")
  exit 1
end
