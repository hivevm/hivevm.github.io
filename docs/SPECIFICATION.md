# Specification — HiveVM Website

> The **specification** of this project: the problem it solves, where it is going, and the
> vocabulary everyone (humans and agents) must use. This document is the **constitution** —
> every Architecture Decision Record in [`adr/`](adr/) derives from it and must not contradict it.

This repository is the **public website** for HiveVM (served at [hivevm.org](https://hivevm.org)).
It is *not* the source of the HiveVM tools themselves — those live in their own repositories under the
[hivevm GitHub organization](https://github.com/hivevm). This specification therefore governs the
**website**: its purpose, content model, and quality bar. It describes the HiveVM product family only
as the subject the website presents.

## Problem

HiveVM's tools (an LL(k) parser generator, a manual generator and an agent template) are spread
across several repositories. A developer evaluating them has no single, credible place that explains
what HiveVM is, what each tool does, how the tools relate, and where to start. Project news and
explanatory writing have no home either. Without one coherent entry point, the toolkit is hard to
discover, understand, and trust.

## Mission

Give HiveVM one fast, accessible, trustworthy home on the web that explains the toolkit and routes
visitors to the right tool or article.

## Vision

[hivevm.org](https://hivevm.org) is the canonical front door to HiveVM. A visitor immediately grasps
the core idea — *model once, run anywhere*: describe an application's logic once as a model,
independent of technology and platform, and let the platform change while the model stays — sees the
three tools and how they fit together, and reaches any repository or article in a click. The site loads instantly, works
without JavaScript for its core content, reads well on any device, and is cheap to maintain: contributors
change **content** (YAML and Markdown), not page plumbing. New tools and posts slot in without
redesigning anything.

## Strategy

Build a **static** site with [Hugo](https://gohugo.io/) and publish it to **GitHub Pages** at the custom
domain through a committed **GitHub Actions** workflow — no servers, no databases, and no external CI
service to babysit (see [ADR-0005](adr/0005-hugo-github-pages-site.md)). Keep content **data-driven**: page
sections render from [`data/`](../data/) YAML and reusable [`layouts/partials/`](../layouts/partials/)
partials, so editing content never means touching layout (see
[ADR-0006](adr/0006-data-driven-hugo-content.md)). Author the styling by hand (one CSS file) and keep
interactivity in dependency-free JavaScript, so there is no front-end framework or Node build step to
maintain. Write the blog in CommonMark Markdown, mirroring how HiveVM's own tooling treats Markdown as a
first-class source.

## Core Concepts & Vocabulary

Define the key terms of the domain. Use these exact words consistently in code, comments,
documentation, and ADRs.

- **HiveVM** — tools and projects for *model-driven software development*: an application — its
  application and business logic — is described once as a model and runs independent of technology and
  platform (site tagline: *Model once, run anywhere*). Also the name of the model-driven application
  platform in Rust and of the GitHub organization that hosts the tools. The website's subject.
- **Modelling** — HiveVM's organizing principle: describe a model once (a grammar, a document set, a
  specification) and derive what follows from it. Spelled *modelling* (British).
- **Tool** — one member of the HiveVM family, each in its own repository:
  - **Parser Generator — Waggle** (`waggle`, formerly `cc`) — an LL(k) parser generator that emits a
    parser and full AST for Java, C++ & Rust from a single grammar file (extension `.waggle`). Named
    after the bees' *waggle dance*, a grammar the other bees parse.
  - **Manual Generator** (`doc`) — turns a folder of CommonMark Markdown into one coherent manual.
  - **Agent Template — NUC** (`nuc`) — a starting point for building software with coding agents inside
    a ready-to-use Dev Container, driven by a written specification and ADRs. Named after the beekeeping
    *nucleus colony*, the small starter colony a full hive grows from.
- **Site** — this Hugo project as a whole (everything published to hivevm.org).
- **Layout** — a page template in [`layouts/`](../layouts/) (e.g. `_default/baseof`, `_default/single`,
  `_default/list`, `index`).
- **Partial** — a reusable HTML template in [`layouts/partials/`](../layouts/partials/) (e.g. `nav`,
  `footer`, `logo`, and the `home/*` sections) composed into a page.
- **Data file** — a YAML file in [`data/`](../data/) holding the *content* a section renders
  (features, repos, nav, footer); editing it changes the page without touching markup.
- **Post** — a blog entry in [`content/blog/`](../content/blog/), authored in Markdown with the date in
  front matter; the URL becomes `/blog/<filename>/`.
- **Design tokens** — the CSS custom properties in
  [`static/assets/css/hivevm.css`](../static/assets/css/hivevm.css) ("dark glow" theme with a light
  variant; the nav toggle offers light, dark or system, dark by default) that define the site's surfaces,
  colours and type.

## Goals / Success Criteria

What must be true for this project to be considered successful? Write criteria that can be
used as acceptance criteria.

1. **One coherent entry point.** The home page states what HiveVM is, presents all three tools, and
   links each to its repository and to the GitHub organization.
2. **Content-only edits.** Adding or changing a tool card, repository entry, nav item, or footer link is
   done by editing a [`data/`](../data/) YAML file or front matter — no layout/markup changes
   required. Adding a blog post is a single Markdown file in [`content/blog/`](../content/blog/).
3. **Automated build & deploy.** A committed GitHub Actions workflow builds the site with Hugo and
   deploys it to GitHub Pages from `main`, at the domain in [`static/CNAME`](../static/CNAME), with no
   external CI service, manual build step, or Node toolchain required to deploy.
4. **Resilient core.** All primary content (tools, repositories, blog) is readable with JavaScript
   disabled; JavaScript only enhances (mobile menu, tabs, reveal-on-scroll).
5. **Accessible & responsive.** Keyboard-navigable with a skip link, meaningful landmarks/labels, and a
   layout that works from mobile to desktop.
6. **Consistent docs.** `scripts/check-docs.sh` passes — the ADR index is in sync and every relative
   Markdown link resolves.

## Non-Goals

What this project explicitly does not try to do — to keep scope clear.

- **Not the tools.** This repository hosts no tool source code, releases, or API documentation for
  `waggle`, `doc`, or `nuc`; those live in their own repositories.
- **No server-side features.** No backend, database, authentication, comments, search index, or
  dynamic personalization — the site is fully static.
- **No front-end framework or Node build step.** No React/Vue/Svelte, no bundler, no CSS framework;
  styling is hand-authored and JS is dependency-free.
- **Not a general CMS.** Content structure is purpose-built for HiveVM, not a configurable platform.
