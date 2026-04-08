# Email Images

Static image hosting for HTML emails at `images.soneaf.com`.

## Usage

Drop images into the appropriate folder, push to GitHub, and reference them in emails:

```
https://images.soneaf.com/logos/logo.png
https://images.soneaf.com/emails/campaign-jan/hero.jpg
https://images.soneaf.com/assets/divider.png
```

## Folders

- `logos/` — Brand logos and marks
- `emails/` — Campaign-specific images (create subfolders per campaign)
- `assets/` — Reusable elements (dividers, icons, backgrounds, spacers)

## Auto-deploy

Push to `main` → GitHub webhook → deploys to server automatically.
