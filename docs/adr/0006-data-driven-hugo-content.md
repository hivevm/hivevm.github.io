# ADR-0006: Data-driven, partial-based content in Hugo with hand-authored CSS and dependency-free JS

- **Status:** 🟢 accepted
- **Date:** 2026-06-21
- **Deciders:** Maintainer
- **Supersedes:** [ADR-0004](0004-data-driven-component-architecture.md) (the same model expressed in
  Jekyll's `_data/`, `_includes/`, `_layouts/`)
- **Note:** Documents a decision already embodied in [`data/`](../../data/),
  [`layouts/`](../../layouts/), [`static/assets/css/hivevm.css`](../../static/assets/css/hivevm.css) and
  [`static/assets/js/site.js`](../../static/assets/js/site.js). Written retroactively so the project
  follows its own method; awaiting maintainer acceptance.

## Context

Within the Hugo + GitHub Pages decision ([ADR-0005](0005-hugo-github-pages-site.md)), the specification
requires that adding or changing a tool card, repository entry, nav item, or footer link be a
**content-only** edit — no markup changes (Goal 2) — and that the site's core content stay readable
**without JavaScript** (Goal 4), while remaining accessible, responsive, and free of any front-end
framework or Node build step (Non-Goals). We need a structure that delivers this inside Hugo's template
system. This supersedes [ADR-0004](0004-data-driven-component-architecture.md), which decided the same
model for Jekyll before the site migrated to Hugo.

## Decision

We will keep page **content** in [`data/`](../../data/) YAML files (`features`, `repos`, `nav`,
`footer`) and the home-page hero in [`content/_index.md`](../../content/_index.md) front matter, and
render it through small, reusable [`layouts/partials/`](../../layouts/partials/) templates composed by
the layouts in [`layouts/_default/`](../../layouts/_default/) (`baseof` → `single`/`list`) and the
home-page template [`layouts/index.html`](../../layouts/index.html). Styling lives in a single
hand-authored CSS file driven by design tokens
([`static/assets/css/hivevm.css`](../../static/assets/css/hivevm.css)); interactivity lives in one
dependency-free, `defer`-loaded script ([`static/assets/js/site.js`](../../static/assets/js/site.js))
that only *enhances* server-rendered HTML (mobile menu, tabs, reveal-on-scroll) via `data-*` hooks. No
CSS or JS framework and no bundler are introduced.

## Alternatives considered

- **Content hard-coded in HTML templates** — simplest to start, but every content change means editing
  markup, violating the content-only-edit goal and inviting inconsistency.
- **A CSS framework (Tailwind, Bootstrap)** — speeds prototyping, but pulls in a Node/PostCSS build step
  (Tailwind) or heavy global CSS (Bootstrap), both ruled out by the Non-Goals; a single token-driven
  stylesheet keeps the "dark glow" design coherent and dependency-free.
- **A JS framework / islands (React, Vue, Svelte)** — overkill for a few progressive enhancements,
  reintroduces a build step, and risks content that needs JS to render, breaking the resilient-core goal.
- **Hugo page bundles / content types for the tool and repo lists instead of `data/`** — content types
  suit per-item pages; the tools and repos are small fixed lists rendered inline on the home page, for
  which flat `data/` YAML is simpler.

## Sources / Prior art

- Hugo data templates, partial templates and base templates —
  <https://gohugo.io/templates/data-templates/>, <https://gohugo.io/templates/partial/>,
  <https://gohugo.io/templates/base/>.
- Progressive enhancement (core content works without JS) — MDN,
  <https://developer.mozilla.org/en-US/docs/Glossary/Progressive_Enhancement>.
- Using `data-*` attributes as scripting hooks — MDN,
  <https://developer.mozilla.org/en-US/docs/Learn/HTML/Howto/Use_data_attributes>.

## Consequences

- Positive: content edits are low-risk YAML/Markdown changes a non-developer can make; one source of
  truth per section; the site renders fully without JS; no framework upgrades, supply chain, or build
  step to maintain; the design stays consistent through shared tokens.
- Negative / trade-offs: the hand-authored CSS is large and centralized (changes need care); richer
  interactivity must be written in vanilla JS by hand; the `data/` schemas are an informal contract the
  partials depend on (a renamed key silently breaks a section).
- Follow-ups: if interactivity outgrows vanilla JS, or content outgrows flat data files, revisit with a
  new ADR (e.g. adopting Hugo page bundles or a minimal build step) rather than editing this one.
