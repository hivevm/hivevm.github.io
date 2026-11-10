---
# The facts about a tool live here only (ADR-0008); the home page, /tools/ and the footer read them.
# Where the blog post used to be; old links redirect here.
aliases: ["/blog/introducing-nectar/"]
title: "Nectar"
kind: "Documentation generator"
role: derive
weight: 20
tagline: "one Markdown source, a website and a PDF"
description: >-
  A documentation generator in Rust that publishes one Markdown source as a website and a PDF from the same engine.
lang: Rust
lang_color: "#dea584"
license: BSD-3-Clause
# release | build-from-source | template. GitHub release nectar-v0.1.1, checked 2026-11-10.
status: release
repo: https://github.com/hivevm/nectar
# Shown under "In action" on the home page: the model on the left, what follows from it on the right.
example:
  model:
    file: manual.md
    lang: markdown
    code: |
      # User Manual

      Published as a **website** and a **PDF**.

      [Getting started](./start.md)
      [Configuration](./config.md)
      [Grammar reference](./grammar.md)
  result:
    file: terminal
    lang: console
    code: |
      $ nectar build
      # writes the site, the print view and the PDF to public/
---

Projects like to keep their documentation as Markdown in the repository, next to the code. Readers
then want it in two forms: a website to read and link, and a PDF to hand out, print or archive.

HiveVM used to get those from two tool chains: Hugo with a theme for the websites, and a Gradle plugin
with Apache FOP and a Markdown dialect of its own for the PDFs. Over time the two outputs drifted apart
in diagrams, highlighting and includes, and in what raw HTML or a page break means. Nectar replaces
both with one engine, written in Rust. You write the documentation once and publish both outputs from
the same document model.

## From a file to a PDF

A single Markdown file needs no configuration at all. This writes `notes.pdf` next to the file:

```bash
nectar build notes.md
```

A full project is a directory with a `nectar.toml`:

```toml
title = "My Manual"

[[document]]
source = "content/manual.md"
```

Two commands cover daily work:

```bash
nectar serve    # http://127.0.0.1:1313/, reloads on every change
nectar build    # writes the site, the print view and the PDF to public/
```

A link to another Markdown file that stands alone on its line includes that file as a chapter, so a
manual can stay a folder of small files and still read as one document.

## What goes into a document

- **Highlighted code** in every language with a TextMate grammar, from `rust` and `java` to `yaml` and
  `sql`.
- **Diagrams**, chosen by the info string of a code block: `railroad` draws railroad diagrams from
  (E)BNF, and `rough` redraws an SVG in a hand-drawn style. `dot` and `uml` go through Graphviz and
  PlantUML once those are configured.
- **A print view** for each document, with the PDF built from the same model as the website: cover,
  contents with page numbers, running headers and footnotes.
- **An EPUB** on request.

## Built to be trusted with your sources

- **Nothing disappears silently.** When the PDF cannot show an element, such as raw HTML, Nectar
  reports a warning with file and line. When a diagram program is missing, the block stays plain code
  and you get a warning too.
- **Builds are repeatable.** The goal is that the same sources and configuration give byte-identical
  output, so a build can be diffed and cached.
- **Nectar stays inside the project.** A link, include or image that points outside the project root
  is not followed; it is reported with file and line.

## Runs where the documentation is

Nectar ships as a command line for Linux, macOS and Windows; each release attaches builds for all
three. The core and the renderers keep everything that depends on the host, such as files, threads
and web requests, behind ports. That keeps them free of the technology behind those effects and lets
them link for WebAssembly, the basis for previewing and rendering documentation where it is edited.

Nectar is deliberately not a general static site generator. It has no blog, no taxonomies and no
arbitrary content types, and it reads Markdown in its own dialect only.

## Getting started

Download a build from the [releases](https://github.com/hivevm/nectar/releases) and read the
[Nectar guide](https://github.com/hivevm/nectar/blob/main/docs/guide/GUIDE.md). The guide's own
project is a complete one to start from.

## In HiveVM

For documentation, the Markdown is the model, and the website and the PDF are what follows from it.
Change the source once and both outputs follow.
