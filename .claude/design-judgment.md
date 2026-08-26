# Design Judgment — Full Reference
These principles guide proactive design decisions — not what values to use, but when and why to use them. The token tables and component specs in CLAUDE.md are the vocabulary. This section is the grammar.

The first four sections cover foundational design principles drawn from established sources (Gestalt psychology, Krug, Bringhurst, Apple HIG, Material Design). These are the *why* behind every design decision. The remaining sections apply these principles specifically to Slack prototypes.

---

## Prerequisite: Collect values before writing code

Design judgment is worthless if it's applied with wrong values. Before exercising any judgment, follow the **Collect-Then-Build Workflow** in CLAUDE.md: look up every design value from verified sources FIRST, then write code using only those collected values.

The six verified sources are: Slacky library (check FIRST), Design Tokens MCP, webapp source, Slack Kit global.css, Figma MCP, user-provided values. "I don't know" requires exhausting ALL six with multiple search keywords each.

This file tells you WHEN and WHY to make design decisions. CLAUDE.md tells you WHAT values to use and WHERE to find them. Both are required. If you find yourself making judgment calls with unverified values, stop — collect first, then decide.

---

## Foundational: Gestalt principles
The human visual system groups and organizes what it sees automatically. These perceptual laws are not preferences — they're how vision works. Every layout decision either works with them or fights them.

**Proximity** — Elements that are near each other are perceived as a group. This is the strongest grouping cue and the primary way to create structure in a layout. A 12px gap between a label and its input says "these belong together." A 32px gap between that pair and the next pair says "new group." You do not need a border, a background, or a heading to create grouping — space alone is enough, and it's usually better. When proximity conflicts with other cues (a divider between items that are close together), proximity wins in the user's perception.

**Similarity** — Elements that look alike are perceived as related. Same font size, same color, same icon style, same height = same category. This is why repeated rows in a settings panel must be structurally identical — if one row is 8px taller or uses a different font weight, the user perceives it as a different kind of thing. Conversely, when you want to distinguish something (a primary action from secondary actions, an error state from a normal state), make it visually different in at least two properties (color + weight, size + color).

**Continuity** — The eye follows smooth lines and curves. Elements arranged along a visual axis are perceived as related and sequential. This is why left-alignment matters in lists and forms — the left edge creates a vertical line that the eye follows downward. Breaking alignment (indenting one item, centering another) disrupts this flow and signals "this is different." Use alignment breaks intentionally, not accidentally.

**Closure** — The mind completes incomplete shapes. A card with three visible edges and one edge off-screen is still perceived as a card. This means you don't need heavy borders around everything — subtle cues (a background color, a shadow, consistent padding) are enough to define a container. Over-bordering makes a UI feel caged and heavy.

**Figure-ground** — The eye separates foreground content from background. Elevated elements (modals, dropdowns, tooltips) must be clearly distinguished from the surface behind them — through shadow, background color, or border. If a popover has the same background and no shadow, it blends into the page and the user doesn't perceive it as a separate layer. Conversely, too many elevation levels on one screen (card on panel on surface on page) creates visual noise — keep to 2-3 layers maximum.

**Common region** — Elements inside a shared boundary (a card, a colored background, a bordered area) are perceived as a group, even if they're far apart. Use this when proximity alone isn't enough — when items in a group need breathing room but must still read as related. But don't over-rely on it: a page full of bordered cards feels like a dashboard of disconnected widgets. Use common region for meaningful containment, not as a default wrapper for everything.

**Applying Gestalt to prototypes:**
- Structure layouts with proximity first, then add borders/backgrounds only if proximity isn't sufficient.
- Repeated elements must look identical — even small differences (1px, a shade of gray) signal "different" to the eye.
- Maintain alignment axes. Every element should sit on a grid line. Random offsets are perceived as errors.
- Use elevation (shadow + background) sparingly and consistently — one level for cards, one for dropdowns, one for modals.

