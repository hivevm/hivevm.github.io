# ADR-0003: Static website with Jekyll on GitHub Pages at a custom domain

- **Status:** ⚪ superseded by [ADR-0005](0005-hugo-github-pages-site.md)
- **Date:** 2026-06-20
- **Deciders:** Maintainer
- **Note:** Documents a decision already embodied in [`_config.yml`](../../_config.yml),
  [`Gemfile`](../../Gemfile) and [`CNAME`](../../CNAME). Written retroactively so the project follows
  its own method; awaiting maintainer acceptance.

## Context

The specification ([`docs/SPECIFICATION.md`](../SPECIFICATION.md)) requires a fast, accessible,
low-maintenance public website for HiveVM that **deploys natively** with no servers, database, or
external CI to babysit (Goals 3 and 4), and is served at the custom domain `hivevm.org`. The website is
content-heavy but fully static — tools, a repository showcase, and a Markdown blog. We need to choose the
static site generator and the hosting/publishing mechanism, a choice that is costly to reverse once
content, URLs, and the custom domain are committed.

## Decision

We will build the site as a **Jekyll** site and publish it through **GitHub Pages' native build** from
the `main` branch, served at the custom domain declared in [`CNAME`](../../CNAME) (`hivevm.org`). We pin
the toolchain to the [`github-pages`](https://github.com/github/pages-gem) gem so local previews match
production, use only Pages-supported features (kramdown + Rouge, no custom plugins), and keep blog URLs
pretty via the `permalink` setting. No Node toolchain or external build pipeline is part of deployment.

## Alternatives considered

- **GitHub Pages with a GitHub Actions build (custom Jekyll/plugins)** — unlocks arbitrary plugins, but
  adds a CI workflow to maintain and breaks the "native, nothing to babysit" goal; not needed for the
  current content.
- **Other static generators (Hugo, Astro, Eleventy)** — capable, but Hugo/Eleventy/Astro are not built
  natively by GitHub Pages (would require an Actions pipeline), and Astro/Eleventy reintroduce a Node
  build step the specification rules out as a Non-Goal.
- **A SPA / server-rendered framework (Next.js, etc.)** — violates the static, no-backend,
  no-Node-build-step Non-Goals and the resilient-core goal; far heavier than the content warrants.
- **Plain hand-written HTML, no generator** — no templating, layouts, or data files, so the
  data-driven content goal (Goal 2) and a Markdown blog become painful to maintain.

## Sources / Prior art

- Jekyll documentation — <https://jekyllrb.com/docs/>.
- GitHub Pages: about, supported versions, and the `github-pages` gem —
  <https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll> and
  <https://github.com/github/pages-gem>.
- Managing a custom domain for GitHub Pages (the `CNAME` file) —
  <https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site>.

## Consequences

- Positive: zero-maintenance deploys (push to `main` → live), free hosting on a CDN, local previews that
  match production, and Markdown-first authoring that fits HiveVM's modelling ethos.
- Negative / trade-offs: limited to Pages-supported plugins and Jekyll/Liquid; no server-side logic;
  the `github-pages` gem dictates the Jekyll version; the Dev Container must add a Ruby toolchain for
  local previews (the base image ships none — see [ADR-0002](0002-dev-container-runtime.md)).
- Follow-ups: how content is structured *within* Jekyll (data files, includes, hand-authored CSS,
  dependency-free JS) is decided separately in
  [ADR-0004](0004-data-driven-component-architecture.md). If future needs require custom plugins,
  supersede this ADR with one adopting a GitHub Actions build.
