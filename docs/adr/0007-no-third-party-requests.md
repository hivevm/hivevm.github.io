# ADR-0007: No third-party requests from the pages, on GitHub Pages

- **Status:** 🟢 accepted
- **Date:** 2026-11-08
- **Deciders:** Maintainer

## Context

The site is run privately from Italy and has to conform to EU law. Courts treat a dynamic IP address as
personal data: LG München I (3 O 17493/20, 2022-01-20) awarded damages against a site that passed it to
Google by loading Google Fonts.

Visitors' IP addresses can leave the site in two ways:

1. **Resources the pages load from other hosts.** Google Fonts was the only one. The site now hosts its
   fonts itself, and everything else that points off-site is a link followed only on a click. Nothing
   yet keeps this from regressing.
2. **The host itself.** GitHub's documentation states that when a GitHub Pages site is visited, "the
   visitor's IP address is logged and stored for security purposes". GitHub's privacy statement says it
   has certified to the EU–US Data Privacy Framework, which is in force but under appeal at the CJEU
   (C-703/25 P).

## Decision

We will let the pages load **no resource from any other host**, and we will **stay on GitHub Pages**
([ADR-0005](0005-hugo-github-pages-site.md) is unchanged) and disclose its logging in the privacy
policy.

## Alternatives considered

- **Move to a European static host under a Data Processing Agreement** (statichost.eu, or Hetzner web
  hosting) — keeps the IP address from a US company, but needs a migration, a DNS change and likely a
  monthly fee. The source code stays on GitHub either way and most links on the site lead there, so the
  maintainer does not consider this worth the cost for now.
- **Keep Google Fonts and ask for consent** — needs a consent banner on a site that otherwise needs
  none, and is a clear legal risk without one; the fonts' licence allows self-hosting at no cost.

## Sources / Prior art

- GitHub Pages, data collection —
  <https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages>.
- GitHub General Privacy Statement —
  <https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement>.
- LG München I, 3 O 17493/20 — <https://www.activemind.legal/guides/ruling-google-fonts/>.
- Status of the Data Privacy Framework —
  <https://www.wilmerhale.com/en/insights/blogs/wilmerhale-privacy-and-cybersecurity-law/20251201-european-court-of-justice-to-review-challenge-to-eu-us-data-privacy-framework>.
- Static hosting in Europe —
  <https://www.innoq.com/en/blog/2026/08/static-site-hosting-without-big-tech/>.
- This is an engineering record and not legal advice.

## Consequences

- Positive: no consent banner is needed for fonts or other resources; no migration or hosting cost; the
  privacy policy stays short.
- Negative / trade-offs: GitHub keeps logging visitors' IP addresses, and a fall of the Data Privacy
  Framework would reopen this decision; new features cannot embed third-party services such as video
  players or analytics without changing this ADR.
- Follow-ups: review this decision if the CJEU annuls the Data Privacy Framework; add a check that fails
  the build when a page loads a resource from another host.