---

## Foundational: Cognitive load & usability
Based primarily on Steve Krug's *Don't Make Me Think* and established usability research. The core insight: every moment a user spends figuring out the interface is a moment they're not spending on their actual task.

**Users scan, they don't read.** Design every screen as if the user will spend 2 seconds looking at it before deciding what to do. This means: clear visual hierarchy (the most important thing is the biggest/boldest), obvious labels (not clever ones), and conventional patterns (a gear icon means settings — don't reinvent it). If the user has to read a paragraph to understand what a control does, the UI has failed.

**Don't make the user think about the interface.** Every interaction should be self-evident. A button should look like a button. A link should look like a link. A text input should look like a text input. If an element is interactive, its visual treatment must signal that — through color (`highlight-1`), affordance (border, shadow), or convention (underline for links). If the user has to wonder "can I click this?", the design is ambiguous.

**Reduce choices to reduce cognitive load.** Hick's Law: decision time increases with the number of options. A settings panel with 20 visible toggles is harder to use than one with 6 toggles and a "Show advanced" disclosure. Group related options, hide infrequent ones, use smart defaults. The user should make zero decisions to accomplish the common case.

**Clarity over cleverness.** Label a button "Delete channel" not "Remove." Label a toggle "Show timestamps" not "Timestamps." Use specific verbs. Avoid jargon. The label should tell the user exactly what will happen — no ambiguity, no double-negatives ("Disable notifications" toggle in the ON position means... notifications are disabled? or enabled?). Prefer positive framing: "Show timestamps" (on/off) not "Hide timestamps."

**Recognition over recall.** Show the current state of things — don't make the user remember. A dropdown should show its current selection. A settings panel should show current values, not just labels. A multi-step flow should show which step the user is on and what's coming. Breadcrumbs, progress indicators, and current-state labels all reduce memory burden.

**Error prevention over error messages.** Disable destructive buttons until the preconditions are met. Use type-appropriate inputs (number input for quantities, date picker for dates). Constrain choices to valid options. When you must show an error, show it inline next to the field that caused it, in specific language ("Channel name must be lowercase" not "Invalid input"), and tell the user how to fix it.

**Conventions are your friend.** Users bring expectations from every other app they've used. Close button in the top-right corner. Primary action button on the right of a modal footer. Search bar at the top. Navigation on the left. Don't be creative with interaction patterns — be creative with the content. Breaking conventions forces the user to learn your interface instead of using it.

**Applying usability to prototypes:**
- Default every label to the most explicit, specific wording possible. "Save changes" not "Done." "3 channels selected" not "3 selected."
- If a screen has more than 7±2 visible choices, consider grouping, collapsing, or paginating.
- Every interactive element must have a visible affordance. No invisible hover targets, no unlabeled icons without tooltips.
- Prefer smart defaults that cover the common case — the user should be able to accomplish the primary task with zero configuration.

---

## Foundational: Typography as structure
Based on Robert Bringhurst's *The Elements of Typographic Style* and practical UI typography. Typography is not decoration — it's the primary vehicle for content and the strongest tool for visual hierarchy.

**Measure (line length) determines readability.** The optimal measure for body text is 45–75 characters per line (roughly 400–600px at 15px). Lines shorter than 40 characters feel choppy and interrupt reading flow. Lines longer than 80 characters cause the eye to lose its place when returning to the start of the next line. In Slack prototypes, this constrains body text containers: a message bubble should not span the full width of a wide viewport. Sidebar panels (280–360px) naturally enforce a reasonable measure for labels and short text, but any panel wider than 600px with running text needs a `max-width` on the text container.

