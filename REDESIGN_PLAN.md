# Xuhan Huang Personal Website Redesign Plan

Status: implemented locally; awaiting review

Working branch: `site-redesign`

Verification: production Jekyll build and four-page redesign audit passed on 2026-08-16

Remote policy: do not push or deploy until explicit user approval

## 1. Objective

Redesign the public-facing personal website as a coherent, low-key academic site with a distinct visual identity. Preserve the current Jekyll repository, content history, research assets, and stable URLs where practical; replace the public layouts and design system rather than rewriting the technical stack from scratch.

The intended impression is:

- personal and memorable to peers and early-career researchers;
- restrained and credible to senior researchers;
- research-first, without presenting the author as more senior than the current career stage;
- visually warm and individual, without turning the site into a game, terminal, or portfolio gimmick.

## 2. Scope

### In scope

- A new shared visual system and public-page layout.
- A fully redesigned Home page.
- A redesigned Research page.
- A unified Teaching page.
- A restyled CV landing page with the existing PDF retained.
- Shared navigation, footer, responsive behavior, typography, link components, and accessibility states.
- Migration of approved research figures and the SWD animation into repository-owned assets.
- Replacement of placeholder links with verified real links.

### Out of scope

- Replacing Jekyll with another framework.
- Rewriting factual CV or publication content without evidence.
- Adding the abandoned self-play project.
- Adding decorative references to Snoopy or Minions solely for personality.
- Rebuilding legacy archive, talk, portfolio, and blog collections unless they become necessary for a public route.
- Pushing, merging, or deploying before local approval.

## 3. Approved Design Direction

### 3.1 Visual character

- Low-key editorial academic style.
- Warm off-white page background with restrained dark green accents inspired by the SWD blog palette.
- Thin separators only where they materially clarify page structure.
- No oversized name hero and no manifesto-style first screen.
- No heavy cards, gradients, large shadows, or saturated call-to-action buttons.

### 3.2 Typography

Use **Newsreader only** for all visible site text. Use size, weight, color, spacing, and italics to create hierarchy instead of switching type families.

- Weight 400: body copy, authors, affiliation, ordinary links, and metadata.
- Weight 500: name, navigation, publication titles, publication summaries, Teaching item titles, and action-label text.
- Weight 600: section labels, the author's name inside author lists, venues, and `Email:` / `Links:` labels.
- Italic: equal-contribution notes and occasional secondary annotations only.
- Uppercase plus letter spacing: small structural labels such as `ABOUT`, `RECENT WORK`, and `TEACHING`.
- Use the Newsreader variable font with optical sizing and self-host it in the repository for production.
- Icons embedded in action labels and fonts inside original research figures do not count as additional site typography.

### 3.3 Shared navigation

- Left: `Xuhan Huang` in full; do not abbreviate it to `XH`.
- Right: `Home`, `Research`, `Teaching`, `CV`.
- Keep the navigation compact and typographically consistent with the rest of the site.
- Preserve a clear active state without heavy underlines or filled tabs.

## 4. Page Specifications

### 4.1 Home

#### Identity and About

- Small circular portrait, approximately 140 px on desktop and smaller on mobile.
- Identity block under or beside the portrait:
  - `Xuhan Huang`
  - `Incoming MPhil in Computer Science`
  - `CUHK-Shenzhen`
- About copy:

  > I am an incoming MPhil student in Computer Science at CUHK-Shenzhen. I completed my undergraduate studies in Mathematics there, where I was advised by Professors Benyou Wang and Zhongxiang Dai. I am currently mentored by Professor Jie Fu.

  > My research interests lie broadly in AI safety, especially mechanistic understanding and scalable formal reasoning and verification. I am interested in developing AI systems whose behavior can be better understood, evaluated, and verified.

- Contact formatting:
  - `Email:` in weight 600, followed by the visible and clickable address `xuhanhuang@link.cuhk.edu.cn` in weight 400.
  - `Links:` in weight 600, followed by `Google Scholar | GitHub` in weight 400.
  - No default underline under the email.
  - No icons in the contact block.
  - No divider between About and Email, and no divider directly below Links.

