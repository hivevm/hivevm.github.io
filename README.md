# HiveVM — Jekyll site

The HiveVM website as a **Jekyll** project: a data-driven landing page plus a
Markdown-authored blog, both in the same dark/yellow design. Builds natively on
GitHub Pages — **no plugins, no GitHub Actions required.**

## Structure

```
.
├── _config.yml              Site settings, blog permalinks
├── index.md                 Landing page — hero text lives in its front matter
├── blog/index.html          Blog index (lists _posts)
├── _posts/                  Blog articles in Markdown (Rouge-highlighted code)
├── _layouts/
│   ├── default.html         Shell: <head>, nav, footer, scripts
│   ├── home.html            Assembles the landing sections
│   ├── post.html            Blog post (prose)
│   └── page.html            Generic Markdown page (prose)
├── _includes/
│   ├── nav.html  footer.html  logo.html
│   └── hero.html  stack.html  features.html
│       showcase.html  workflow.html  repos.html  cta.html
├── _data/
│   ├── nav.yml              Navigation links
│   ├── features.yml         The toolkit cards (text + which visual to show)
│   ├── repos.yml            The open-source repo cards
│   └── footer.yml           Footer columns
└── assets/
    ├── css/hivevm.css       Whole design + prose + syntax theme
    ├── js/site.js           Mobile menu, tabs, scroll-reveal
    └── favicon.svg · favicon.ico · apple-touch-icon.png
```

## Where the content lives (edit these)

| You want to change…              | Edit…                          |
|----------------------------------|--------------------------------|
| Hero headline / sub / buttons    | `index.md` front matter        |
| The three tool cards             | `_data/features.yml`           |
| The open-source repo cards       | `_data/repos.yml`              |
| Navigation / footer links        | `_data/nav.yml`, `_data/footer.yml` |
| A blog article                   | add a file to `_posts/`        |
| Colours / design                 | the four `--brand*` vars atop `assets/css/hivevm.css` |

The bespoke graphics (code panel, AST diagram, pipeline) are design, so they live
in the `_includes/*` templates — not in the content files.

## Run locally

```bash
bundle install
bundle exec jekyll serve
# → http://127.0.0.1:4000
```

## Deploy to GitHub Pages

1. Put these files at the **root** of `hivevm/hivevm.github.io`.
2. Keep your existing **`CNAME`** (hivevm.org) — Jekyll copies it through as-is.
3. Settings → Pages → Build from `main` (root). Native Jekyll build does the rest.

> Replacing the old single-file `index.html`? Delete it — the landing page is now
> generated from `index.md` + `_layouts/home.html`. The old `assets/css/*` and JS
> (bootstrap, owl-carousel, jQuery, hivevm.css …) are no longer used.

---
Design adapted from [Pulsar Lite](https://github.com/cbetz/pulsar-lite) (MIT).
Content & yellow branding: HiveVM.
