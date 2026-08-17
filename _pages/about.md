---
layout: redesign
permalink: /
title: ""
description: "Xuhan Huang is an MPhil student in Computer Science at CUHK-Shenzhen, working on AI safety, mechanistic understanding, and verifiable reasoning."
nav_key: home
body_class: home-page
redirect_from:
  - /about/
  - /about.html
---

<main id="main-content" class="site-shell">
  <section class="home-intro" aria-labelledby="home-name">
    <div class="identity-card">
      <img class="identity-card__portrait" src="{{ '/images/homepage_small.jpg' | relative_url }}" alt="Portrait of Xuhan Huang" width="140" height="140">
      <div class="identity-card__copy">
        <h1 id="home-name">Xuhan Huang</h1>
        <p class="identity-card__role">MPhil in Computer Science</p>
        <p class="identity-card__affiliation">CUHK-Shenzhen</p>
      </div>
    </div>

    <div class="about-copy">
      <p class="section-label">About</p>
      <p class="about-copy__text">I am an MPhil student in Computer Science at CUHK-Shenzhen. I completed my undergraduate studies in Applied Mathematics there, where I was advised by Professors <a href="https://wabyking.github.io/old.html" target="_blank" rel="noopener noreferrer">Benyou Wang</a> and <a href="https://daizhongxiang.github.io/" target="_blank" rel="noopener noreferrer">Zhongxiang Dai</a>. I am currently mentored by Professor <a href="https://bigaidream.github.io/" target="_blank" rel="noopener noreferrer">Jie Fu</a>.</p>
      <p class="about-copy__text">My research interests lie broadly in AI safety, with a focus on <a class="about-copy__focus-link" href="{{ '/research/' | relative_url }}">mechanistic understanding and verifiable reasoning</a>. I am interested in understanding the internal mechanisms that shape model behavior, and in using verifiable feedback to support more reliable and scalable training and evaluation.</p>

      <div class="contact-block" aria-label="Contact and profile links">
        <div class="contact-row">
          <span class="contact-row__label">Email:</span>
          <a href="mailto:xuhanhuang@link.cuhk.edu.cn">xuhanhuang@link.cuhk.edu.cn</a>
        </div>
        <div class="contact-row">
          <span class="contact-row__label">Links:</span>
          <span class="contact-row__links">
            <a href="https://scholar.google.com/citations?user=Iu80TyIAAAAJ&amp;hl=en" target="_blank" rel="noopener noreferrer">Google Scholar</a>
            <span class="contact-row__separator" aria-hidden="true">|</span>
            <a href="https://github.com/Xuhan-Huang" target="_blank" rel="noopener noreferrer">GitHub</a>
          </span>
        </div>
      </div>
    </div>
  </section>

  <div class="home-grid">
    <section class="home-main" aria-labelledby="recent-work-heading">
      <div class="section-heading-row">
        <p id="recent-work-heading" class="section-label">Recent Work</p>
        <a class="section-heading-row__link" href="{{ '/research/' | relative_url }}">All research ↗</a>
      </div>

      {% for work in site.data.research %}
        {% if work.home_group == 'featured' %}
          <article class="featured-work" id="work-{{ work.id }}">
            <div class="research-figure {{ work.figure.class }}">
              {% if work.figure.type == 'iframe' %}
                <iframe src="{{ work.figure.src | relative_url }}" title="{{ work.figure.alt }}" scrolling="no"></iframe>
              {% else %}
                <img src="{{ work.figure.src | relative_url }}" alt="{{ work.figure.alt }}" loading="lazy">
              {% endif %}
            </div>
            <div class="featured-work__copy">
              <h2>{{ work.title }}</h2>
              <p class="authors">{% include research-authors.html work=work compact=true %}</p>
              <p class="work-summary">{{ work.summary }}</p>
              <div class="work-meta">
                <span class="venue">{{ work.venue_label }}</span>
                {% include research-actions.html links=work.links %}
              </div>
            </div>
          </article>
        {% endif %}
      {% endfor %}

      <p class="equal-note">* Equal contribution.</p>

      <section class="more-research" aria-labelledby="more-research-heading">
        <p id="more-research-heading" class="section-label">More Research</p>
        <div class="more-list">
          {% for work in site.data.research %}
            {% if work.home_group == 'more' %}
              <article class="more-work">
                <div class="more-work__heading">
                  <span class="more-work__title">{{ work.title }}</span>
                  <span class="venue">{{ work.venue_label }}</span>
                </div>
                <p class="authors">{% include research-authors.html work=work %}</p>
                <div class="action-links">{% include research-actions.html links=work.links %}</div>
              </article>
            {% endif %}
          {% endfor %}
        </div>
        <p class="equal-note">* Equal contribution.</p>
      </section>
    </section>

    <aside class="home-rail" aria-label="Teaching and personal notes">
      <section class="rail-block">
        <p class="rail-label"><span>Currently</span></p>
        <div class="rail-item"><strong>Mechanistic analysis of language models</strong><span>Research Intern · IQuest Research</span></div>
        <div class="rail-item"><strong>MPhil in Computer Science</strong><span>CUHK-Shenzhen</span></div>
      </section>

      <section class="rail-block">
        <p class="rail-label"><span>Teaching</span></p>
        <div class="rail-item"><strong>Honours ODE</strong><span>Teaching Fellow · Fall 2024</span></div>
        <div class="rail-item"><strong>Honours Calculus</strong><span>Teaching Fellow · Spring 2024</span></div>
        <div class="rail-item"><strong>Student Seminars</strong><span>PPO &amp; veRL · 2025<br>Real Analysis · 2023</span></div>
        <a class="rail-link" href="{{ '/teaching/' | relative_url }}">View teaching →</a>
      </section>

      <section class="rail-block">
        <p class="rail-label"><span>Tools &amp; Resources</span></p>
        <div class="rail-item">
          <strong><a href="https://github.com/gaoxin492/PaperFeeder" target="_blank" rel="noopener noreferrer">PaperFeeder ↗</a></strong>
          <span>An open-source paper-reading agent I contribute to, with personalized daily research digests.</span>
        </div>
      </section>

      <section class="rail-block">
        <p class="rail-label"><span>Off the clock</span></p>
        <p class="off-clock">Usually at the gym or on a basketball court.</p>
      </section>
    </aside>
  </div>
</main>
