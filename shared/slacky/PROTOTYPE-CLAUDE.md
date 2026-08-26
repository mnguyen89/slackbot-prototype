# Prototype CLAUDE.md

This is a **standalone prototype** — an interactive HTML exploration deployed to GitHub Pages. This does NOT use the Slack codebase. Each prototype is its own repo under `slack-github.com/muno/`.

## Architecture

```
/
├── index.html              # Main entry point (or chrome wrapper if using iterations)
├── meta.json               # Name, description, tags, options/iterations (if using chrome)
├── update-viewer.sh        # Regenerate prototypes.json for the viewer
├── shared/
│   └── slacky/             # Slack UI component library (CSS + vanilla JS)
│       ├── reset.css       # CSS reset
│       ├── tokens.css      # Design tokens + @font-face declarations
│       ├── dark.css        # Dark theme color overrides
│       ├── components.css  # 45+ component styles (BEM classes)
│       ├── slacky.js       # Vanilla JS for interactive components
│       ├── REFERENCE.md    # HTML pattern guide (read this when building)
│       ├── chrome/         # Shared prototype navigation chrome
│       ├── thumbnails/     # Fallback thumbnails for viewer
│       └── fonts/          # Slack-Lato font files
├── .claude/
│   ├── settings.local.json # MCP servers + permissions
│   └── skills/
│       ├── slack-design-brainstorm/  # Design crit + brainstorm partner
│       ├── slack-design-tokens/      # Slack token reference via MCP
│       └── ux-writing/               # UX copy review
└── <option-N.html>         # Standalone prototype pages
```

## Slacky Component Library

The `shared/slacky/` directory contains a complete Slack UI component library — 45+ components as pure CSS + vanilla JS. It provides components that match Slack's Figma design system.

### MANDATORY: Before Building Any Prototype

**You MUST follow these steps every time you build or modify a prototype:**

1. **Read `shared/slacky/REFERENCE.md`** — this is the authoritative HTML pattern guide. It contains the exact markup, CSS classes, modifier tables, and JS initialization code for every component. Do not guess class names — look them up.
2. **Read `shared/slacky/components.css`** — when you need to understand available modifiers, states, or nesting beyond what REFERENCE.md covers, check the actual CSS. Search for the component's `c-` prefix class to find all variants.
3. **Use the Design Tokens MCP** — query `tokens-search` and `tokens-get` for exact token values (colors, spacing, typography). Query `icons-search` and `icons-get` for icon SVG paths and sizes. Never hardcode hex colors or pixel values when a token exists.
4. **Use slacky classes for ALL Slack UI elements** — buttons, inputs, modals, menus, tabs, cards, alerts, tags, badges, spinners, etc. Do not write custom CSS for things slacky already provides.

### How to include in a prototype HTML file

Every standalone HTML file that uses slacky components should include these in `<head>`:

```html
<link rel="stylesheet" href="shared/slacky/reset.css">
<link rel="stylesheet" href="shared/slacky/tokens.css">
<link rel="stylesheet" href="shared/slacky/dark.css">
<link rel="stylesheet" href="shared/slacky/components.css">
```

And this before `</body>`:
```html
<script src="shared/slacky/slacky.js"></script>
```

### Key concepts

- **CSS classes use BEM naming** with a `c-` prefix: `c-button`, `c-button--primary`, `c-button__icon`
- **Design tokens are CSS custom properties**: `var(--dt_color-content-pry)`, `var(--dt_static_space-100)`
- **Dark mode**: add `class="sk-client-theme--dark"` to `<html>` or toggle via `Slacky.darkMode()`
- **Interactive components** (modal, menu, tabs, popover, tooltip, select, toast, context menu) need JS initialization via `Slacky.modal()`, `Slacky.tabs()`, etc.
- **Static components** (button, input, card, alert, tag, badge, spinner, etc.) are pure CSS — just use the right classes
- **Icons**: use `Slacky.icon('name', size)` to generate SVG strings, or paste SVG markup directly. For icons not built into slacky.js, use the Design Tokens MCP (`icons-search`, `icons-get`) to find SVG paths and register them with `Slacky.addIcon('name', '<path .../>');`

### Figma Component Mapping

**Figma file:** https://www.figma.com/design/Kstn5T5UMZoHG9KH7WAlGP/%E2%9C%85-Desktop---Slack-Kit

When implementing a UI from a Figma design that uses the Slack Kit library, match Figma component/layer names to slacky CSS classes below. All class patterns are documented in `shared/slacky/REFERENCE.md`.

