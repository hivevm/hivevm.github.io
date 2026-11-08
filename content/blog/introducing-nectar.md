---
title: "Nectar: one Markdown source, a website and a PDF"
date: 2026-11-08
author: HiveVM
description: >-
  Why HiveVM replaced two documentation tool chains with one Rust engine that turns the
  same Markdown into a website and a PDF.
---

Projects like to keep their documentation as Markdown in the repository, next to the code.
Readers then want it in two forms: a website to read and link, and a PDF to hand out, print
or archive.

HiveVM used to get those from two tool chains. Hugo with a theme built the websites, and a
Gradle plugin built the PDFs through Apache FOP, with a Markdown dialect of its own. Over time
the two outputs drifted apart in diagrams, highlighting and includes, and in what raw HTML or a
page break means.

**Nectar** replaces both with one engine, written in Rust. You write the documentation once and
publish both outputs from the same document model.

## From a file to a PDF

A single Markdown file needs no configuration at all:

```bash
nectar build notes.md
```

That writes `notes.pdf` next to the file. A full project is a directory with a `nectar.toml`:

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

A link to another Markdown file that stands alone on its line includes that file as a chapter,
so a manual can stay a folder of small files and still read as one document.

## What goes into a document

- **Highlighted code** — every language with a TextMate grammar, from `rust` and `java` to
  `yaml` and `sql`.
- **Diagrams** — the info string of a code block picks the engine. `railroad` draws railroad
  diagrams from (E)BNF and `rough` redraws an SVG in a hand-drawn style. `dot` and `uml` go
  through Graphviz and PlantUML once those are configured.
- **A print view** — each document also gets one, with the PDF built from the same model as the
  website: cover, contents with page numbers, running headers and footnotes.

## Built to be trusted with your sources

A few rules shape how Nectar behaves:

- **Nothing disappears silently.** When the PDF cannot show an element, such as raw HTML,
  Nectar reports a warning with file and line. When a diagram program is missing, the block stays
  plain code and you get a warning too.
- **Builds are repeatable.** The goal is that the same sources and configuration give
  byte-identical output, so a build can be diffed and cached.
- **Nectar stays inside the project.** A link, include or image that points outside the project
  root is not followed; it is reported with file and line.

## Runs where the documentation is

Nectar ships as a command line for Linux, macOS and Windows. The core and the renderers keep
everything that depends on the host, such as files, threads and web requests, behind ports. That
keeps them free of the technology behind those effects and lets them link for WebAssembly, the
basis for previewing and rendering documentation where it is edited.

Nectar is deliberately not a general static site generator. It has no blog, no taxonomies and no
arbitrary content types, and it reads Markdown in its own dialect only.

## How it fits HiveVM

HiveVM's idea is *model once, run anywhere*. For documentation, the Markdown is the model and the
website and the PDF are what follows from it. Change the source once and both outputs follow.

## Where to go next

Download a build from the [releases](https://github.com/hivevm/nectar/releases), read the
[Nectar guide](https://github.com/hivevm/nectar/blob/main/docs/guide/GUIDE.md), or browse the
[source on GitHub](https://github.com/hivevm/nectar).