**Vertical rhythm creates order.** Text blocks should relate to each other through consistent spacing tied to the line-height. If body text has a line-height of 22px, spacing between paragraphs should be a multiple or near-multiple of 22px (22px, 24px, or 32px — not 17px or 29px). This creates a subtle but perceptible vertical grid that makes the page feel ordered. In Slack prototypes, this means using the spacing scale (`8px`, `12px`, `16px`, `24px`) and setting line-heights explicitly rather than relying on browser defaults.

**Typographic contrast creates hierarchy.** The eye distinguishes text levels through three axes: size, weight, and color. Effective hierarchy uses at least two of these simultaneously. A section header that's only bolder than body text (same size, same color) is weak hierarchy. A section header that's bolder AND uses `content-primary` while body text uses `content-secondary` is strong hierarchy. Never rely on a single axis — size alone, weight alone, or color alone is insufficient for clear differentiation.

**Whitespace is not empty space — it's structure.** The space around text is as important as the text itself. Generous margins around a heading give it prominence. Tight spacing between a label and its value creates association. Whitespace directs attention, creates breathing room, and separates concepts. Cramming text together to "fit more on screen" sacrifices comprehension for density. Conversely, excessive whitespace between related elements breaks their association (violating Gestalt proximity).

**Consistency of treatment signals consistency of meaning.** If section headers are 15px bold `content-primary` in one part of the UI, they must be exactly that everywhere. If timestamps are 12px regular `content-tertiary`, every timestamp uses that treatment. When typographic treatments are inconsistent, the user subconsciously perceives different levels of importance — even when none was intended. This is why the type scale is a closed set: if you need a new size, you probably need to rethink the hierarchy, not add a 14px exception.

**Applying typography to prototypes:**
- Check line length on any text container wider than 600px. Add `max-width` if running text exceeds ~75 characters.
- Set line-height explicitly on every text element. Never rely on browser defaults.
- Create hierarchy with at least 2 of: size, weight, color. One axis alone is too subtle.
- Use the defined type scale. If something doesn't fit, the hierarchy needs adjustment — not a new font size.

---

## Foundational: Platform design principles
Distilled from Apple's Human Interface Guidelines and Google's Material Design — not the platform-specific patterns (tab bars, FABs), but the universal principles that both systems share and that apply to any well-designed interface.

**Content first, chrome second.** The interface should recede and let the content be the focus. Minimize decorative borders, backgrounds, and ornamental elements. A well-structured layout with clear typography needs very little chrome. In Slack prototypes, this means: don't add borders around things that are already visually distinct through spacing and background. Don't add icons to labels that are already clear as text. Don't add color to elements that work fine in grayscale.

**Clarity through visual hierarchy, not visual complexity.** Both HIG and Material emphasize that the interface should communicate structure through typography, spacing, and color — not through adding more visual elements. If a screen is confusing, the fix is usually to simplify (remove elements, increase contrast between hierarchy levels) rather than to add (more borders, more labels, more icons). A clean, well-structured screen with 5 elements communicates better than a busy screen with 15 elements.

**Meaningful, restrained motion.** Animation should communicate something: a transition shows where content came from, a loading spinner shows the system is working, a state change animation shows what changed. Animation that doesn't communicate anything (decorative bounces, gratuitous fades, attention-seeking pulses) is noise. In Slack prototypes: use `150ms ease` transitions for state changes (hover, focus, expand/collapse). Don't animate things that don't change state. Never add animation to make a static interface "feel more polished" — that's decoration, not communication.

**Density is a design decision, not a constraint.** Apple tends toward spacious layouts; Material and Slack tend toward density. Neither is wrong — the right density depends on the use case. High-density UIs (data tables, channel lists, settings panels) serve users who need to scan many items quickly. Low-density UIs (onboarding flows, empty states, hero content) serve users who need to focus on one thing. Match density to the user's task. In Slack prototypes, most screens should lean toward density (Slack is a productivity tool), but entry points, empty states, and confirmations should breathe.

