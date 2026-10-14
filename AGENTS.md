# AGENTS.md

## What this repository is

A redirect stub and nothing else. The portfolio used to live here; it is now built
and served by GitLab Pages from the GitLab project `cgiliyar/personal-webpage`
(<https://cgiliyar.gitlabpages.inria.fr/>). This repository only forwards traffic.

## Commands

- No dependencies, no build, no scripts. The root of `main` is published verbatim.
- Preview locally (optional, nothing committed for it): `python3 -m http.server 8080`
- Deploy: push to `main`. GitHub publishes the branch itself; see `README.md` for the
  optional GitHub Actions route.

## Layout

- `index.html` — forwards `/` to the new site.
- `404.html` — forwards any deep link to the same path on the new host.
- `.nojekyll` — turns off Jekyll processing on GitHub Pages. Without this file GitHub
  renders `README.md` as the homepage instead of `index.html`.
- `robots.txt` — allows crawling so bots can read the `noindex` tags.
- `.github/workflows/pages.yml` — optional Actions deployment; skipped unless the
  repository variable `pages_source` is set to `actions`.

## Rules

- **Never push this branch to GitLab.** It would delete the real site.
- Keep both HTML pages self-contained (inline styles, no external assets): they must
  work with no build step and no network access to this repository's old files.
- Do not restore the Astro project, `src/`, `public/`, `scripts/` or the publication
  fetcher here; that work belongs in `cgiliyar/personal-webpage`.