| Figma Component | CSS Class Prefix | Notes |
|---|---|---|
| Alert | `c-alert` | levels: default, info, success, warning, error |
| Aspect Box | `c-aspect_box` | |
| Banner | `c-banner` | info, success, warning, urgent, neutral |
| Button | `c-button` | types: primary, danger, outline, ghost |
| Calendar | `c-calendar` | |
| Callout | `c-callout` | |
| Card | `c-card` | with `c-card__header`, `c-card__section` |
| Character Count | `c-input_character_count` | |
| Checkbox | `c-input_checkbox` | |
| Coachmark | `c-coachmark` | |
| Context Menu | `c-menu` | use `Slacky.contextMenu()` + `Slacky.menu()` |
| Date Picker | `c-date_picker` | |
| Dot | `c-dot` | |
| Empty State | `c-empty_state` | |
| Fieldset / Legend | `c-fieldset`, `c-legend` | |
| Filter Input | `c-search__input_box` | search/filter pattern |
| Hint | `c-hint` | |
| Icon | `c-icon` | use `Slacky.icon()` or raw SVG |
| Icon Button | `c-icon_button` | |
| Inline Alert | `c-inline_alert` | |
| Keyboard Key | `c-keyboard_key`, `c-keyboard_keys` | |
| Label | `c-label` | |
| Link | `c-link` | also `c-link--button` for button-styled links |
| Menu | `c-menu`, `c-menu_item` | use `Slacky.menu()` for keyboard nav |
| Mention Badge | `c-mention_badge` | |
| Modal | `c-sk-modal` | use `Slacky.modal()` for focus trap |
| Pagination | `c-pagination` | |
| Popover | `c-popover` | use `Slacky.popover()` for positioning |
| Radio Button / Group | `c-input_radio`, `c-radiogroup` | |
| Select | `c-select` | use `Slacky.select()` for behavior |
| Sidebar Menu | `c-sidebar_menu` | use `Slacky.sidebarMenu()` |
| Slider | `c-slider__input` | native range input |
| Spinner | `c-infinite_spinner` | small, medium, large, jumbo |
| Switch | `c-switch` | |
| Tabs | `c-tabs` | use `Slacky.tabs()` for keyboard nav |
| Tag | `c-tag` | 10+ color variants |
| Textarea | `c-input_textarea` | |
| Text Input | `c-input_text` | |
| Time Picker | `c-time_picker` | |
| Toast | `c-toast` | use `Slacky.toast()` for auto-dismiss |
| Token (Chip) | `c-token` | |
| Toolbar | `c-toolbar` | wraps icon buttons |
| Tooltip | — | use `Slacky.tooltip()` (JS-only, no static markup) |
| Truncate | `c-truncate` | |

### Workflow

1. **Read `shared/slacky/REFERENCE.md`** to find the component you need
2. Copy the HTML pattern into your prototype
3. Apply the correct CSS modifier classes for your variant
4. For interactive components, add the JS initialization in a `<script>` block
5. Use prototype-specific `<style>` blocks for layout and spacing between components
6. **Use the Design Tokens MCP** to look up any token values or icons you need

## Design Tokens

When building or modifying any prototype, use Slack's official design tokens. The slacky library includes all tokens as CSS custom properties. The **Design Tokens MCP** is also pre-configured for live token lookups.

**IMPORTANT:** Never hardcode colors, spacing, or typography values. Always use design token CSS variables or query the MCP for the correct token.

With the slacky library included, use tokens directly as CSS variables:
```css
color: var(--dt_color-content-pry);
background: var(--dt_color-ctr-sec);
padding: var(--dt_static_space-100);
```

Without the slacky library, apply tokens as raw values with CSS comments:
```css
color: #1D1C1D; /* --dt_color-content-pry */
background: #F8F8F8; /* --dt_color-ctr-sec */
padding: 16px; /* space-100 */
```

## MCP Servers

### Pre-configured (repo-level)
- **Design Tokens MCP** — live queries for Slack design tokens and icons:
  - **`tokens-search`** — find tokens by keyword (e.g., "primary button background", "border color", "spacing")
  - **`tokens-get`** — get exact value for a specific token name
  - **`tokens-list-categories`** — browse available token categories
  - **`icons-search`** — find icons by keyword (e.g., "close", "search", "settings", "channel")
  - **`icons-get`** — get SVG path data for a specific icon name
  - **`icons-list-categories`** — browse available icon categories

  After finding an icon via the MCP, register it for use: `Slacky.addIcon('icon-name', '<path .../>');` then render with `Slacky.icon('icon-name', 20)`.

### User-level (in Claude settings)
- **Figma Plugin** — reads Figma designs for design-to-code workflows

## Skills

- **`/slack-design-brainstorm`** — Design crit and brainstorm partner grounded in Slack's 5 product principles (Don't Make Me Think, Be a Great Host, Prototype the Path, Seek the Steepest Part of the Utility Curve, Take Bigger Bolder Bets)
- **`/ux-writing`** — Slack UX writing review and recommendations. Evaluates copy against Slack's voice principles, tone framework, and litmus tests.
- **`/slack-design-tokens`** — Ensures Claude queries the design-tokens MCP and uses official Slack tokens when building prototypes

## Shared Prototype Chrome

For prototypes with multiple options/iterations, use the shared chrome system. Include in the prototype's `index.html`:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PROTOTYPE NAME</title>
  <link rel="stylesheet" href="shared/slacky/chrome/prototype-chrome.css">
</head>
<body>
  <script src="shared/slacky/chrome/prototype-chrome.js"></script>
</body>
</html>
```

The chrome reads `meta.json` and renders a navigation header with iteration/option picker and deep linking via URL hash (`#/{iterationIndex}/{optionIndex}`).

### meta.json format

```json
{
  "name": "Human-readable Prototype Name",
  "description": "Short description of what this prototype explores",
  "tags": ["relevant", "tags", "for-search"],
  "iterationLabel": "Week",
  "iterations": [
    {
      "label": "Mar 16-20",
      "options": [
        { "file": "v1-basic.html", "label": "1", "description": "Basic card layout" },
        { "file": "v1-stacked.html", "label": "2", "description": "Stacked with status indicators" }
      ]
    }
  ]
}
```

For simple prototypes with no iterations, use `"options"` at the top level instead of `"iterations"`.

## Updating the Slacky Library

The central copy lives at `shared/slacky/` in the kit root. After modifying files there:
```
cd shared/slacky
./sync-slacky.sh   # syncs Slacky to all sibling prototypes
```
