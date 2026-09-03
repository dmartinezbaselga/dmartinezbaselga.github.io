# Academic website

This repository is a clean starting point for a faculty website based on [Academic Pages](https://github.com/academicpages/academicpages.github.io). It retains the standard Jekyll theme, responsive navigation, author sidebar, publication and teaching collections, and GitHub Pages-compatible dependencies. The imported theme baseline is upstream commit `a4386d8` (2026-08-16).

All visible demo material has been removed. Text such as `Your Name`, `YOUR-USERNAME`, and `Research topic one` is intentional placeholder content; search for `Your`, `YOUR-`, `placeholder`, and `example` before publishing.

## First-time setup

1. In `_config.yml`, replace the site title, description, `url`, `repository`, author name, title/affiliation, location, email, and profile links.
2. If this is your main GitHub Pages site, name the GitHub repository `USERNAME.github.io`, set `url: "https://USERNAME.github.io"`, and keep `baseurl: ""`.
3. If it is a project site, set `url: "https://USERNAME.github.io"` and `baseurl: "/REPOSITORY"`.
4. Replace the placeholder text and image described below.

## Where to edit content

| Content | File or directory |
| --- | --- |
| Biography and short research statement | `_pages/about.md` |
| Name, title/affiliation, email, and profile links | `_config.yml` |
| Profile photo | replace `images/profile.png` with a square image using the same filename, or change `author.avatar` in `_config.yml` |
| Research topics/projects | `_data/research.yml` |
| Publications | one Markdown file per paper in `_publications/`; start from `_templates/publication.md` |
| Student recruitment text, current students, and alumni | `_data/people.yml` |
| Teaching courses | `_data/teaching.yml` |
| Resume page | `_pages/resume.md` |
| PDF CV | add or replace `files/cv.pdf`, then set `cv_pdf: /files/cv.pdf` in `_config.yml` |
| Main navigation | `_data/navigation.yml` |
| Small site-specific CSS changes | `_sass/_custom.scss` |

### Adding a publication

Copy `_templates/publication.md` into `_publications` and give it a descriptive dated filename, for example `_publications/2026-08-article-short-title.md`. Set `category` to one of `preprints`, `journals`, `conferences`, or `workshops`. Set `date` to the publication date (or anticipated date for a preprint); entries are sorted from newest to oldest within each category. The `paperurl`, `codeurl`, and `videourl` fields are independent and optional, and blank fields do not render. Put locally hosted PDFs or supplementary files in `files/` and link to them as `/files/filename.pdf`.

Write your name as `Martinez-Baselga, D.` in the `authors` field; that exact text is automatically italicized by the publication renderer.

Publication records remain content files: nothing should be hard-coded into a layout. `_pages/publications.html` groups them, and the small custom include `_includes/publication-single.html` controls only their presentation.

### Adding people

Edit `_data/people.yml`. Copy one of its commented examples into `current_students` or `alumni`, preserving two-space YAML indentation. Current students support name, starting year, affiliation, degree type, and an optional URL. Alumni additionally support ending year and next position.

### Adding courses

Edit `_data/teaching.yml`. Add courses under `current_courses` or `past_courses`, preserving two-space YAML indentation. Each course has only `name`, `years`, and `program`; no links are rendered. Use a value such as `"2025–present"` for an ongoing course and `"2022–2024"` for a past course.

## Preview locally

Ruby 3.2 and Bundler are recommended (matching the included container and CI workflow). From the repository root:

```bash
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll serve --livereload
```

Open <http://localhost:4000>. Restart the server after changing `_config.yml`. To perform the same production checks used by CI:

```bash
JEKYLL_ENV=production bundle exec jekyll build --strict_front_matter
ruby scripts/check_internal_links.rb _site
```

If a local Ruby installation is inconvenient, use the included upstream Docker setup instead:

```bash
docker compose up --build
```

Then open <http://localhost:4000>; press <kbd>Ctrl</kbd>+<kbd>C</kbd> to stop it.

## GitHub Pages deployment

For the simplest deployment, push the site to the repository's default branch, then open **Settings → Pages**, choose **Deploy from a branch**, and select the default branch and `/ (root)`. GitHub Pages runs its supported Jekyll build whenever that branch changes. The workflow in `.github/workflows/build.yml` independently checks every push and pull request; it validates the site but does not deploy or require additional credentials.

A user-site repository named `USERNAME.github.io` is published at `https://USERNAME.github.io/`. A project repository is normally published at `https://USERNAME.github.io/REPOSITORY/`. Custom domains can be configured later in GitHub Pages settings.

Do not commit `_site`, `vendor`, `.bundle`, or local caches; `.gitignore` already excludes them. Keep PDF filenames stable when possible so links in CVs, email, and search results continue to work.

## Template maintenance

The theme is kept close to Academic Pages. Personal content is concentrated in `_pages`, `_publications`, `_data`, `images`, and `files`; local styling is in `_sass/_custom.scss`. This separation makes future upstream comparison or selective updates easier. The Academic Pages and Minimal Mistakes licensing notice is preserved in `LICENSE`.
