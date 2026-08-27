---
layout: redesign
title: "Research"
permalink: /research/
description: "Research by Xuhan Huang on mechanistic understanding and verifiable reasoning for AI safety."
nav_key: research
body_class: research-page
---

<main id="main-content" class="page-shell">
  <header class="page-hero">
    <p class="page-kicker">Research</p>
    <h1 class="page-title">Understanding model behavior and making reasoning verifiable.</h1>
    <p class="page-lead">As AI systems become more capable, using them safely and effectively increasingly depends on our ability to understand and verify their behavior. I study this challenge through two complementary directions: understanding how model behavior arises from internal mechanisms, and exploring verifiable reasoning methods to reduce the cost of obtaining reliable feedback.</p>
  </header>

  <section class="focus-grid" aria-label="Current research focuses">
    <article class="focus-item">
      <span class="focus-item__number">01</span>
      <h2>Mechanistic Understanding for AI Safety</h2>
      <p>I study how weights, activations, and circuits give rise to model behavior, and how they change during training and adaptation. I draw on existing analysis tools and develop new methods when needed to characterize and compare these mechanisms.</p>
      <figure class="focus-visual focus-visual--swd">
        <div class="focus-visual__frame">
          <iframe id="research-swd-animation" src="{{ '/assets/embeds/swd-hero.html' | relative_url }}" title="Animated Sparse Weight Decomposition diagram showing dense weights becoming sparse read and write components" scrolling="no"></iframe>
        </div>
        <figcaption>
          <span>SWD · sparse read/write components as intervention units.</span>
          <button class="focus-visual__replay" type="button" aria-controls="research-swd-animation" aria-label="Replay the full Sparse Weight Decomposition animation" disabled>↻ Replay</button>
        </figcaption>
      </figure>
    </article>
    <article class="focus-item">
      <span class="focus-item__number">02</span>
      <h2>Verifiable Reasoning for AI Safety</h2>
      <p>I study verifiable reasoning for AI safety, using formal languages and automated verifiers to reduce the cost of obtaining reliable feedback on model-generated solutions. I explore how this feedback can support scalable training and evaluation for tasks with explicit, checkable specifications.</p>
      <figure class="focus-visual focus-visual--reform">
        <div class="focus-visual__frame">
          <img src="{{ '/assets/images/research/reform-rl.png' | relative_url }}" alt="Re:Form reinforcement-learning pipeline with specification-subset and verification rewards" loading="lazy">
        </div>
        <figcaption>Re:Form · verifier-backed reinforcement learning.</figcaption>
      </figure>
    </article>
  </section>

  <section class="content-section" aria-labelledby="research-record-heading">
    <div class="content-section__heading">
      <h2 id="research-record-heading">Publications &amp; Preprints</h2>
    </div>

    <div class="research-records">
      {% assign research_records = site.data.research | sort: 'research_order' %}
      {% for work in research_records %}
        <article class="research-record" id="research-{{ work.id }}">
          <div class="record-year">{{ work.year }}</div>
          <div>
            <h3>{{ work.title }}</h3>
            <p class="record-authors">{% include research-authors.html work=work %}</p>
            <div class="record-meta">
              <span class="venue">{{ work.venue_label }}</span>
              {% include research-actions.html links=work.links %}
            </div>
          </div>
        </article>
      {% endfor %}
    </div>
    <p class="equal-note">* Equal contribution.</p>
  </section>
</main>

<script>
  (() => {
    const frame = document.getElementById('research-swd-animation');
    const replay = document.querySelector('.focus-visual__replay');
    if (!frame || !replay) return;

    const controller = () => frame.contentWindow && frame.contentWindow.heroFig1;
    const enableReplay = () => {
      replay.disabled = !(controller() && controller().playFullSequence);
    };

    frame.addEventListener('load', enableReplay);
    window.addEventListener('load', enableReplay, { once: true });

    replay.addEventListener('click', async () => {
      const animation = controller();
      if (!animation || !animation.playFullSequence) return;
      replay.disabled = true;
      try {
        await animation.playFullSequence();
      } finally {
        replay.disabled = false;
      }
    });
  })();
</script>
