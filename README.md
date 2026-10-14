# chaithyagr.github.io — the site has moved

This repository no longer contains the portfolio. It exists only to send visitors
to its current home:

**<https://cgiliyar.gitlabpages.inria.fr/>**

The site's source (Astro templates, Markdown content, publication fetcher) lives in
the GitLab project `cgiliyar/personal-webpage`:
<https://gitlab.inria.fr/cgiliyar/personal-webpage>.

## How the redirect works

GitHub Pages for a `*.github.io` site cannot answer with an HTTP 301, so the whole
published site is the two static pages at the root of this repository:

| Path | Behaviour |
| --- | --- |
| `/` | Forwards to <https://cgiliyar.gitlabpages.inria.fr/> |
| any other path | GitHub serves `404.html`, which forwards to the *same* path on the new host (`/publications/foo/` → `…/publications/foo/`), keeping query strings and fragments. Build assets, feeds and sitemaps left over from the old Astro build have no equivalent there, so they land on the front page instead. |

Each page uses `window.location.replace` (so the redirect page never lands in the
browsing history), a `<meta http-equiv="refresh">` fallback for clients without
JavaScript, plus `rel="canonical"` and `noindex` so search engines consolidate onto
the GitLab site. `robots.txt` allows crawling on purpose — crawlers have to
reach the pages to read those tags.

## Deployment

Pages for this repository publishes the `main` branch itself, so a push is all that
is needed — there is no build step, no Node.js and no Python. `.nojekyll` at the root
matters: without it, GitHub runs Jekyll over the branch and renders `README.md` into
`index.html` in place of the redirect page.

To publish from GitHub Actions instead, set Pages (Settings → Pages → Build and
deployment) to "GitHub Actions" and create the repository variable
`pages_source` = `actions`; `.github/workflows/pages.yml` then uploads these same
files as a Pages artifact. The workflow is skipped while that variable is absent.

## Warning: do not push this branch to GitLab

`main` here holds nothing but the redirect. Pushing it to `cgiliyar/personal-webpage`
would delete the real site. Edit the portfolio in that project instead.
