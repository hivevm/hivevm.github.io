# ADR-0005: Static website with Hugo on GitHub Pages, built by GitHub Actions

- **Status:** 🟢 accepted
- **Date:** 2026-06-21
- **Deciders:** Maintainer
- **Supersedes:** [ADR-0003](0003-jekyll-github-pages-site.md) (Jekyll on GitHub Pages' native build)
- **Note:** Documents a decision already embodied in [`hugo.toml`](../../hugo.toml),
  [`.github/workflows/hugo.yml`](../../.github/workflows/hugo.yml) and
  [`static/CNAME`](../../static/CNAME). The migration from Jekyll to Hugo is already in the repository
  history; this ADR records the decision retroactively so the project follows its own method, and awaits
  maintainer acceptance.

## Context

The specification ([`docs/SPECIFICATION.md`](../SPECIFICATION.md)) requires a fast, accessible,
low-maintenance public website for HiveVM that deploys automatically with no servers, database, or
external CI service to babysit (Goals 3 and 4), served at the custom domain `hivevm.org`. The site is
content-heavy but fully static — tools, a repository showcase, and a Markdown blog.

[ADR-0003](0003-jekyll-github-pages-site.md) (proposed, never accepted) chose **Jekyll** built by GitHub
Pages' *native* build. In practice that path proved limiting: native Pages builds are pinned to the
`github-pages` gem's Jekyll version and its allow-list of plugins, the Ruby toolchain is comparatively
heavy to reproduce in the Dev Container, and the desired "dark glow" design (adapted from Pulsar Lite) is
expressed more directly with Hugo's templating and asset pipeline. We need to settle the static site
generator and the publishing mechanism — a choice that is costly to reverse once content, URLs, and the
custom domain are committed.

## Decision

We will build the site with **Hugo (extended)** and publish it to **GitHub Pages** through a committed
**GitHub Actions** workflow ([`.github/workflows/hugo.yml`](../../.github/workflows/hugo.yml)), served at
the custom domain declared in [`static/CNAME`](../../static/CNAME) (`hivevm.org`). The workflow pins the
Hugo version (`HUGO_VERSION`), builds with `hugo --gc --minify` against the Pages base URL, and deploys
the generated `public/` via `actions/deploy-pages`. A push to `main` (or a manual `workflow_dispatch`)
builds and deploys; no Node toolchain or external CI service is part of deployment. This decision
supersedes [ADR-0003](0003-jekyll-github-pages-site.md).

## Alternatives considered

- **Jekyll on GitHub Pages' native build (ADR-0003)** — needs no workflow, but is pinned to the
  `github-pages` gem's Jekyll/plugin allow-list and a Ruby toolchain that is heavier to reproduce; the
  design and content model are expressed more directly in Hugo.
- **Hugo committed as pre-built `public/` (no workflow)** — avoids an Actions run, but commits generated
  output to the repository and makes every content edit a manual rebuild; brittle and easy to forget.
- **Other static generators (Astro, Eleventy)** — capable, but reintroduce a Node build step the
  specification rules out as a Non-Goal; Hugo is a single self-contained binary with no Node dependency.
- **A SPA / server-rendered framework (Next.js, etc.)** — violates the static, no-backend,
  no-Node-build-step Non-Goals and the resilient-core goal; far heavier than the content warrants.

## Sources / Prior art

- Hugo documentation and installation — <https://gohugo.io/documentation/>,
  <https://gohugo.io/installation/>.
- Host Hugo on GitHub Pages with Actions (official guide) —
  <https://gohugo.io/host-and-deploy/host-on-github-pages/>.
- GitHub Pages with a custom GitHub Actions build —
  <https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages>.
- Managing a custom domain for GitHub Pages (the `CNAME` file) —
  <https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site>.
- Pulsar Lite, the design the theme adapts — <https://github.com/cbetz/pulsar-lite> (MIT).

## Consequences

- Positive: automated deploys (push to `main` → live) with free CDN hosting; the Hugo version is pinned
  explicitly in the workflow rather than dictated by a gem; a single self-contained binary with no Ruby
  or Node toolchain; Hugo's templating and asset pipeline fit the design and the Markdown-first,
  modelling ethos.
- Negative / trade-offs: deployment now depends on a GitHub Actions workflow we own and must keep
  working (a step beyond Pages' fully native build); the Hugo version must be bumped by hand in the
  workflow; the Dev Container must add a Hugo toolchain for local previews (the base image ships none —
  see [ADR-0002](0002-dev-container-runtime.md)).
- Follow-ups: how content is structured *within* Hugo (data files, partials, hand-authored CSS,
  dependency-free JS) is decided in [ADR-0006](0006-data-driven-hugo-content.md).
