# HiveVM — Project Website

[![Docs & ADR checks](https://github.com/mbrigl/template/actions/workflows/docs-check.yml/badge.svg)](https://github.com/mbrigl/template/actions/workflows/docs-check.yml)

The public website for **[HiveVM](https://hivevm.org)**, served at [hivevm.org](https://hivevm.org).
It is a static [Hugo](https://gohugo.io/) site — a dark "glow" design (adapted from
[Pulsar Lite](https://github.com/cbetz/pulsar-lite)) with HiveVM's yellow branding — built by a
**GitHub Actions** workflow and deployed to **GitHub Pages**. It presents the HiveVM project to
visitors and hosts the project blog.

This repository is also an **agentic, specification-oriented** project: the work is driven by a
written **specification** ([`docs/SPECIFICATION.md`](docs/SPECIFICATION.md)) and
**Architecture Decision Records** ([`docs/adr/`](docs/adr/)), and runs inside a ready-to-use
Dev Container so coding agents and humans share one reproducible environment.

> For agent instructions, see [`AGENTS.md`](AGENTS.md) — the single source of truth for all coding agents.

## Overview

This repository **is the website** — not the HiveVM tools, which live in their own repositories under
the [hivevm GitHub organization](https://github.com/hivevm). Its job is narrow and well-defined:

- Give HiveVM one coherent entry point that explains what the project is and routes visitors to the
  right repository.
- Host the project blog, authored in Markdown.
- Deploy itself: a push to `main` triggers the GitHub Actions workflow that builds with Hugo and
  publishes to GitHub Pages — no servers or external CI service to maintain.

Content is **data-driven** — contributors edit YAML and Markdown, not page markup. The full problem
statement, goals, and vocabulary live in [`docs/SPECIFICATION.md`](docs/SPECIFICATION.md); the key
design decisions are recorded as [ADRs](docs/adr/).

## Prerequisites

- [VS Code](https://code.visualstudio.com/) with the
  [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
  extension — or any DevContainer-compatible IDE
- Docker / Podman (rootless) available on the host
- To preview the site locally: **Hugo (extended)**, v0.128+ (the base Dev Container image ships no
  language toolchain — see [Build, Test & Run](#build-test--run))

## Getting Started

1. Open the repository in VS Code and choose **Reopen in Container** — the Dev Container and
   preconfigured agent extensions build automatically.
2. Authenticate your coding agent inside the container (for Claude Code: `claude login`).
3. Install Hugo (extended) in the container if you want to preview the site (see below).
4. Run `hugo server` and open the local preview at <http://localhost:1313/>.
5. Edit content (mostly in [`data/`](data/) and [`content/`](content/)) and start working with the agent.

## Build, Test & Run

This is a [Hugo](https://gohugo.io/) site. A push to `main` is built and deployed by the GitHub Actions
workflow [`.github/workflows/hugo.yml`](.github/workflows/hugo.yml); the Hugo version is pinned there
(`HUGO_VERSION`). No Node toolchain is involved: the CSS is hand-authored
([`static/assets/css/hivevm.css`](static/assets/css/hivevm.css)) and the JavaScript is dependency-free
([`static/assets/js/site.js`](static/assets/js/site.js)).

The Dev Container base image ships no Hugo toolchain, so install **Hugo (extended)** first (e.g. add the
[`hugo` Dev Container Feature](https://github.com/devcontainers/features/tree/main/src/hugo) or follow the
[Hugo installation guide](https://gohugo.io/installation/)).

- **Serve (local preview):** `hugo server` — serves at <http://localhost:1313/> with live reload.
- **Build:** `hugo --gc --minify` — output goes to `public/` (git-ignored).
- **Docs/ADR checks:** `bash scripts/check-docs.sh` — verifies the ADR index and relative Markdown
  links (also enforced in CI via [`.github/workflows/docs-check.yml`](.github/workflows/docs-check.yml)).

> Production deploys happen automatically: pushing to `main` triggers the Hugo build and GitHub Pages
> deployment, served at the custom domain in [`static/CNAME`](static/CNAME). You can also trigger the
> workflow manually from the **Actions** tab (`workflow_dispatch`). See
> [ADR-0005](docs/adr/0005-hugo-github-pages-site.md).

## Usage

Most content is **data-driven** — edit YAML and Markdown rather than HTML:

- **Tool cards / feature grid:** [`data/features.yml`](data/features.yml)
- **Repository showcase:** [`data/repos.yml`](data/repos.yml)
- **Navigation & footer:** [`data/nav.yml`](data/nav.yml), [`data/footer.yml`](data/footer.yml)
- **Home page hero:** front matter (`hero_*`) in [`content/_index.md`](content/_index.md)
- **Blog posts:** add a Markdown file to [`content/blog/`](content/blog/) named `title.md`

For example, to add a blog post:

```markdown
---
title: "My post title"
date: 2026-06-20
author: HiveVM
description: One-line summary used for SEO and the blog index card.
---

Your CommonMark content here.
```

It appears automatically on [`/blog/`](content/blog/) and at `/blog/my-post-title/`. The rationale behind
the data-driven, partial-based structure is recorded in
[ADR-0006](docs/adr/0006-data-driven-hugo-content.md).

## Project Layout

```
README.md                 # overview & setup for humans
AGENTS.md                 # single source of truth for coding agents
hugo.toml                 # Hugo site configuration (title, params, markup)
content/
  _index.md               # home page — hero text lives in the front matter
  blog/                   # blog posts (Markdown) + blog index (_index.md)
layouts/
  _default/               # page skeletons: baseof, single (post), list (blog index)
  index.html              # home page — assembles the home partials
  partials/               # reusable HTML partials (nav, footer, logo, home/*)
data/                     # data-driven content (features, repos, nav, footer)
static/
  assets/                 # hand-authored CSS, dependency-free JS, images, favicons
  CNAME                   # custom domain for GitHub Pages (hivevm.org)
docs/SPECIFICATION.md     # the specification: problem, goals, vocabulary
docs/adr/                 # Architecture Decision Records (+ template)
scripts/check-docs.sh     # ADR-index & relative-link consistency checks (run in CI)
.github/workflows/        # hugo.yml (build & deploy) and docs-check.yml
.devcontainer/            # Dev Container definition (base image + Features)
.vscode/                  # shared editor settings
.claude/CLAUDE.md         # pointer for Claude Code to read AGENTS.md
```

## Dev Container

The environment is defined entirely in [`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json):
it starts from a prebuilt base image and layers Dev Container Features and VS Code extensions on top —
no Dockerfile or Compose file required (see [ADR-0002](docs/adr/0002-dev-container-runtime.md)).
Customise the environment by adding Features (e.g. the `hugo` Feature for local previews),
switching the base image, or adding extensions.

## Coding Agents

This Dev Container preinstalls the **Claude Code** and **Mistral Vibe** VS Code extensions (see
[`.devcontainer/devcontainer.json`](.devcontainer/devcontainer.json)); other agents (OpenAI Codex,
Cursor, OpenCode, GitHub Copilot) work too once you add them. Authenticate your agent inside the
container (for Claude Code: `claude login`).

The rules every agent follows live in [`AGENTS.md`](AGENTS.md); how each agent is wired to read them
is recorded in [ADR-0001](docs/adr/0001-agent-governance-model.md).

## Contributing

See [`CONTRIBUTING.md`](CONTRIBUTING.md) for the workflow (specification- and ADR-driven, small
reviewable changes) and [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md) for the community standards we
expect of everyone taking part. Security issues: please follow [`SECURITY.md`](SECURITY.md) instead
of opening a public issue.

## License

Released under the MIT License — see [`LICENSE`](LICENSE).
Design adapted from [Pulsar Lite](https://github.com/cbetz/pulsar-lite) (MIT).
