# Slacky Component Library (Central Copy)

This is the canonical source of the Slacky component library and prototype kit infrastructure. Individual prototypes each have their own `shared/slacky/` copy for GitHub Pages deployment.

Based on Pendar Yousefi's [design-prototype-kit](https://slack-github.com/pyousefi/design-prototype-kit).

## Files

### Component Library
- `reset.css` — CSS reset
- `tokens.css` — All Slack design tokens (~1100 lines): colors, spacing, typography, shadows, radius, font-face declarations
- `components.css` — foundational component styles using BEM naming (`c-` prefix)
- `dark.css` — Dark theme overrides (add `sk-client-theme--dark` class to toggle)
- `slacky.js` — Vanilla JS for interactive components: modal, menu, tabs, popover, tooltip, select, toast, context menu
- `fonts/` — Slack-Lato font files (woff + woff2)
- `avatars/` — Persona and app avatar images for prototypes
- `REFERENCE.md` — Full HTML pattern guide for all foundational components
- `showcase.html` — Live interactive preview of all components
- `messagekit.html` — Dedicated MessageKit reference page (anatomy, states, reactions, reply bar, actions toolbar)

### Kit Infrastructure
- `chrome/` — Shared prototype navigation chrome (iteration/option picker with deep linking)
  - `prototype-chrome.js` — Chrome JS
  - `prototype-chrome.css` — Chrome styles
- `thumbnails/` — Fallback thumbnail images for prototype viewers (10 color variants)
- `skills/` — Claude Code skills for design work
  - `slack-design-brainstorm/` — Design crit + brainstorm partner (Slack's 5 product principles)
  - `slack-design-tokens/` — Forces Claude to use MCP for real token values
  - `ux-writing/` — UX copy review (Slack voice/tone framework + 6 litmus tests)
- `settings.local.json` — Template `.claude/settings.local.json` (MCP server config + permissions)
- `PROTOTYPE-CLAUDE.md` — Template CLAUDE.md for prototype repos (Figma mapping, workflow, conventions)

### Scripts
- `sync-slacky.sh` — Syncs Slacky library + skills + settings to all sibling prototypes
- `check-slacky-updates.sh` — Checks if the Slacky source repo has newer commits
- `update-slacky.sh` — Pulls latest Slacky from the source repo (for standalone Slacky users)

## Local Preview
Run `python3 -m http.server 8007` from this directory, then check `http://localhost:8007/showcase.html`.

## Browsing Components
Open `showcase.html` in a browser to see all foundational components with live demos. Features:
- Sidebar navigation with search/filter
- Dark mode toggle
- Interactive components (modals, popovers, tooltips, menus, tabs)

## Using in a New Prototype
Copy the `shared/slacky/` directory into the prototype:
```
cp -R shared/slacky <prototype>/shared/slacky
```

Then in your HTML:
```html
<link rel="stylesheet" href="shared/slacky/reset.css">
<link rel="stylesheet" href="shared/slacky/tokens.css">
<link rel="stylesheet" href="shared/slacky/components.css">
<!-- Add dark.css if dark mode is needed -->
<script src="shared/slacky/slacky.js"></script>
```

## Customizing Components
Add custom CSS in your prototype's own stylesheet. Slacky uses BEM naming (`c-button`, `c-button--primary`, etc.) so overrides are straightforward:

```css
/* Override in your prototype's styles.css */
.c-button--primary {
  background: var(--my-custom-color);
}
```

## Adding Custom Icons
```js
Slacky.addIcon('my-icon', '<path fill="currentColor" d="..."/>');
// Then use: Slacky.icon('my-icon')
```

## Syncing Updates
After modifying files here, push updates to prototype copies:
```
./sync-slacky.sh   # syncs Slacky to all sibling prototypes that have shared/slacky/
```

## Key Token Variables
- Spacing: `--dt_static_space-{050|075|100|150|200}` (8px, 12px, 16px, 24px, 32px)
- Typography sizes: `--dt_static_type-size-{micro|caption|base|subtitle|title}` (12-22px)
- Typography weights: `--dt_static_type-weight-{base|bold|black}` (400, 700, 900)
- Colors: `--dt_color-base-pry`, `--dt_color-content-pry`, `--dt_color-base-inv-hgl-1` (blue), etc.
- Border radius: `--dt_static_radius-{small|base|large}` (2px, 6px, 8px)
- Shadows: `--dt_static_shadow-{sm|base|md|lg}`
