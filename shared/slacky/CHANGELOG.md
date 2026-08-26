# Changelog

All notable changes to the Slacky Component Library are documented here.

## 2026-07-16

### Message component cleanup + shell dedup

- **components.css** — Landed the reviewed component cleanup: hardcoded values replaced with design tokens, and the full `c-message_kit` message structure (message, background, gutter, content header, avatar) plus updated sidebar section-heading, message reply-bar, and reaction styles. All changes are demo/shell components, visually validated against the July demo.
- **shell-channel.html** — Rebuilt as the clean version derived from the demo: message pane uses the full `c-message_kit` structure, tab rail split into TabRail + ControlStrip, and the working thread panel is retained.
- **shell.css** — Removed duplicate component rules (tab rail, client workspace, view header, channel tabs, message pane, date divider) now that `components.css` is the single source. This fixes the message-pane content being capped at a max-width and restores the updated date-divider pill styling.
- **fonts/circular/** — Added the 4 Slack Circular woff2 files so `sync-slacky.sh` (which uses `rsync --delete`) stops wiping them from prototypes that reference them.

---

## 2026-07-06

### Top nav consolidated into a single component

- **Top nav is now one component in `components.css`** using the short slot names (`p-ia4_top_nav__left`, `__search`, `__right`) — the names used by the majority of prototypes and the original Slacky. A harmless `__container_wrapper` layer is retained. Removed the duplicate top-nav block that previously also lived in `shell.css`.
- **Search box fill fixed** — the right side no longer grows to compete with the search for space, so the search box fills the middle and stays vertically centered (`padding: 0 4px`, 44px bar).
- **shell-channel.html** — demo markup uses the short slot names.
- **Note:** an earlier iteration this day briefly renamed the slots to `_container` names; this was reverted to the short names to match existing prototypes.

---

## 2026-05-06

### Thread Panel added

- **New layout component: Thread Panel (p-flexpane)** — Side panel for threaded conversations with fixed header, scrollable message body, reply count divider, and inline composer. Styles in `shell.css`.
- **shell-channel.html** — 6 reply bars now open unique threads with contextually relevant content (2–14 replies each). Click any reply bar to open the thread panel; click close to dismiss.
- **showcase.html** — Thread Panel added to Layout Components section with interactive demo (dark mode compatible).
- **shells.html** — Updated description to include thread panel.
- **Composer position** — Composer scrolls with messages (not pinned to bottom), matching the real product.

---

## 2026-05-04

### Removed semibold weight

- **Semibold token deleted** — `--dt_static_type-weight-semibold: 600` removed from tokens.css. Slack Kit uses bold (700) for all emphasis — no production component uses 600.
- **Channel tabs** — `.p-channel_tabs__tab` in components.css and shell.css updated from 600 to bold (700).
- **REFERENCE.md** — Removed semibold from weight table, updated button and section header specs to say bold.
- **CLAUDE.md** — Removed semibold from token quick-reference list.

### Script cleanup

- **sync.sh → sync-slacky.sh** — Renamed for clarity.
- **check-updates.sh → check-slacky-updates.sh** — Clear name for standalone users who may also have kit-level update scripts.
- **update.sh → update-slacky.sh** — Same reason.
- **generate-manifest.sh removed** — Viewer script belongs in the prototypes-index repo, not the component library.
- **setup-kit.sh removed** — Replaced by `add-kit-to-prototype.sh` at the prototypes root level.
- **Updated all references** — CLAUDE.md, PROTOTYPE-CLAUDE.md, README.md, settings.local.json, sync-slacky.sh, new-prototype.sh.

---

## 2026-05-01

### Fixes

- **Breadcrumb navigation restored** — The "Prototypes / Slacky Component Library" breadcrumb bar at the top of showcase pages was lost when the tab header was added. Restored on all three pages (Components, MessageKit, Shells) so navigating between tabs keeps the breadcrumb visible.
- **Shell sidebar synced with showcase** — The channel sidebar in the IA4 shell (`shell-channel.html`) was using a different, older version of the sidebar component. Updated to match the showcase version: full set of page rows (Unreads, Threads, Huddles, Recap, Drafts, Directories), two header buttons (Settings + Compose), and channel state classes (selected, unread, muted, badge). Shell keeps its own content (Acme Inc workspace, Project Acme section, shell-specific DMs).
- **Channel icons fixed** — Sidebar channel icons were missing because the JS referenced a `'hash'` icon name that doesn't exist in slacky.js. Corrected to `'channel'` (the actual registered icon name) in both showcase.html and shell-channel.html.

### Update flow

- **`update.sh` added** — Standalone update script for users who download Slacky without the Local Prototype Kit. Fetches the latest from `muno/slacky-component-library` and syncs all files.
- **Automatic update notifications** — New `check-updates.sh` SessionStart hook compares the local `.slacky-version` marker against the remote repo and notifies you when updates are available, similar to Figma's library update notifications.
- **`settings.local.json` updated** — Wires the update notification hook into Claude Code's SessionStart event.

### Tokens

- **Palette tokens converted to hex** — All 240 palette color stops (20 families × 12 stops) now use hex format (`#f8f8f8`) instead of RGB triplets (`248,248,248`). Original RGB values preserved in comments for reference.
- **Sidebar theme added** — New `.sk-client-theme--sidebar` block with 96 tokens, sourced from the webapp's `light-inverted-sidebar.css`. Apply the class to any container to get sidebar-specific color overrides. 48 values differ from the default light theme (mostly hover/pressed alpha levels).
- **Removed invented theme token names** — Deleted 28 `--dt_color-theme-*` tokens that used names not found in the webapp. Themes work by overriding the same `--dt_color-*` variables under a scoped CSS class, not by using a separate `theme-*` prefix.

### REFERENCE.md

- **Brand tokens expanded** — Full catalog of all 27 brand tokens: 8 core (aubergine, horchatta, black, white, and the 4 Slack logo colors) and 19 secondary (marketing palette from text grays through warm/cool spectrum). All values verified against tokens.css.
- **Theme documentation corrected** — Replaced incorrect `--dt_color-theme-*` guidance with accurate explanation of how themes work: same variable names, scoped by CSS class (`sk-client-theme--sidebar`, `sk-client-theme--dark`).

## 2026-04-30

### Tokens

- **Theme tokens added to tokens.css** — 28 workspace/sidebar theming values (later corrected on 2026-05-01).

### REFERENCE.md

- **Colors section expanded** — Grew from 9 quick-reference lines to 80+ lines with 7 detailed tables: Content (13 tokens incl. 6 inverse), Base (9), Surface (8), Container (2), Filled/Inverse (4), Outlines (14), Brand (3, later expanded to 27). All using Slacky abbreviated variable names with verified hex values.
- **Component design specs added** — Button (height, padding, radius, font, types), Text Input (height, padding, border, focus ring), Checkbox (tap target, flex layout), Modal (radius, shadow, structure, footer, a11y).
- **New component sections** — Section Header (Collapsible) and Settings Panel / Sidebar patterns with spacing specs and flex structure.

## 2026-04-29

### Components

- **IA4 shell added** — Complete Slack client layout: top nav, tab rail, sidebar, channel header, channel tabs, message pane, and composer.
- **IA4 preset theme picker** — 28 workspace themes (light and dark) with live preview.

### Bug Fixes

- **Channel header alignment** — Fixed buttons and tabs alignment in channel header.
- **Component accuracy** — Fixed modal, buttons, inputs, and spacing token usage.
- **Component count** — Updated from 45 to 48.