**Systematic, not arbitrary.** Both platforms emphasize design systems: a finite set of sizes, colors, spacings, and components that combine in consistent ways. Every value should come from the system. If you're typing a raw number (padding: 13px, font-size: 14px, border-radius: 5px) that's not in the token scale, stop and find the nearest system value. Arbitrary values compound into visual inconsistency — the user can't tell if the subtle differences are meaningful or accidental.

**Accessibility is architecture, not an add-on.** Both platforms treat accessibility as foundational, not a checklist applied afterward. This means: color is never the only indicator of state, interactive elements are always reachable by keyboard, text always meets contrast requirements, and touch targets are always large enough. Designing an accessible prototype from the start takes the same amount of time. Retrofitting accessibility into a finished prototype takes twice as long and the result is usually worse.

**Applying platform principles to prototypes:**
- Before adding a visual element (border, background, icon, label), ask: does this communicate something the user needs? If not, leave it out.
- If a screen feels confusing, try removing elements before adding them. Simplify first.
- Use transitions only for state changes. 150ms ease. No decorative animation.
- Every value (size, spacing, color, radius) must come from the token system. No raw numbers.
- Build accessibility in from the first line of HTML, not as a pass at the end.

---

## Visual hierarchy
Every screen has a reading order. The user's eye should land on the most important thing first, then flow naturally to supporting content, then to controls/actions. Establish this order using three levers together — never just one:

**Size creates primary emphasis.** The largest text on screen is what the eye finds first. Use `title` (22px) or `headline` (28px) only for the single most important element — a page title, a modal heading, an empty-state message. If two things are the same size, neither is primary.

**Weight creates secondary emphasis within a size level.** At `base` size (15px), bold (700) text reads as a label or section header; regular (400) reads as body text. Use bold for buttons, section headers, and emphasis — but not for every label.

