# DevYard – Modern Software Studio Site

Rails 7 + Tailwind single-page site showcasing DevYard’s digital products and services. Includes full-screen video hero, animated SVGs, subtle motion, and a contact CTA.

## Stack
- Ruby 2.7.7, Rails 7.0.10
- Tailwind CSS (via tailwindcss-rails), Importmap, Hotwire (Turbo/Stimulus)
- SQLite (development/test)

## Setup
```bash
cd /Users/user/Desktop/Devyard
bundle install
bin/rails db:setup
```

## Run the app
```bash
bin/dev        # runs Rails server and Tailwind watcher via foreman
```

## Build styles (one-off)
```bash
bin/rails tailwindcss:build
```

## Tests
```bash
bin/rails test
```

## Notes
- Gems install to `vendor/bundle` (configured) to avoid system-level permissions.
- Hero video and animated GIF use hosted placeholders; replace with brand assets as needed.
