# ADR-0008: Each tool's data lives in the front matter of its tool page

- **Status:** 🟡 proposed
- **Date:** 2026-11-10
- **Deciders:** Maintainer
- **Supersedes in part:** [ADR-0006](0006-data-driven-hugo-content.md), for the tool and repository
  lists only; everything else in ADR-0006 stays in force.

## Context

The specification asks for one coherent entry point that presents every tool (Goal 1) and for
content-only edits, in a [`data/`](../../data/) YAML file *or* in front matter (Goal 2).

Today the facts about one tool are kept in up to five places, and they have drifted apart:

| Fact | Where it is kept |
|------|------------------|
| Function and codename | `data/features.yml` (`title`), `data/footer.yml` (`label`), tool page (`kind`, `title`) |
| Short description | `data/features.yml` (`body`), `data/repos.yml` (`body`), tool page (`description`, `tagline`) |
| Language, licence, link | `data/repos.yml`, `data/footer.yml`, `data/features.yml` (`repo`) |
| Role (Derive, Govern, …) | `data/features.yml` only |

The footer lists four of the six tools, and Ocelli is described with two platforms on the home page
and three on its tool page. [ADR-0006](0006-data-driven-hugo-content.md) chose flat `data/` YAML for
the tool lists and rejected Hugo content types for them because "the tools and repos are small fixed
lists rendered inline on the home page". Since then every tool has got a tool page in
[`content/tools/`](../../content/tools/), so a page per tool exists anyway, and that reason no longer
holds.

## Decision

We will keep every fact about a tool in the **front matter of its tool page**
(`content/tools/<repository name>.md`) and nowhere else, and every place that shows a tool — the home
page, `/tools/`, the footer and the page's own meta description — will read it from there through
`site.GetPage "/tools"`. The fields are:

| Field | Meaning |
|-------|---------|
| `title` | Codename, e.g. `Waggle` |
| `kind` | Function, e.g. `Parser generator` |
| `role` | Key of the role in `data/roles.yml`: `derive`, `govern`, `review` or `build-on` |
| `description` | Lead sentence: card text, `/tools/` entry and meta description |
| `tagline` | Short phrase after the codename in the `/tools/` list |
| `lang`, `lang_color` | Main language of the repository and its colour |
| `license` | SPDX identifier |
| `status` | `release`, `build-from-source` or `template`, set from the repository on GitHub |
| `repo` | Repository URL |
| `weight` | Order within the site |

The roles — label, one-line intro and order — are not facts about one tool and stay in a new data file,
`data/roles.yml`. `data/features.yml` and `data/repos.yml` and the tool column of `data/footer.yml`
are removed. Adding a tool remains a single Markdown file.

## Alternatives considered

- **One data file, `data/tools.yml`** — stays inside ADR-0006, but the tool page would still need its
  own `title` and `description` for Hugo's page title, `/tools/` list and meta description, so the
  codename and the lead would be kept twice, or the templates would have to look every page up in the
  data file to replace Hugo's built-in fields.
- **Keep the current files and fix the texts** — cheapest now, but the drift described above comes
  back with the next edit.
- **Page bundles with a separate `data.yml` per tool** — one folder per tool, but more files than
  front matter for the same content, with no gain on a site of six tools.

## Sources / Prior art

- Hugo front matter, including `title`, `description`, `weight` and custom parameters read as
  `.Params` — <https://gohugo.io/content-management/front-matter/>.
- Hugo data sources and their trade-offs against content files —
  <https://gohugo.io/content-management/data-sources/>.
- `site.GetPage` and ranging over a section's pages —
  <https://gohugo.io/methods/site/getpage/>, <https://gohugo.io/methods/page/pages/>.
- Grouping pages by a parameter — <https://gohugo.io/quick-reference/page-collections/> and
  `GroupByParam`, <https://gohugo.io/methods/pages/groupbyparam/>.

## Consequences

- Positive: one place per tool; the footer, the home page and `/tools/` cannot disagree any more; a
  new tool is one Markdown file, as the specification already says; Hugo's own `title`, `description`
  and `weight` are used rather than mirrored.
- Negative / trade-offs: the tool list is content, not data, so the specification's list of data files
  (`features`, `repos`) has to be updated; front matter has no schema, so a misspelt key silently drops
  a field, as with the data files before.
- Follow-ups: update the **Data file** and **Tool page** entries of
  [`docs/SPECIFICATION.md`](../SPECIFICATION.md); consider a build check that fails when a tool page
  lacks one of the fields above.
