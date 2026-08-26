---
name: slack-design-tokens
description: Reference Slack design tokens when building or modifying prototypes. Use when creating UI elements, choosing colors, spacing, typography, shadows, or border radii. Triggers on prototyping tasks, UI construction, or explicit token questions.
argument-hint: "[component or token category to look up]"
---

# Slack Design Tokens

When building or modifying any prototype in this repository, you MUST use Slack's official design tokens for visual properties. Query the tinyspeck-design-tokens MCP for live, up-to-date values.

## How to Use Tokens

### 1. Query the Design Tokens MCP

Use these MCP tools as your primary source of truth:

- **`mcp__tinyspeck-design-tokens__tokens-search`** — search tokens by name or purpose (e.g., "content primary", "border radius", "shadow modal")
- **`mcp__tinyspeck-design-tokens__tokens-get`** — get a specific token's value across modes (light/dark)
- **`mcp__tinyspeck-design-tokens__tokens-list-categories`** — browse all token categories to understand the system

For icons:
- **`mcp__tinyspeck-icons__search_icons`** — find icons by name or concept
- **`mcp__tinyspeck-icons__get_icon`** — get a specific icon's SVG
- **`mcp__tinyspeck-icons__list_icons`** — browse icon categories

### 2. Apply Tokens in Prototypes

Since prototypes are standalone HTML files (not compiled), use raw hex/rgba values with a CSS comment noting the token name for maintainability:

```css
color: #1D1C1D; /* --dt_color-content-pry */
background: #F8F8F8; /* --dt_color-ctr-sec */
border: 1px solid rgba(94,93,96,0.13); /* --dt_color-otl-ter */
border-radius: 8px; /* radius-large */
padding: 16px; /* space-100 */
box-shadow: 0 4px 12px rgba(0,0,0,0.10); /* shadow-menu */
```

### 3. Token Workflow

Before writing any CSS:
1. Search the MCP for the semantic token that matches your intent (e.g., "primary text color" not "dark gray")
2. Use the token's value for the appropriate mode (light by default)
3. Add a CSS comment with the token's CSS variable name

## Token Categories

Query the MCP for the full catalog. Key categories include:

- **Color/Core** — Base (backgrounds), Surface (translucent tints), Container (cards), Content (text/icons), Outline (borders)
- **Color/Theme** — Workspace-customizable accent colors (aubergine defaults)
- **Color/Palettes** — 20 color ramps with 12 stops each (Gray, Tomato, Paprika, Tangerine, Campfire, Honeycomb, Sunflower, Grass, Cilantro, Mojito, Jade, Aquarium, Lagoon, Ocean, Indigo, Aubergine, Sangria, Flamingo, Rose, Horchata)
- **Typography** — Font sizes (micro 12, caption 13, base 15, subtitle 18, title 22, headline 28), weights (400, 600, 700, 900)
- **Spacing (Primitives)** — 4px grid: space-0125 (4), space-050 (8), space-075 (12), space-100 (16), space-150 (24), space-200 (32), etc.
- **Border Radius** — none (0), small (2), base (6), large (8), xlarge (12), rounded (9999)
- **Shadows** — None, Button (0 1px 3px), Menu (0 4px 12px), Modal (0 18px 48px)

## Rules

- ALWAYS prefer semantic tokens over arbitrary values
- When a token doesn't exist for a specific need, use the closest semantic match
- Comment any non-token values explaining why no token applies
- For dark mode support, query both light and dark mode values from the MCP
