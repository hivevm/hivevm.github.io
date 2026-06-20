# ADR-0004: Data-driven, component-based content with hand-authored CSS and dependency-free JS

- **Status:** ⚪ superseded by [ADR-0006](0006-data-driven-hugo-content.md)
- **Date:** 2026-06-20
- **Deciders:** Maintainer
- **Note:** Documents a decision already embodied in [`_data/`](../../_data/),
  [`_includes/`](../../_includes/), [`_layouts/`](../../_layouts/),
  [`assets/css/hivevm.css`](../../assets/css/hivevm.css) and
  [`assets/js/site.js`](../../assets/js/site.js). Written retroactively so the project follows its own
  method; awaiting maintainer acceptance.

## Context

Within the Jekyll + GitHub Pages decision ([ADR-0003](0003-jekyll-github-pages-site.md)), the
specification requires that adding or changing a tool card, repository entry, nav item, or footer link be
a **content-only** edit — no markup changes (Goal 2) — and that the site's core content stay readable
**without JavaScript** (Goal 4), while remaining accessible, responsive, and free of any front-end
framework or Node build step (Non-Goals). We need a structure that delivers this inside Jekyll/Liquid.

## Decision

We will keep page **content** in [`_data/`](../../_data/) YAML files (`features`, `repos`, `nav`,
`footer`) and the home-page hero in [`index.md`](../../index.md) front matter, and render it through
small, reusable [`_includes/`](../../_includes/) partials composed by [`_layouts/`](../../_layouts/)
(`default` → `home`/`page`/`post`). Styling lives in a single hand-authored CSS file driven by design
tokens ([`assets/css/hivevm.css`](../../assets/css/hivevm.css)); interactivity lives in one
dependency-free, `defer`-loaded script ([`assets/js/site.js`](../../assets/js/site.js)) that only
*enhances* server-rendered HTML (mobile menu, tabs, reveal-on-scroll) via `data-*` hooks. No CSS or JS
framework and no bundler are introduced.

## Alternatives considered

- **Content hard-coded in HTML/Liquid templates** — simplest to start, but every content change means
  editing markup, violating the content-only-edit goal and inviting inconsistency.
- **A CSS framework (Tailwind, Bootstrap)** — speeds prototyping, but pulls in a Node/PostCSS build step
  (Tailwind) or heavy global CSS (Bootstrap), both ruled out by the Non-Goals; a single token-driven
  stylesheet keeps the "dark glow" design coherent and dependency-free.
- **A JS framework / islands (React, Vue, Svelte, Astro islands)** — overkill for a few progressive
  enhancements, reintroduces a build step, and risks content that needs JS to render, breaking the
  resilient-core goal.
- **Jekyll Collections for the tool/repo data instead of `_data/`** — collections suit per-item pages;
  the tools and repos are small fixed lists rendered inline, for which flat `_data/` YAML is simpler.

## Sources / Prior art

- Jekyll data files, includes and layouts —
  <https://jekyllrb.com/docs/datafiles/>, <https://jekyllrb.com/docs/includes/>,
  <https://jekyllrb.com/docs/layouts/>.
- Progressive enhancement (core content works without JS) — MDN,
  <https://developer.mozilla.org/en-US/docs/Glossary/Progressive_Enhancement>.
- Using `data-*` attributes as scripting hooks — MDN,
  <https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes>.

## Consequences

- Positive: content edits are low-risk YAML/Markdown changes a non-developer can make; one source of
  truth per section; the site renders fully without JS; no framework upgrades, supply chain, or build
  step to maintain; the design stays consistent through shared tokens.
- Negative / trade-offs: the hand-authored CSS is large and centralized (changes need care); richer
  interactivity must be written in vanilla JS by hand; Liquid/`_data` schemas are an informal contract
  the includes depend on (a renamed key silently breaks a section).
- Follow-ups: if interactivity outgrows vanilla JS, or content outgrows flat data files, revisit with a
  new ADR (e.g. adopting Jekyll Collections or a minimal build step) rather than editing this one.
