# Xuhan Huang — Academic Website

Source for [xuhan-huang.github.io](https://xuhan-huang.github.io/), a personal academic website built with Jekyll.

## Local preview

Install the Ruby dependencies, then run:

```bash
bundle exec jekyll serve
```

The redesigned pages are generated from:

- `_pages/about.md` — home and selected work
- `_pages/research.md` — research directions and publications
- `_pages/teaching.html` — teaching and student seminars
- `_pages/cv.md` — academic overview and CV link
- `_data/research.yml` — shared publication metadata
- `assets/css/redesign.scss` — site styles

Run the local structural checks after building:

```bash
bundle exec ruby scripts/check_redesign.rb _site
```

## Acknowledgements

This website was originally based on [Academic Pages](https://github.com/academicpages/academicpages.github.io), which is derived from [Minimal Mistakes](https://github.com/mmistakes/minimal-mistakes). The current design and content are customized.

Template components remain available under the MIT License; see [`LICENSE`](LICENSE). The self-hosted Newsreader font is distributed under the SIL Open Font License; see [`assets/fonts/newsreader/OFL.txt`](assets/fonts/newsreader/OFL.txt).