**Color creates tertiary emphasis and semantic meaning.** `content-primary` is for text the user must read. `content-secondary` is for text that supports the primary text — descriptions, metadata, helper text. `content-tertiary` is for text the user can ignore until they need it — timestamps, IDs, placeholder text. Never skip a level (don't go from `primary` straight to `tertiary` with nothing in between — it creates a visual gap).

**How to decide what's primary, secondary, tertiary:**
- Primary: the user's question ("What is this?" / "What should I do?") — the heading, the main label, the call to action
- Secondary: the answer or context ("Here's more detail") — descriptions, body text, current values
- Tertiary: metadata the user rarely needs — timestamps, IDs, status badges, counts
- If everything is primary, nothing is. A screen with all bold, same-size text has no hierarchy. Step back and ask: if the user glances at this for 1 second, what should they see first?

**Applying hierarchy to common patterns:**
- **Settings row**: label is primary (15px bold), description below is secondary (13px regular, `content-secondary`), the control (toggle, dropdown) is visually secondary but interactively primary
- **List item**: title is primary, subtitle/metadata is secondary (13px, `content-secondary`), timestamp is tertiary (12px, `content-tertiary`)
- **Card**: heading is primary (15px bold or 18px), body text is secondary (15px regular), footer actions are visually quieter than the heading
- **Modal**: title is primary (18px bold), body content is secondary, footer buttons are the call to action — the primary button should be the most visually prominent interactive element

## Information density
Slack is a dense application — it shows a lot of information in compact space without feeling cramped. The key is consistent rhythm, not uniform tightness.

**Tight spacing (4–8px gaps)** is for elements that form a single conceptual unit:
- Icon + label in the same row
- Avatar + username
- Checkbox + its label
- Items within a single control group

**Medium spacing (12–16px)** is for elements that are related but distinct:
- Form field to form field
- List item to list item
- Label above its input
- Padding inside a card or panel section

**Spacious spacing (24–48px)** is for elements that are conceptually separate:
- Section to section within a panel
- Major content blocks on a page
- Above/below a divider that separates topics
- Page-level vertical rhythm

**How to choose:**
- Group by meaning first, then space by relationship. Items that answer the same question belong together (tight). Items that answer different questions need separation (spacious).
- When a section feels too cramped, don't add padding to individual items — increase the gap at the section level. When it feels too loose, the sections are probably too far apart or the content needs grouping.
- Slack prototypes should feel efficient, not airy. If a panel has room for 8 items but only shows 4 because of excessive spacing, tighten up. The user should see as much relevant content as possible without scrolling.
- Horizontal space is expensive — Slack's panels are often 280–360px wide. Every pixel of padding reduces usable content width. Use 12–16px panel padding, not 24–32px.

## Interaction states
Every interactive element needs four states: default, hover, active (pressed), and focus. Disabled is optional. These states communicate "you can interact with this" and "the system heard your input."

**Buttons:**
- Default: the resting state. Primary buttons are filled (`base-inverse-highlight-1` background, white text). Secondary/default buttons are outlined (transparent background, `outline-primary` border).
- Hover: darken the background slightly. For filled buttons, use a slightly darker shade. For outlined buttons, add a subtle background tint (`base-secondary` or `base-tertiary`). The change should be visible but not dramatic.
- Active/pressed: darken further than hover. The button should feel like it physically depressed.
- Focus: add the focus ring (`shadow-a11y`). Do not change the background — focus is about keyboard navigation, not mouse intent.
- Disabled: reduce opacity to ~0.4–0.5, or use `content-tertiary` for text and `base-secondary` for background. Remove pointer events (`pointer-events: none`). The element should be visually receded, clearly not interactive.

**List items and rows (channels, settings, search results):**
- Default: transparent background
- Hover: `base-secondary` or `base-tertiary` background — a subtle highlight that says "you're pointing at this one"
- Active/selected: `surface-highlight-1` background (blue tint) — clearly different from hover, indicates the current selection
- Focus: outline or focus ring, not a background change (so it's distinguishable from hover and selection)

**Text inputs:**
- Default: `outline-primary` border
- Hover: `outline-secondary` border (slightly darker — the field acknowledges the cursor)
- Focus: `outline-highlight-1` border + `shadow-a11y` ring
- Error: `outline-important` border, optionally `surface-important` background tint, error message in `content-important` below the field
- Disabled: `base-secondary` background, `content-tertiary` text, border becomes `outline-primary` at reduced contrast

**Links and text buttons:**
- Default: `content-highlight-1` (blue), underline on hover only (not by default, matching Slack's convention)
- Hover: underline appears
- Active: slightly darker shade
- Visited: no change (Slack doesn't style visited links differently)

**General principles for interaction states:**
- Hover feedback must be immediate — no transition delays over 100ms for hover backgrounds
- Transitions for color/background changes: `150ms ease` is the Slack standard
- Don't over-animate. A button hover is a background color swap, not a scale transform or shadow lift.
- Every hover state must be visible on both light and dark backgrounds. If the element appears over different surfaces, test both.

## Content organization
How content is grouped and divided communicates structure before the user reads a single word.

**Grouping by proximity:**
- Items that are close together are perceived as related. This is the most powerful organizing tool — stronger than dividers or headings.
- A 16px gap between two items says "same section." A 32px gap says "different sections." Use spacing intentionally to create these groupings.

**When to use section headers:**
- When there are 3+ groups of related items that need labels
- When the groups aren't self-evident from content alone (e.g., a settings panel with "Notifications," "Appearance," "Privacy" sections)
- When the user might want to scan section titles to find what they need
- Section header: 15px bold, `content-primary`, with 16px space above (or 24px if following another section's content) and 8px below

**When to use dividers:**
- Between groups that don't have headers but need visual separation
- Between repeated items in a list where each item is complex (has title + description + metadata)
- Use `border-bottom: 1px solid var(--dt_color-outline-primary)` on the item, not a separate divider element
- Do NOT use dividers AND large spacing — one or the other. Dividers + 24px gap is redundant.

**When to use neither (spacing alone is enough):**
- Between simple list items (channel name, username) — the consistent row structure provides enough rhythm
- Between items that are obviously different (a heading followed by body text)
- Inside a card or container that is already visually bounded

**Content ordering within a section:**
- Most important or most frequently used items go first
- Related items cluster together (all notification settings, then all appearance settings — never interleaved)
- Destructive or rarely-used actions go last
- Actions that affect the whole section (like "Reset all") go at the bottom of the section, not the top

## Progressive disclosure
Show what the user needs now. Hide what they'll need later. The goal is to reduce cognitive load without hiding essential information.

**What to show by default:**
- The primary value or state of a setting (current selection, on/off status)
- Labels for every control (the user must understand what a toggle does before deciding whether to click it)
- The first 3–7 items of a list (enough to understand the content type without being overwhelmed)

**What to collapse or hide:**
- Advanced options that most users don't need (collapse behind a "Show advanced" toggle or a disclosure triangle)
- Detailed descriptions of settings (show the label + current state; show the description on hover or as secondary text)
- Content beyond a reasonable default view (long lists get "Show more" or pagination, not infinite scroll in a panel)

**Disclosure patterns:**
- **Collapsible sections**: section header with a disclosure triangle. Collapsed by default for advanced/infrequent settings. Expanded by default for primary settings.
- **Tooltips**: for supplementary info that helps but isn't required. Keep tooltip text under 2 sentences. Never put essential information in a tooltip.
- **Secondary panels**: for detailed configuration that doesn't fit inline. Clicking a row opens a detail view or sub-panel.
- **Overflow menus**: for actions beyond the 2–3 most common ones. Use a three-dot icon button with a popover menu.

**When to expand by default vs. collapse by default:**
- Expand if: the user likely needs this every time they visit (e.g., "General" settings)
- Collapse if: the user needs this occasionally or during setup only (e.g., "Advanced" settings, "Developer options")
- If in doubt, expand — hidden content is content that doesn't exist to most users

## Empty and loading states
A screen without content is still a designed experience. Empty and loading states should feel intentional, not broken.

**Empty states:**
- Always provide: a clear message saying why there's nothing to show ("No saved items," "No results for 'xyz'")
- Include a call to action when applicable ("Create your first workflow," "Adjust your filters")
- Use secondary text (`content-secondary`, 13px) for explanatory messages. Don't use the full hierarchy for empty states — they should be quiet, not attention-grabbing.
- Center the empty state vertically and horizontally within its container
- Do NOT show an empty table/list with headers and zero rows — the headers without content look broken. Show the empty state message instead.

**Loading states:**
- For initial page/panel load: a centered spinner or skeleton. Don't show the layout frame with empty content areas — it looks broken and then shifts when content arrives (layout shift).
- For actions (saving, submitting): use inline loading indicators — a spinner inside or next to the button, or the button's text changing to "Saving...". Don't block the entire UI for a single action.
- For list loading: skeleton rows that match the shape of the content they're replacing (same height, similar width blocks for text). This primes the user for what's coming.
- Loading text: "Loading..." is acceptable but generic. Prefer context-specific text: "Loading channels...", "Searching messages..."

**Error states:**
- Show the error where the content should be — not in a detached banner at the top of the page. If a list failed to load, the error replaces the list area.
- Always include a retry action: "Something went wrong. [Try again]"
- Error text: `content-important` (red), but the retry button is primary/default style — not red (red buttons mean destructive, not "fix this").
- Don't show technical error details by default — "Request failed" not "HTTP 500 Internal Server Error". Offer a "Show details" link for debugging.

## Layout selection
Choosing the right container for content is a design decision, not a technical one. Each layout pattern has a purpose.

**Sidebar panels (280–360px wide):**
- Use for: persistent controls that affect the main view (filters, settings, navigation), context that the user references while working in the main area
- The sidebar content should be usable at the narrowest width. If labels truncate or controls stack awkwardly at 280px, the content doesn't belong in a sidebar.
- Scroll behavior: the sidebar scrolls independently from the main content

**Modals (400–600px wide, typically):**
- Use for: focused tasks that interrupt the current workflow (create, edit, confirm), content that needs the user's full attention
- Small modals (~400px): confirmations, simple forms (1–3 fields)
- Medium modals (~520px): multi-field forms, settings dialogs
- Large modals (~600–680px): complex forms, wizards, content with tables
- Don't use a modal for content the user will want to reference while doing something else — that's a panel or sidebar

**Inline panels (expanding within the page flow):**
- Use for: configuration that's part of a larger flow, details that supplement a list item
- The panel appears below or beside the trigger, pushing other content down/aside
- Good for: settings within settings, expandable list item details, inline editing

**Full-page views:**
- Use for: primary workflows, dashboards, content that needs maximum space
- Structure: optional top bar (title + actions) → content area → optional bottom bar (pagination, actions)

**How to choose:**
- Ask: "Does the user need to see something else while using this?" If yes → sidebar or inline panel. If no → modal.
- Ask: "Is this a one-time action or persistent state?" One-time → modal. Persistent → sidebar or inline.
- Ask: "How much content is there?" A toggle and a dropdown → inline. A form with 6 fields → modal. An entire settings category → sidebar or full page.

## Color application
The token system defines *what colors are available*. This section defines *when to reach for each one*.

**The default palette for any new screen:**
- Background: `surface-primary` (or `container-primary` for cards on top of it)
- Primary text: `content-primary`
- Supporting text: `content-secondary`
- Borders: `outline-primary`
- Interactive text/icons: `content-highlight-1`
This covers 90% of any screen. Only add other colors when there's a specific reason.

**When to use highlight colors:**
- `highlight-1` (blue): interactive elements, links, selected states, primary actions. This is the "you can click this" color. Don't use blue for non-interactive text — it creates false affordance.
- `highlight-2` (green): success states, positive status, completion indicators. "This went well" or "this is active/healthy."
- `highlight-3` (yellow/amber): warnings, caution states, things that need attention but aren't errors. "Be aware of this."
- `important` (red): errors, destructive actions, critical alerts. "Something is wrong" or "this will delete something." Red is the strongest signal — use it only when merited.

**When to use surface/background colors:**
- `surface-highlight-1`: selected/active row in a list, current tab, active state. Subtle blue tint.
- `surface-important`: error background behind a form field or alert. Subtle red tint.
- `container-secondary` (light gray): secondary containers, muted cards, code blocks, aside sections. "This is supplementary."
- `base-secondary` or `base-tertiary`: subtle hover backgrounds, zebra striping, alternating row tints.
- `base-modal` (dark overlay): modal backdrop. Always use with opacity.

**Color pairing rules:**
- Text on `surface-primary`/`container-primary` (white): use `content-primary`, `content-secondary`, or `content-tertiary`
- Text on `surface-highlight-1` (blue tint): use `content-primary` or `content-highlight-1`
- Text on `surface-important` (red tint): use `content-important` or `content-primary`
- Text on `container-secondary` (gray): use `content-primary` or `content-secondary`
- White text is only for filled buttons and dark backgrounds (inverse tokens)

**Signals to watch for — "am I using color wrong?"**
- More than 3 distinct colors on a single screen (excluding grays): too busy. Pull back to the default palette and add color only where it creates meaning.
- Blue text that isn't clickable: confusing. Use `content-primary` for non-interactive text.
- Red used for non-error emphasis: dilutes the error signal. Use bold weight instead.
- Green/yellow used decoratively: these are status colors. Don't use them for visual variety.
- No color at all (everything is gray/black): the UI is flat and provides no wayfinding. Add `highlight-1` to interactive elements and key status indicators.