#### Recent Work

Use the label `Recent Work`, not `Selected Publications`.

The four featured entries are:

1. Sparse Weight Decomposition for Efficient Circuit Extraction.
2. Re:Form—Reducing Human Annotations in Scalable Formal Software Verification with RL in LLMs: A Preliminary Study on Dafny.
3. Federated Linear Dueling Bandits.
4. LLMs for Mathematical Modeling: Towards Bridging the Gap between Natural and Mathematical Languages.

Author rules:

- Keep complete author lists for SWD, FLDB, and MAMO.
- For Re:Form, preserve all seven equal-contribution authors and then shorten the remaining list:

  `Chuanhao Yan*, Fengdi Che*, Xuhan Huang*, Xu Xu*, Xin Li*, Yizhi Li*, Xingwei Qu*, et al.`

- Bold `Xuhan Huang` within author lists.
- Preserve the `* Equal contribution.` note.
- The Research page will contain the complete Re:Form author list.

Action links:

- Use compact soft labels for `Paper`, `Code`, and `Blog`.
- Include a small document icon for Paper, a code icon for Code, and a restrained external/article icon for Blog.
- Follow the light Mia Tang treatment: no visible outline border, small padding, subtle rounding, muted text/icon color, and an extremely light shadow that strengthens slightly on hover.
- The full label area must be clickable; do not use icon-only controls.

#### Featured figures

- SWD: reuse the original animated hero from `/mnt/ydao/share/swd_hf_space`; retain its internal title, remove replay UI, and fit it naturally inside the publication figure area.
- Re:Form: use `/mnt/ydao/xuhan/others/reform_rl.png`; do not add the previous blue outer border or extra Section 2.4 text.
- FLDB: use the cover derived from the original Draw.io source, not a newly invented diagram. Source files:
  - `/mnt/ydao/xuhan/others/fldb_new.drawio`
  - `/mnt/ydao/xuhan/others/fldb_homepage_cover.drawio`
  - `/mnt/ydao/xuhan/others/fldb_homepage_cover.svg`
  - `/mnt/ydao/xuhan/others/fldb_homepage_cover.png`
- MAMO: use `/mnt/ydao/xuhan/others/mamo_pipeline.png`.
- Preserve editable/source provenance where available.
- Copy production assets into repository-owned paths; production pages must not reference `/tmp`, `/mnt/ydao/share`, or other external workspace paths.

#### Remaining Home content

- `More Research` contains formal publication titles, authors, venues, and real links.
- Keep complete author names in More Research.
- Right rail contains Teaching and a short `Off the clock` note.
- Teaching entries point to the same unified Teaching page.
- Do not add self-play.

### 4.2 Research

The page should present one safety objective and two current research focuses rather than three overlapping peer categories.

Overall objective:

- AI safety.

Current focuses:

1. Mechanistic Understanding for AI Safety.
2. Scalable Formal Reasoning and Verification.

The lower section contains the complete research record with:

- formal titles;
- complete author lists;
- equal-contribution markers;
- venues and status;
- verified Paper, Code, Project, Blog, or Dataset links where available;
- concise summaries only when they help readers understand the contribution.

Do not add self-play. Avoid describing MAMO as a separate non-safety identity bucket; place it according to its role in scalable formal reasoning and verifiable feedback.

### 4.3 Teaching

- Keep a single `/teaching/` page.
- The Home-page Teaching entries all link to this page.
- Include:
  - Honours ODE — Teaching Fellow, Fall 2024.
  - Honours Calculus — Teaching Fellow, Spring 2024.
  - Student Seminars — PPO and veRL (2025), Real Analysis (2023).
- Keep descriptions concise; do not create one page for each one-sentence item.
- Use the same typography, navigation, width, and footer as Home and Research.

### 4.4 CV

