# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

HiveVM corporate landing page — a static GitHub Pages site at hivevm.org. Showcases three products: a parser generator (LL(k)), a markdown-based documentation generator, and Gradle CI/CD workflow tools.

## Build Commands

```bash
./gradlew build    # Build documentation (converts md/ files to PDF via org.hivevm.doc plugin)
./gradlew clean    # Clean build artifacts
./gradlew tasks    # List available tasks
```

The Gradle build uses the `org.hivevm.doc` v1.1.2 plugin with template `template/draft.ui.xml` and source directory `md/`.

## Architecture

- **Static single-page site**: `index.html` is the main (and only) page, served via GitHub Pages with Jekyll disabled (`.nojekyll`)
- **Frontend stack**: Bootstrap CSS, jQuery 2.1.0, Owl Carousel, ScrollReveal, vanilla JS
- **Custom JS**: `assets/js/custom.js` — handles smooth scrolling, mobile menu toggle, section-based nav highlighting, preloader, and counter animations
- **Custom CSS**: `assets/css/hivevm.css` — all project-specific styles
- **Markdown content**: `md/` directory contains documents processed by Gradle into PDFs using the XML template in `template/draft.ui.xml`
- **Legal pages**: `policy.md` and `terms.md` (privacy policy and terms for mobile app)

## Git Branches

- `main` — primary branch, deployed to GitHub Pages
- `feature/about`, `feature/landing` — feature branches
