# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based blog site called "Some words" - a personal blog for writing about technology, people, and life in general. The site uses the default Jekyll setup with the Minima theme.

## Common Commands

### Development Server
```bash
bundle exec jekyll serve
```
Starts the Jekyll development server with live reload.

### Build Site
```bash
bundle exec jekyll build
```
Builds the static site to `_site/` directory.

### Install Dependencies
```bash
bundle install
```
Installs all Ruby gem dependencies specified in the Gemfile.

### Update Dependencies
```bash
bundle update
```
Updates all gems to their latest compatible versions.

## Architecture

- **Jekyll Static Site Generator**: Uses Jekyll 4.3.4 with Ruby gems
- **Theme**: Minima theme (default Jekyll theme)
- **Content Structure**:
  - `_posts/`: Blog post markdown files with YAML front matter
  - `_config.yml`: Site configuration and metadata
  - `index.markdown`: Home page
  - `about.markdown`: About page
  - `404.html`: Custom 404 error page

### Post Structure
Posts follow Jekyll naming convention: `YYYY-MM-DD-title.md` and include:
- YAML front matter with layout, title, date, categories
- Markdown content

### Configuration
Site settings in `_config.yml` include title, description, social links, and build settings. The site uses the `jekyll-feed` plugin for RSS generation.

## File Organization

- Blog posts are stored in `_posts/` directory
- Static pages use `.markdown` extension
- Jekyll builds output to `_site/` (ignored by git)
- Standard Jekyll cache directories are gitignored