- Preserve the existing CV facts and PDF unless a newer user-provided version is available.
- Current repository PDF: `files/Xuhan_Huang_CV_20260815.pdf`, compiled from the 2026-08-15 source snapshot in `/mnt/ydao/xuhan/others/6925bc272dda07b08e4dddc6`.
- Restyle the CV landing page with the new shared layout.
- Keep a clear PDF download/view link.
- Do not silently reconcile inconsistent major labels or dates; verify them before changing factual content.

## 5. Implementation Stages

### Stage 0 — Plan and guardrails

Deliverables:

- Local branch `site-redesign`.
- This `REDESIGN_PLAN.md` document.
- Confirmed no-push/no-deploy rule.

Acceptance:

- Plan records the approved visual and content decisions.
- Existing `master` and `origin/master` remain untouched.

### Stage 1 — Shared foundation

Deliverables:

- Shared base layout and page shell.
- Shared navigation and footer includes.
- Design tokens for colors, spacing, widths, and type hierarchy.
- Self-hosted Newsreader variable font and fallbacks.
- Responsive base styles and focus states.

Acceptance:

- A minimal test page builds through Jekyll.
- Desktop and mobile navigation work without overflow.
- No default academicpages author sidebar appears on redesigned routes.

### Stage 2 — Home

Deliverables:

- Approved Home design implemented in Jekyll.
- Repository-owned figure assets and SWD animation.
- Verified real links.

Acceptance:

- Matches the approved temporary prototype at desktop and mobile sizes.
- No placeholder `#` links.
- No references to temporary/external filesystem paths.
- Animation respects `prefers-reduced-motion`.

### Stage 3 — Research

Deliverables:

- Research framing and two focus areas.
- Complete bibliographic research list.

Acceptance:

- Full author lists and contribution markers are correct.
- Work placement does not create overlapping or misleading research categories.
- Self-play is absent.

### Stage 4 — Teaching and CV

Deliverables:

- Unified Teaching page.
- Restyled CV landing page.

Acceptance:

- All Home Teaching links resolve to `/teaching/`.
- CV content remains evidence-grounded and PDF access works.

### Stage 5 — Verification

Checks:

- Production Jekyll build.
- Internal-route and external-link audit.
- Desktop and mobile screenshots.
- Keyboard and focus behavior.
- Image alt text and meaningful labels.
- Reduced-motion behavior.
- Font and asset loading.
- Git status review for unrelated changes.

Acceptance:

- Build succeeds without newly introduced warnings or broken routes.
- No placeholder or machine-local paths remain.
- Public pages are usable at desktop and mobile widths.

### Stage 6 — Local review

- Serve the complete redesign locally.
- Review Home, Research, Teaching, and CV page by page.
- Apply requested revisions locally.

### Stage 7 — Finalization and deployment gate

- Only after explicit user approval:
  - create final local commits;
  - discuss merge strategy;
  - push if authorized;
  - deploy if authorized.

Local approval does not imply permission to push or deploy.

## 6. Content and Link Audit

Before production implementation, verify:

- paper and code URLs for every featured and More Research entry;
- the canonical SWD Blog URL;
- Google Scholar and GitHub profile URLs;
- venue names and publication status;
- the latest intended CV PDF;
- exact author spelling, order, and equal-contribution markers;
- advisor links if names become clickable.

Existing repository content and PDFs are evidence sources, not automatically current truth. Do not invent missing URLs or facts.

## 7. Safety, History, and Rollback

- Work only on `site-redesign` until approval.
- Preserve unrelated files and any future user changes.
- Do not use destructive Git operations.
- Keep the original Draw.io asset and other editable sources alongside derived web exports where practical.
- The remote version remains the rollback baseline until the user approves a deployment.
- Do not push, merge, or deploy without a separate explicit instruction.

## 8. Process Note

This document serves as the lightweight implementation specification for the redesign. OpenSpec is not introduced at Stage 0 because the approved prototype and this repository-local plan provide sufficient scope control. Reconsider a heavier specification workflow only if the site expands into a multi-contributor or substantially more complex project.
