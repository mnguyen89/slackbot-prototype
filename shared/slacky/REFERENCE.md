# Slacky Component Reference

HTML/CSS pattern guide for building Slack-accurate prototypes. Each component maps directly to slacky CSS classes — no React or build step needed.

## Quick Start

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Prototype</title>
  <link rel="stylesheet" href="../../shared/slacky/reset.css">
  <link rel="stylesheet" href="../../shared/slacky/tokens.css">
  <link rel="stylesheet" href="../../shared/slacky/dark.css">
  <link rel="stylesheet" href="../../shared/slacky/components.css">
</head>
<body>
  <!-- Your prototype HTML here -->
  <script src="../../shared/slacky/slacky.js"></script>
</body>
</html>
```

For dark mode, add `class="sk-client-theme--dark"` to `<html>` or any parent element. Toggle via JS: `Slacky.darkMode(true)`.

---

## Icons

Built-in icons: `close`, `check`, `info-filled`, `warning-filled`, `check-circle-filled`, `close-circle-filled`, `caret-down`, `caret-up-filled`, `caret-down-filled`, `caret-left-filled`, `caret-right-filled`, `search`, `command`, `calendar`, `clock`, `paper-plane`, `edit`, `ellipsis-vertical-filled`, `list-view`, `threads`, `headphones`, `sparkles`, `send`, `user-directory`.

**Sidebar page row icons** (match real Slack sidebar): `list-view` (Unreads), `threads` (Threads), `headphones` (Huddles), `sparkles` (Recap), `send` (Drafts & sent), `user-directory` (Directories).

**Inline SVG (recommended):**
Insert icon HTML via JS: `Slacky.icon('close')` or `Slacky.icon('check', 16)` or `Slacky.icon('search', 20, 'extra-class')`.

Use `document.getElementById('my-el').innerHTML = Slacky.icon('close', 20);` or write the SVG string directly into your HTML.

**Manual SVG:**
```html
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" class="c-icon" aria-hidden="true">
  <!-- paste path from Slacky.icons['close'] -->
</svg>
```

**Icon CSS:**
```css
.c-icon { width: 1em; height: 1em; fill: currentColor; flex-shrink: 0; vertical-align: middle; }
```

**Add custom icons:** `Slacky.addIcon('my-icon', '<path fill="currentColor" d="..."/>')`.

---

## Button

```html
<button class="c-button c-button--primary c-button--medium">Save</button>
```

| Modifier | Values |
|----------|--------|
| Type | `c-button--primary`, `c-button--danger`, `c-button--outline`, `c-button--ghost` |
| Size | `c-button--small` (28px), `c-button--medium` (36px), `c-button--large` (44px) |
| State | `c-button--disabled` + `disabled` attribute |

**With icon:**
```html
<button class="c-button c-button--primary c-button--medium">
  <span class="c-button__icon c-button__icon--left">
    <svg class="c-icon" ...>...</svg>
  </span>
  Send
</button>
```

**As link:**
```html
<a class="c-button c-button--outline c-button--medium" href="#">Link button</a>
```

**Design specs:**
- Default height: 36px (`min-height: 36px`) — use `c-button--medium`
- Padding: 12px vertical, 16px horizontal (`--dt_static_space-075`, `--dt_static_space-100`)
- Border-radius: 6px (`--dt_static_radius-base`)
- Font: 15px bold (`--dt_static_type-size-base`, `--dt_static_type-weight-bold`)
- Full-width buttons: `width: 100%` — when buttons are inside a panel footer or action group
- Types: primary (filled blue/aubergine), outline (default), danger (filled red), ghost (no border)

---

## Icon Button

```html
<button class="c-icon_button c-icon_button--size_medium c-icon_button--default" aria-label="Close" type="button">
  <svg class="c-icon" ...><!-- close icon --></svg>
</button>
```

| Modifier | Values |
|----------|--------|
| Size | `c-icon_button--size_x-small`, `--size_small`, `--size_medium`, `--size_large` |
| Background | `c-icon_button--default`, `c-icon_button--light`, `c-icon_button--dark` |
| Shape | `c-icon_button--circle` (default is square) |
| Border | `c-icon_button--outline` |
| Disabled | `c-button--disabled` + `disabled` attribute |

**With badge:**
```html
<button class="c-icon_button c-icon_button--size_medium c-icon_button--default" aria-label="Notifications">
  <svg class="c-icon" ...>...</svg>
  <div class="c-icon_button__badge" style="height:4px;width:4px"></div>
</button>
```

---

## Text Input

```html
<input type="text" class="c-input_text" placeholder="Enter text">
```

| Modifier | Values |
|----------|--------|
| Size | `c-input_text--small`, `c-input_text--large` (default is medium) |
| State | `c-input_text--with_inline_alert` (error border), `c-input_text--with_hint`, `c-input_text--with_icon` |

**Full form field pattern:**
```html
<label class="c-label c-label--block">
  <span class="c-label__text">Email <span class="c-label__optional_tag">(optional)</span></span>
</label>
<input type="email" class="c-input_text c-input_text--large" placeholder="you@example.com">
<div class="c-hint">We'll never share your email.</div>
```

**With error:**
```html
<input type="email" class="c-input_text c-input_text--with_inline_alert" value="bad">
<div class="c-inline_alert">
  <div class="c-inline_alert__icon-wrapper"><svg class="c-icon"><!-- info-filled --></svg></div>
  <span class="c-inline_alert__text">Please enter a valid email.</span>
</div>
```

**Design specs:**
- Height: 36px (`min-height: 36px`)
- Padding: 8px 12px (`--dt_static_space-050`, `--dt_static_space-075`)
- Border: 1px solid `--dt_color-otl-pry`
- Border-radius: 6px (`--dt_static_radius-base`)
- Font: 15px base weight
- Focus: border becomes `--dt_color-otl-hgl-1`, add `--dt_static_shadow-a11y` focus ring

---

## Textarea

```html
<textarea class="c-input_textarea" placeholder="Write a message"></textarea>
```

| Modifier | Values |
|----------|--------|
| Size | `c-input_textarea--large` |
| Resize | `c-input_textarea--resize_both`, `c-input_textarea--resize_h`, `c-input_textarea--resize_none` |
| State | `c-input_textarea--with_inline_alert`, `c-input_textarea--with_hint` |

---

## Checkbox

```html
<input type="checkbox" class="c-input_checkbox">

<!-- Indeterminate -->
<input type="checkbox" class="c-input_checkbox" aria-checked="mixed">

<!-- Disabled -->
<input type="checkbox" class="c-input_checkbox c-input_checkbox--disabled" disabled>
```

**Design specs:**
- Tap target: minimum 24px × 24px
- Always paired with a label in a flex row with `align-items: center` and `gap: 8px`
- Label gets `flex-shrink: 0` — label text never truncates

---

## Radio Button / Radio Group

```html
<fieldset class="c-radiogroup">
  <input type="radio" class="c-input_radio" name="choice" value="a"> Option A
  <input type="radio" class="c-input_radio" name="choice" value="b"> Option B
</fieldset>
```

Error state: add `c-radiogroup--with_error`. Hint state: add `c-radiogroup--with_hint`.

---

## Switch

```html
<div class="c-switch" role="presentation">
  <input type="checkbox" class="c-switch__input" role="switch" aria-label="Toggle feature">
  <div class="c-switch__visual" aria-hidden="true" tabindex="-1"></div>
</div>
```

---

## Select (Custom Dropdown)

```html
<div class="c-select" id="my-select">
  <button class="c-select__button" type="button">
    <span class="c-select__value c-select__value--placeholder">Select...</span>
    <svg class="c-icon c-select__icon" ...><!-- caret-down --></svg>
  </button>
  <div class="c-select__dropdown">
    <button class="c-select__option" data-value="a" type="button">Option A</button>
    <button class="c-select__option" data-value="b" type="button">Option B</button>
    <button class="c-select__option c-select__option--selected" data-value="c" type="button">Option C</button>
  </div>
</div>
<script>Slacky.select('#my-select');</script>
```

| Modifier | Values |
|----------|--------|
| Size | `c-select__button--small` |
| State | `c-select__button--open`, `c-select__button--disabled` |
| Icon | `c-select__icon--open` (rotated caret) |

---

## Slider

```html
<input type="range" class="c-slider__input" min="0" max="100" step="1" value="50" aria-label="Volume">
```

---

## Label

```html
<label class="c-label c-label--block">
  <span class="c-label__text">Field Name</span>
  <span class="c-label__subtext">Helper description</span>
</label>
```

| Modifier | Values |
|----------|--------|
| Layout | `c-label--block`, `c-label--inline` |
| State | `c-label--disabled`, `c-label--pointer` |

Optional tag: `<span class="c-label__optional_tag">(optional)</span>` inside `c-label__text`.

---

## Hint

```html
<div class="c-hint">Helpful context below a field.</div>
```

---

## Inline Alert

```html
<div class="c-inline_alert">
  <div class="c-inline_alert__icon-wrapper"><svg class="c-icon"><!-- info-filled --></svg></div>
  <span class="c-inline_alert__text">This field is required.</span>
</div>
```

---

## Character Count

```html
<div class="c-input_character_count c-input_character_count--large">
  <input type="text" class="c-input_text c-input_text--large" maxlength="80" value="Hello">
  <span class="c-input_character_count__characters-remaining">75</span>
</div>
```

Add `c-input_character_count--invalid` when remaining < 0.

---

## Fieldset / Legend

```html
<fieldset class="c-fieldset">
  <legend class="c-legend">Section title</legend>
  <!-- form controls -->
</fieldset>
```

Disabled: add `c-legend--disabled`.

---

## Filter Input (Search)

```html
<div class="c-search__input_and_close">
  <div class="c-search__input_box">
    <svg class="c-icon c-search__input_box__icon"><!-- search icon --></svg>
    <input class="c-search__input_box__input" type="text" placeholder="Search">
    <button class="c-search__input_box__clear"><svg class="c-icon"><!-- close --></svg></button>
  </div>
</div>
```

---

## Alert

```html
<div class="c-alert c-alert--boxed c-alert--level_success c-alert--align_left" role="alert">
  <div class="c-alert__icon"><svg class="c-icon"><!-- check-circle-filled --></svg></div>
  <span class="c-alert__message">
    <strong class="c-alert__heading">Success!</strong>
    Your changes have been saved.
  </span>
  <div class="c-alert__close">
    <button class="c-icon_button c-icon_button--size_small c-icon_button--default" aria-label="Dismiss">
      <svg class="c-icon"><!-- close --></svg>
    </button>
  </div>
</div>
```

| Modifier | Values |
|----------|--------|
| Type | `c-alert--boxed`, `c-alert--inline_boxed`, `c-alert--nested_box`, `c-alert--inline` |
| Level | `c-alert--level_default`, `c-alert--level_info`, `c-alert--level_success`, `c-alert--level_warning`, `c-alert--level_error` |
| Align | `c-alert--align_left`, `c-alert--align_center`, `c-alert--align_right` |
| Multiline | `c-alert--multiline` (when heading is present) |

**Icon mapping:** default → `info-filled`, info → `info-filled`, success → `check-circle-filled`, warning → `warning-filled`, error → `close-circle-filled`.

---

## Banner

```html
<div role="dialog" aria-label="Warning" class="c-banner c-banner--warning">
  <div class="c-banner__text">Deploy is paused until further notice.</div>
  <button class="c-banner__close">
    <button class="c-icon_button c-icon_button--size_small c-icon_button--default" aria-label="Close">
      <svg class="c-icon"><!-- close --></svg>
    </button>
  </button>
</div>
```

| Modifier | Values |
|----------|--------|
| Type | `c-banner--info`, `c-banner--success`, `c-banner--warning`, `c-banner--urgent`, `c-banner--neutral` |
| Position | `c-banner--fixed` |

---

## Callout

```html
<div class="c-callout" role="group">Callout content.</div>
```

Variants: `c-callout--warning`, `c-callout--inverted`.

---

## Card

```html
<div class="c-card">
  <div class="c-card__header">Card Title</div>
  <div class="c-card__section">Card body content.</div>
  <div class="c-card__section">Another section.</div>
</div>
```

---

## Tag

```html
<span class="c-tag c-tag--aubergine">Design</span>
```

| Modifier | Values |
|----------|--------|
| Color | `c-tag--informative`, `c-tag--inverse-informative`, `c-tag--gray`, `c-tag--horchata`, `c-tag--honeycomb`, `c-tag--flamingo`, `c-tag--aubergine`, `c-tag--indigo`, `c-tag--lagoon`, `c-tag--jade`, `c-tag--grass` |
| Size | `c-tag--micro` |

Interactive tag: use `<button class="c-tag ...">`.

---

## Token (Chip)

```html
<span class="c-token c-token--medium">
  <span class="c-token__content">
    <span class="c-token_content__inner">@pendar</span>
  </span>
</span>
```

| Modifier | Values |
|----------|--------|
| Size | `c-token--small`, `c-token--medium`, `c-token--large` |
| State | `c-token--selected`, `c-token--loading`, `c-token--invalid`, `c-token--error`, `c-token--unknown`, `c-token--disabled`, `c-token--restricted` |

---

## Mention Badge

```html
<span class="c-mention_badge c-mention_badge--pill c-mention_badge--red">3</span>
```

| Modifier | Values |
|----------|--------|
| Shape | `c-mention_badge--pill`, `c-mention_badge--circle`, `c-mention_badge--pill-compact`, `c-mention_badge--dot` |
| Style | `c-mention_badge--transparent`, `c-mention_badge--black`, `c-mention_badge--red`, `c-mention_badge--white`, `c-mention_badge--blue`, `c-mention_badge--min_gray`, `c-mention_badge--themed`, `c-mention_badge--dimmed` |
| Overflow | `c-mention_badge--max` (shows "99+") |

---

## Dot

```html
<div class="c-dot c-dot--size-0 c-dot--sapphire c-dot--top-right c-dot--outward"></div>
```

| Modifier | Values |
|----------|--------|
| Size | `c-dot--size-0`, `c-dot--size-1` |
| Color | `c-dot--sapphire`, `c-dot--themed` |
| Position | `c-dot--top`, `c-dot--top-right`, `c-dot--right`, `c-dot--bottom-right`, `c-dot--bottom`, `c-dot--bottom-left`, `c-dot--left`, `c-dot--top-left` |
| Direction | `c-dot--inward`, `c-dot--outward` |

---

## Spinner

```html
<div class="c-infinite_spinner c-infinite_spinner--medium">
  <svg viewBox="0 0 100 100" class="c-infinite_spinner__spinner" aria-hidden="true">
    <circle class="c-infinite_spinner__bg" cx="50%" cy="50%" r="35"/>
    <circle class="c-infinite_spinner__path" cx="50%" cy="50%" r="35"/>
  </svg>
  <svg viewBox="0 0 100 100" class="c-infinite_spinner__spinner c-infinite_spinner__tail" aria-hidden="true">
    <circle class="c-infinite_spinner__path" cx="50%" cy="50%" r="35"/>
  </svg>
</div>
```

| Modifier | Values |
|----------|--------|
| Size | `c-infinite_spinner--small`, `--medium`, `--large`, `--jumbo`, `--spotlight` |
| Speed | `c-infinite_spinner--fast` |
| Color | `c-infinite_spinner--white`, `c-infinite_spinner--blue` |
| Layout | `c-infinite_spinner--inline` |

---

## Tabs

```html
<div class="c-tabs__tab_container" id="my-tabs">
  <div role="tablist" aria-label="Settings" class="c-tabs__tab_menu">
    <button role="tab" id="tab-general" aria-selected="true" aria-controls="panel-general" tabindex="0" class="c-tabs__tab c-tabs__tab--active">General</button>
    <button role="tab" id="tab-advanced" aria-selected="false" aria-controls="panel-advanced" tabindex="-1" class="c-tabs__tab">Advanced</button>
    <button role="tab" id="tab-disabled" aria-disabled="true" tabindex="-1" class="c-tabs__tab c-tabs__tab--disabled">Disabled</button>
  </div>
  <div role="tabpanel" id="panel-general" aria-labelledby="tab-general" class="c-tabs__tab_panel c-tabs__tab_panel--active">
    General content
  </div>
  <div role="tabpanel" id="panel-advanced" aria-labelledby="tab-advanced" class="c-tabs__tab_panel" hidden>
    Advanced content
  </div>
  <div role="tabpanel" id="panel-disabled" aria-labelledby="tab-disabled" class="c-tabs__tab_panel" hidden></div>
</div>
<script>Slacky.tabs('#my-tabs');</script>
```

| Modifier | Values |
|----------|--------|
| Active tab | `c-tabs__tab--active` |
| Disabled | `c-tabs__tab--disabled` + `aria-disabled="true"` |
| Full width | `c-tabs__tab_menu--full_width` + `c-tabs__tab--full_width` on each tab |
| Vertical | `c-tabs__tab_container--vertical` + `c-tabs__tab_menu--vertical` |
| Full height | `c-tabs__tab_container--full_height` + `c-tabs__tab_panel--full_height` |

**Tab with icon and count:**
```html
<button role="tab" class="c-tabs__tab c-tabs__tab--active">
  <span class="c-tabs__tab_icon--left"><svg class="c-icon" style="font-size:16px">...</svg></span>
  Messages
  <span class="c-tabs__tab_count">42</span>
</button>
```

---

## Menu

```html
<div class="c-menu" id="my-menu" style="width:300px">
  <ul class="c-menu__items" role="menu" aria-label="Actions" tabindex="0">
    <li class="c-menu_item__header" role="presentation" aria-hidden="true">Section</li>
    <li class="c-menu_item__li" role="presentation">
      <button class="c-menu_item__button" role="menuitem" tabindex="-1">
        <span class="c-menu_item__icon"><svg class="c-icon" style="font-size:20px"><!-- edit --></svg></span>
        <span class="c-menu_item__label">Edit message</span>
        <span class="c-menu_item__shortcut">E</span>
      </button>
    </li>
    <li class="c-menu_separator__li" role="separator"><hr class="c-menu_separator__separator"></li>
    <li class="c-menu_item__li" role="presentation">
      <button class="c-menu_item__button c-menu_item__button--danger" role="menuitem" tabindex="-1">
        <span class="c-menu_item__label">Delete message</span>
      </button>
    </li>
  </ul>
</div>
<script>Slacky.menu('#my-menu');</script>
```

| Modifier | Values |
|----------|--------|
| Highlighted | `c-menu_item__button--highlighted` (managed by JS) |
| Danger | `c-menu_item__button--danger` |
| Disabled | `c-menu_item__button--disabled` |
| Checked | `c-menu_item__button--checked` + `role="menuitemcheckbox"` + `aria-checked` |

**Menu item with description:**
```html
<button class="c-menu_item__button" role="menuitem" tabindex="-1">
  <span class="c-menu_item__label c-menu_item__label--with_description">
    Pin to channel
    <span class="c-menu_item__description">Everyone in this channel will see this.</span>
  </span>
</button>
```

**Menu item with checkmark:**
```html
<button class="c-menu_item__button c-menu_item__button--checked" role="menuitemcheckbox" aria-checked="true" tabindex="-1">
  <span class="c-menu_item__checkmark"><svg class="c-icon" style="font-size:16px"><!-- check --></svg></span>
  <span class="c-menu_item__label">Show timestamps</span>
</button>
```

---

## Modal

```html
<div class="c-sk-modal_overlay" id="my-modal" hidden>
  <div class="c-sk-modal c-sk-modal--medium" role="dialog" aria-modal="true" aria-label="Edit profile">
    <div class="c-sk-modal__header">
      <h2 class="c-sk-modal__title">Edit profile</h2>
      <button class="c-icon_button c-icon_button--size_medium c-icon_button--default" aria-label="Close">
        <svg class="c-icon"><!-- close --></svg>
      </button>
    </div>
    <div class="c-sk-modal__content">
      Modal body content
    </div>
  </div>
</div>
<script>
  const modal = Slacky.modal('#my-modal');
  document.querySelector('#open-btn').onclick = () => modal.open();
</script>
```

| Modifier | Values |
|----------|--------|
| Size | `c-sk-modal--small`, `c-sk-modal--medium`, `c-sk-modal--large` |

JS API: `Slacky.modal(el)` returns `{ open(), close(), onClose(fn) }`. Handles focus trap, escape key, overlay click.

**Design specs:**
- Border-radius: 8px (`--dt_static_radius-large`)
- Shadow: `--dt_static_shadow-lg`
- Structure: header → scrollable content → footer
- Footer actions: right-aligned, primary button last
- Always set `aria-label` or `aria-labelledby` for accessibility

---

## Popover

```html
<button id="anchor">Open</button>
<div class="c-popover" id="my-popover">
  Popover content here
</div>
<script>
  const pop = Slacky.popover('#my-popover', '#anchor', { position: 'bottom', align: 'start' });
  document.querySelector('#anchor').onclick = () => pop.toggle();
</script>
```

JS API: `Slacky.popover(popoverEl, anchorEl, { position, align, offset, onClose })` returns `{ open(), close(), toggle(), isOpen(), position() }`.

Options: `position` = top | bottom | left | right. `align` = start | center | end. `offset` = pixels (default 8).

---

## Tooltip

```html
<button id="my-btn">Hover me</button>
<script>
  Slacky.tooltip('#my-btn', { text: 'Send message', position: 'top' });
</script>
```

JS API: `Slacky.tooltip(triggerEl, { text, position, delay, maxWidth, status })`.

Options: `position` = top | bottom | left | right | top-left | top-right | bottom-left | bottom-right. `maxWidth` = small | large. `status` = info | success. `delay` = ms (default 150).

---

## Context Menu

```html
<div id="trigger-area">Right-click here</div>
<div class="c-menu" id="ctx-menu" style="width:200px">
  <ul class="c-menu__items" role="menu" tabindex="0">
    <li class="c-menu_item__li" role="presentation">
      <button class="c-menu_item__button" role="menuitem" tabindex="-1">
        <span class="c-menu_item__label">Copy</span>
      </button>
    </li>
  </ul>
</div>
<script>
  Slacky.contextMenu('#trigger-area', '#ctx-menu');
  Slacky.menu('#ctx-menu');
</script>
```

---

## Toast

```html
<div class="c-toast" id="my-toast" role="status" hidden>
  <div class="c-toast__wrapper">
    <svg class="c-icon" style="font-size:20px"><!-- check-circle-filled --></svg>
    Message sent successfully
  </div>
  <button class="c-icon_button c-icon_button--size_small c-icon_button--default c-toast__close-button" aria-label="Dismiss">
    <svg class="c-icon"><!-- close --></svg>
  </button>
</div>
<script>
  const toast = Slacky.toast('#my-toast', { duration: 5000 });
  toast.show(); // auto-dismisses after 5s
</script>
```

JS API: `Slacky.toast(el, { duration, persistent })` returns `{ show(), dismiss() }`.

Set `persistent: true` to keep toast until manually dismissed.

---

## Sidebar Menu

```html
<div class="c-sidebar_menu" id="my-sidebar">
  <ul class="c-sidebar_menu__list" role="menu">
    <li role="presentation"><h3 class="c-sidebar_menu__header">Channels</h3></li>
    <li role="presentation">
      <button class="c-sidebar_menu__list_item is_active" role="menuitem" data-item-id="general"># general</button>
    </li>
    <li role="presentation">
      <button class="c-sidebar_menu__list_item" role="menuitem" data-item-id="random"># random</button>
    </li>
    <li role="presentation"><hr class="c-sidebar_menu__divider"></li>
    <li role="presentation">
      <button class="c-sidebar_menu__list_item is_disabled" role="menuitem" aria-disabled="true"># archived</button>
    </li>
  </ul>
</div>
<script>Slacky.sidebarMenu('#my-sidebar');</script>
```

Active item: `is_active`. Disabled: `is_disabled` + `aria-disabled="true"`.

---

## Calendar

```html
<div class="c-calendar">
  <div class="c-calendar__header">
    <button class="c-icon_button c-icon_button--size_small c-icon_button--default" aria-label="Previous month">
      <svg class="c-icon"><!-- caret-left-filled --></svg>
    </button>
    <span class="c-calendar__header_month">January 2026</span>
    <button class="c-icon_button c-icon_button--size_small c-icon_button--default" aria-label="Next month">
      <svg class="c-icon"><!-- caret-right-filled --></svg>
    </button>
  </div>
  <div class="c-calendar__grid">
    <div class="c-calendar__day-header">Su</div>
    <div class="c-calendar__day-header">Mo</div>
    <!-- ... -->
    <button class="c-calendar__day c-calendar__day--outside" disabled>30</button>
    <button class="c-calendar__day">1</button>
    <button class="c-calendar__day c-calendar__day--today">15</button>
    <button class="c-calendar__day c-calendar__day--selected">20</button>
  </div>
</div>
```

---

## Date Picker

```html
<div class="c-date_picker">
  <button class="c-date_picker__trigger">
    <svg class="c-icon c-date_picker__icon"><!-- calendar --></svg>
    <span class="c-date_picker__value c-date_picker__value--placeholder">Select date</span>
  </button>
  <!-- Use Slacky.popover() to wire the calendar dropdown -->
</div>
```

---

## Time Picker

```html
<div class="c-time_picker">
  <button class="c-time_picker__trigger">
    <svg class="c-icon c-time_picker__icon"><!-- clock --></svg>
    <span class="c-time_picker__value">2:30 PM</span>
  </button>
  <div class="c-time_picker__dropdown">
    <button class="c-time_picker__option">12:00 PM</button>
    <button class="c-time_picker__option c-time_picker__option--selected">2:30 PM</button>
    <button class="c-time_picker__option">3:00 PM</button>
  </div>
</div>
```

---

## Pagination

```html
<nav class="c-pagination_wrapper" aria-label="Pagination">
  <div class="c-pagination__container">
    <button class="c-icon_button c-pagination__arrow_btn" disabled aria-label="Previous">
      <svg class="c-icon"><!-- caret-left-filled --></svg>
    </button>
    <button class="c-pagination__page_btn c-pagination__page_btn--active" aria-current="page">1</button>
    <button class="c-pagination__page_btn">2</button>
    <button class="c-pagination__page_btn">3</button>
    <button class="c-icon_button c-pagination__arrow_btn" aria-label="Next">
      <svg class="c-icon"><!-- caret-right-filled --></svg>
    </button>
  </div>
</nav>
```

---

## Empty State

```html
<div class="c-empty_state" role="alert">
  <div class="c-empty_state__title">No results found</div>
  <div class="c-empty_state__description">Try a different search term.</div>
  <div class="c-empty_state__action">
    <button class="c-button c-button--outline c-button--medium">Clear filters</button>
  </div>
</div>
```

Extended variant: add `c-empty_state--extended`.

---

## Keyboard Key

```html
<div class="c-keyboard_keys c-keyboard_keys--inline">
  <div class="c-keyboard_key" role="img" aria-label="Cmd" aria-hidden="true">
    <svg class="c-icon"><!-- command --></svg>
  </div>
  <div class="c-keyboard_key" role="img" aria-label="K">K</div>
</div>
```

Slim: `c-keyboard_key--slim`. Dark bg: `c-keyboard_key--dark`. Arrow keys: `c-keyboard_key__arrow_key`.

---

## Link

```html
<a href="#" class="c-link">Link text</a>
```

| Modifier | Values |
|----------|--------|
| Inherit color | `c-link--inherit-color` |
| Underline | `c-link--underline`, `c-link--underline-inherit` |

**Button Link (no href, looks like a link):**
```html
<button type="button" class="c-link c-link--button">Click me</button>
```

Disabled: `c-link--disabled` + `disabled`.

---

## Toolbar

```html
<div role="toolbar" aria-label="Formatting" aria-orientation="horizontal" class="c-toolbar">
  <button class="c-icon_button c-icon_button--size_medium c-icon_button--default" tabindex="0" aria-label="Bold">B</button>
  <button class="c-icon_button c-icon_button--size_medium c-icon_button--default" tabindex="-1" aria-label="Italic">I</button>
</div>
```

Vertical: add `c-toolbar--vertical` + `aria-orientation="vertical"`.

---

## Truncate

```html
<span class="c-truncate" style="--lines: 2">
  Long text that will be truncated after 2 lines with an ellipsis...
</span>
```

Word breaking: `c-truncate--break_words`. Overflow wrap: `c-truncate--overflowWrap`.

---

## Aspect Box

```html
<div class="c-aspect_box__outer" style="width: 300px">
  <div class="c-aspect_box__inner" style="padding-top: 66.67%">
    <div class="c-aspect_box__content">
      Content at 3:2 ratio
    </div>
  </div>
</div>
```

Calculate `padding-top` as `(height / width) * 100%`.

---

## Coachmark

```html
<div class="c-coachmark c-coachmark--bottom" style="position:fixed; top:100px; left:200px;">
  <div class="c-coachmark__arrow"></div>
  <div class="c-coachmark__title">New feature!</div>
  <div class="c-coachmark__body">Try clicking here to get started.</div>
  <div class="c-coachmark__actions">
    <button class="c-link c-link--button c-link--inherit-color" type="button">Skip</button>
    <button class="c-button c-button--primary c-button--small">Got it</button>
  </div>
</div>
```

Position: `c-coachmark--top`, `c-coachmark--bottom`, `c-coachmark--left`, `c-coachmark--right`.

For overlay with anchor cutout, use `c-coachmark__overlay` with clip-path. See slacky.js for positioning helpers.

---

## Dark Mode

Toggle at the `<html>` level:
```html
<html class="sk-client-theme--dark">
```

Or via JS:
```js
Slacky.darkMode(true);   // Enable dark mode
Slacky.darkMode(false);  // Disable
Slacky.darkMode();       // Toggle
```

All components automatically adapt — no additional classes needed.

---

## Section Header (Collapsible)

**Design specs:**
- `display: flex; align-items: center; justify-content: space-between`
- Title: 15px bold (`--dt_static_type-size-base`, `--dt_static_type-weight-bold`)
- Padding: 8px 16px (`--dt_static_space-050`, `--dt_static_space-100`)
- Collapse icon: 16px, vertically centered with the title text

---

## Settings Panel / Sidebar

**Design specs:**
- Panel padding: 16px (`--dt_static_space-100`)
- Row gap: 8px (`--dt_static_space-050`) for compact lists, 12px (`--dt_static_space-075`) for form fields
- Section gap: 16px (`--dt_static_space-100`) between sections
- Structure: flex column → scrollable body (`flex: 1; overflow-y: auto; min-height: 0`) → sticky footer if buttons present

---

## Design Token Quick Reference

### Spacing
`--dt_static_space-{n}`: 0, px (1px), 0125 (2px), 025 (4px), 050 (8px), 075 (12px), 100 (16px), 125 (20px), 150 (24px), 175 (28px), 200 (32px), 225 (36px), 250 (40px), 300 (48px), 400 (64px)

Slack uses a 4px base grid. All spacing must come from this scale — never use arbitrary pixel values.

**Common spacing tokens** (memorize these — they cover 90% of use cases):
| Token | Value | Typical use |
|---|---|---|
| `--dt_static_space-025` | 4px | Tight gaps: icon-to-text in compact rows |
| `--dt_static_space-050` | 8px | Default gap between small elements, inner padding of compact components |
| `--dt_static_space-075` | 12px | Padding inside inputs, buttons, list items |
| `--dt_static_space-100` | 16px | Standard content padding, gap between form fields, card padding |
| `--dt_static_space-150` | 24px | Section spacing, panel padding |
| `--dt_static_space-200` | 32px | Large section separation |
| `--dt_static_space-300` | 48px | Page-level vertical spacing |

**Also available:** `0px`, `1px` (space-px), `2px` (space-0125), `20px` (space-125), `28px` (space-175), `36px` (space-225), `40px` (space-250), `44px` (space-275).

**Rules:**
- All `gap`, `padding`, and `margin` values must come from this scale.
- If you need 10px, use 8px or 12px. If you need 6px, use 4px or 8px. Never split the difference.
- Horizontal padding and vertical padding on the same element don't have to match, but each must be a token value.

### Typography
- Sizes: `--dt_static_type-size-micro` (12px), `-caption` (13px), `-base` (15px), `-subtitle` (18px), `-title` (22px), `-headline` (28px)
- Weights: `--dt_static_type-weight-base` (400), `-bold` (700), `-black` (900)
- Leading: `--dt_static_type-leading-small` (1.25), `-base` (1.5)

Font family — use the canonical CSS variable from Slack Kit's `global.css`:
```css
--font-family-lato: 'Slack-Lato', 'Slack-Fractions', 'appleLogo', sans-serif;
--font-family-default: var(--font-family-lato);
```
In prototypes, define these as `:root` CSS variables and use `font-family: var(--font-family-default)` on the body. Map `Slack-Lato` to the Google Fonts Lato via `@font-face` declarations so the font resolves correctly outside the webapp.

**Type scale** (use CSS variables in prototypes):
| Token | Size | Use for |
|---|---|---|
| `--dt_static_type-size-micro` | 12px | Timestamps, metadata, tertiary labels |
| `--dt_static_type-size-caption` | 13px | Secondary text, descriptions, helper text |
| `--dt_static_type-size-base` | 15px | Body text, messages, form labels, menu items — the default |
| `--dt_static_type-size-subtitle` | 18px | Section headings, panel titles |
| `--dt_static_type-size-title` | 22px | Page titles, modal titles |
| `--dt_static_type-size-headline` | 28px | Large headings, hero text |

**Weights:**
| Token | Value | Use for |
|---|---|---|
| `--dt_static_type-weight-base` | 400 | Body text, labels, descriptions |
| `--dt_static_type-weight-bold` | 700 | Buttons, section headers, emphasis, active states |
| `--dt_static_type-weight-black` | 900 | Hero/display text only |

**Line height:**
| Token | Value | Use for |
|---|---|---|
| `--dt_static_type-leading-small` | 1.25 | Headings, single-line UI labels |
| `--dt_static_type-leading-base` | 1.5 | Body text, multi-line content |

**Rules:**
- Default all text to `15px / weight 400 / line-height 1.5` unless there's a reason to differ.
- Never use font sizes outside this scale (no 14px, no 16px, no 20px).
- Never use font weights outside this scale (no 500, no 300).

### Border Radius
`--dt_static_radius-none` (0), `-small` (2px), `-base` (6px), `-large` (8px), `-xlarge` (12px), `-rounded` (9999px)

| Token | Value | Use for |
|---|---|---|
| `--dt_static_radius-none` | 0px | No rounding |
| `--dt_static_radius-small` | 2px | Subtle rounding: tooltips, small tags |
| `--dt_static_radius-base` | 6px | Default: buttons, inputs, cards, dropdowns |
| `--dt_static_radius-large` | 8px | Modals, panels, larger containers |
| `--dt_static_radius-xlarge` | 12px | Large cards, feature panels |
| `--dt_static_radius-rounded` | 9999px | Pill shapes: badges, avatars, chips |

**Rules:**
- Default to `radius-base` (6px) for interactive elements. Never use 4px or 5px.
- Buttons are always `radius-base` (6px).
- Avatars and status indicators are always `radius-rounded` (pill).

### Shadows
`--dt_static_shadow-sm`, `-base`, `-md`, `-lg`, `-xl`, `-2xl`, `-inner`, `-a11y`

| Token | CSS | Use for |
|---|---|---|
| `--dt_static_shadow-sm` | `0 1px 2px #0000000c` | Subtle lift: cards at rest |
| `--dt_static_shadow-base` | `0 1px 2px -1px #00000019, 0 1px 3px #00000019` | Default elevation: dropdowns, popovers |
| `--dt_static_shadow-md` | `0 4px 6px -1px #00000019, 0 2px 4px -2px #00000019` | Medium elevation: modals, panels |
| `--dt_static_shadow-lg` | `0 10px 15px -3px #00000019, 0 4px 6px -4px #00000019` | High elevation: toasts, overlays |
| `--dt_static_shadow-xl` | `0 8px 10px -6px #00000019, 0 20px 25px -5px #00000019` | Highest elevation |
| `--dt_static_shadow-2xl` | `0 25px 50px -12px #00000040` | Maximum elevation |
| `--dt_static_shadow-inner` | `inset 0 2px 4px #0000000c` | Pressed/inset states |
| `--dt_static_shadow-a11y` | `0 0 0 5px #0e9dd333, 0 0 0 1px #1264a3` | Focus ring (accessibility) |

### Colors
Slack uses semantic color tokens. Never hardcode hex values — always use the token CSS variable.

These are the core semantic tokens and brand colors — they cover most prototype work. For palette ramps (`--dt_color-plt-*` — 20 families × 12 stops), look them up in `tokens.css` (hex values with RGB in comments) or query the Design Tokens MCP via `mcp__design-tokens__tokens-search`. Do not guess palette values.

**Theming:** Themes don't use separate variable names — they override the same `--dt_color-*` variables, scoped under a CSS class. Add `sk-client-theme--sidebar` to a container and all tokens inside it resolve to sidebar-specific values. Available theme classes in `tokens.css`: `sk-client-theme--light` (default on `:root`), `sk-client-theme--dark`, `sk-client-theme--sidebar`.

- Primary bg: `--dt_color-base-pry` (#fff / #1a1d21)
- Primary text: `--dt_color-content-pry` (#1d1c1d / #f8f8f8)
- Secondary text: `--dt_color-content-sec` (#454447 / #b9babd)
- Blue accent: `--dt_color-base-inv-hgl-1` (#1264a3)
- Green accent: `--dt_color-base-inv-hgl-2` (#007a5a)
- Red/danger: `--dt_color-base-inv-imp` (#e01e5a)
- Yellow: `--dt_color-base-inv-hgl-3` (#f1b900)
- Border: `--dt_color-otl-sec`
- Hover bg: `--dt_color-base-pry-hover`

**Content (text/icons):**
| Token | Purpose |
|---|---|
| `--dt_color-content-pry` | Primary text, headings |
| `--dt_color-content-sec` | Secondary text, descriptions |
| `--dt_color-content-ter` | Placeholder text, muted labels |
| `--dt_color-content-hgl-1` | Links, interactive text (blue) |
| `--dt_color-content-imp` | Error text, destructive labels (red) |
| `--dt_color-content-hgl-2` | Success text (green) |
| `--dt_color-content-hgl-3` | Warning text (yellow) |
| `--dt_color-content-inv-pry` | White text on dark fills (#ffffff) |
| `--dt_color-content-inv-sec` | Secondary text on dark fills (#cbcccf) |
| `--dt_color-content-inv-hgl-1` | Blue text on dark fills (#9ed6fa) |
| `--dt_color-content-inv-hgl-2` | Green text on dark fills (#4cc894) |
| `--dt_color-content-inv-hgl-3` | Yellow text on dark fills (#ffd738) |
| `--dt_color-content-inv-imp` | Red text on dark fills (#ffa3c2) |

**Base (solid backgrounds):**
| Token | Purpose |
|---|---|
| `--dt_color-base-pry` | Main page/panel background (#ffffff) |
| `--dt_color-base-sec` | Subtle background tint (#f8f8f8) |
| `--dt_color-base-ter` | Muted background (#eaeaea) |
| `--dt_color-base-hgl-1` | Selected/active background, blue tint (#e3f8ff) |
| `--dt_color-base-hgl-2` | Success background, green tint (#e3fff3) |
| `--dt_color-base-hgl-3` | Warning background, yellow tint (#fffae0) |
| `--dt_color-base-imp` | Error background, red tint (#ffe8ef) |
| `--dt_color-base-inv-pry` | Dark fill — tooltips, toasts (#1d1c1d) |
| `--dt_color-base-modal` | Modal backdrop overlay (#1d1c1db3) |

**Surface (semi-transparent overlays):**
| Token | Purpose |
|---|---|
| `--dt_color-surf-pry` | Faint surface overlay (#1d1c1d0f) |
| `--dt_color-surf-sec` | Stronger surface overlay (#1d1c1d40) |
| `--dt_color-surf-hgl-1` | Selected/active surface overlay, blue (#36c5f021) |
| `--dt_color-surf-hgl-2` | Success surface overlay, green (#4cc89440) |
| `--dt_color-surf-hgl-3` | Warning surface overlay, yellow (#ffc6002e) |
| `--dt_color-surf-imp` | Error surface overlay, red (#ff81aa21) |
| `--dt_color-surf-inv` | Light overlay on dark backgrounds (#ffffff2e) |
| `--dt_color-surf-inv-hgl-3` | Yellow overlay on dark (#aa8000b3) |

**Container:**
| Token | Purpose |
|---|---|
| `--dt_color-ctr-pry` | Card/container background (#ffffff) |
| `--dt_color-ctr-sec` | Muted container background (#f8f8f8) |

**Filled/inverse backgrounds (for buttons, badges):**
| Token | Purpose |
|---|---|
| `--dt_color-base-inv-hgl-1` | Filled blue button/badge background (#1264a3) |
| `--dt_color-base-inv-hgl-2` | Filled green button/badge background (#007a5a) |
| `--dt_color-base-inv-hgl-3` | Filled yellow button/badge background (#f1b900) |
| `--dt_color-base-inv-imp` | Filled red/danger button background (#e01e5a) |

**Outlines (borders):**
| Token | Purpose |
|---|---|
| `--dt_color-otl-pry` | Default borders, inputs, cards, dividers (#7c7a7f) |
| `--dt_color-otl-sec` | Stronger borders (#5e5d6073) |
| `--dt_color-otl-ter` | Subtle/faint borders (#5e5d6021) |
| `--dt_color-otl-hgl-1` | Focus/active borders, blue (#1264a3) |
| `--dt_color-otl-hgl-1-sec` | Focus ring secondary, a11y (#0e9dd333) |
| `--dt_color-otl-hgl-2` | Success borders, green (#007a5a) |
| `--dt_color-otl-hgl-2-sec` | Success focus ring secondary (#007a5a1a) |
| `--dt_color-otl-hgl-3` | Warning borders, yellow (#c79600) |
| `--dt_color-otl-hgl-3-sec` | Warning focus ring secondary (#f1b90033) |
| `--dt_color-otl-imp` | Error borders, red (#e01e5a) |
| `--dt_color-otl-imp-sec` | Error focus ring secondary (#e01e5a4d) |
| `--dt_color-otl-inv-pry` | Borders on dark fills (#f8f8f8d9) |
| `--dt_color-otl-inv-sec` | Subtle borders on dark fills (#f8f8f88c) |
| `--dt_color-otl-inv-ter` | Faintest borders on dark fills (#f8f8f833) |

**Brand — Core:**
| Token | Value | Purpose |
|---|---|---|
| `--dt_color-brand-core-aubergine` | #4a154b | Slack brand purple |
| `--dt_color-brand-core-horchatta` | #f4ede4 | Warm off-white |
| `--dt_color-brand-core-black` | #1d1c1d | Near-black |
| `--dt_color-brand-core-white` | #ffffff | White |
| `--dt_color-brand-core-slack-blue` | #36c5f0 | Slack logo blue |
| `--dt_color-brand-core-slack-green` | #2eb67d | Slack logo green |
| `--dt_color-brand-core-slack-yellow` | #ecb22e | Slack logo yellow |
| `--dt_color-brand-core-slack-red` | #e01e5a | Slack logo red |

**Brand — Secondary:**
| Token | Value | Purpose |
|---|---|---|
| `--dt_color-brand-sec-text` | #1d1c1d | Body text |
| `--dt_color-brand-sec-small-text` | #454447 | Secondary/small text |
| `--dt_color-brand-sec-legal` | #5e5d60 | Legal/fine print text |
| `--dt_color-brand-sec-bg-gray` | #f8f8f8 | Light gray background |
| `--dt_color-brand-sec-inactive-gray` | #eaeaea | Inactive/disabled gray |
| `--dt_color-brand-sec-bright-aubergine` | #611f69 | Brighter aubergine |
| `--dt_color-brand-sec-berry` | #5e1237 | Deep berry |
| `--dt_color-brand-sec-mauve` | #c05b8c | Pink-purple |
| `--dt_color-brand-sec-bubblegum` | #ffb6bd | Light pink |
| `--dt_color-brand-sec-salmon` | #f2606a | Salmon red |
| `--dt_color-brand-sec-crimson` | #921d21 | Dark red |
| `--dt_color-brand-sec-terracotta` | #de8969 | Warm orange |
| `--dt_color-brand-sec-peach` | #fed4be | Light peach |
| `--dt_color-brand-sec-sandbar` | #ffd57e | Warm yellow |
| `--dt_color-brand-sec-moss` | #608813 | Yellow-green |
| `--dt_color-brand-sec-evergreen` | #185f34 | Deep green |
| `--dt_color-brand-sec-pool` | #78d7dd | Light cyan |
| `--dt_color-brand-sec-teal` | #167d8e | Dark teal |
| `--dt_color-brand-sec-cobalt` | #112377 | Deep blue |

Brand tokens are for marketing pages and brand-specific collateral. For product UI, always prefer semantic tokens (`content-pry`, `base-hgl-1`, etc.) — they adapt to themes automatically.

**Hover/pressed states:** Most color tokens have `-hover` and `-pressed` variants (e.g., `--dt_color-base-pry-hover`, `--dt_color-base-inv-hgl-1-hover`). Use these for interaction states.

**Rules:**
- Always use semantic tokens (`content-pry`) over palette tokens (`brand-core-black`) — semantic tokens adapt to themes.
- For text on white backgrounds: use `content-pry` for headings/body, `content-sec` for supporting text, `content-ter` for the most muted text.
- For interactive elements (links, buttons): use `content-hgl-1` for text, `base-hgl-1` for active backgrounds, `otl-hgl-1` for focus borders.
- For errors/destructive: use `content-imp` for text, `base-imp` for background, `otl-imp` for borders.

### Font Family
`--font-family-lato` (Slack-Lato), `--font-family-monospace`, `--font-family-default`

---

## Channel Sidebar (Layout Component)

Full sidebar with workspace header, search, collapsible sections, and channel rows in all states.

```html
<div class="p-channel_sidebar" style="width:260px; height:500px;">
  <!-- Header -->
  <div class="p-channel_sidebar__header">
    <span class="p-channel_sidebar__header_name">Acme Corp</span>
  </div>

  <!-- Search -->
  <div class="p-channel_sidebar__search">
    <svg class="c-icon" style="font-size:14px"><!-- search icon --></svg>
    Search Acme Corp
  </div>

  <!-- Scrollable channel list -->
  <div class="p-channel_sidebar__list">

    <!-- Page rows — top-level navigation items -->
    <div class="p-channel_sidebar__pages">
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- list-view icon --></svg></span>
        Unreads
      </a>
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- threads icon --></svg></span>
        Threads
      </a>
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- headphones icon --></svg></span>
        Huddles
      </a>
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- sparkles icon --></svg></span>
        Recap
      </a>
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- send icon --></svg></span>
        Drafts &amp; sent
      </a>
      <a class="p-channel_sidebar__page_row" href="#">
        <span class="p-channel_sidebar__page_row_icon"><svg class="c-icon" style="font-size:16px"><!-- user-directory icon --></svg></span>
        Directories
      </a>
    </div>

    <div class="p-channel_sidebar__divider"><div class="p-channel_sidebar__divider_line"></div></div>

    <!-- Section heading -->
    <div class="p-channel_sidebar__section_heading">
      <span class="p-channel_sidebar__section_heading_caret">
        <svg class="c-icon" style="font-size:12px"><!-- caret-down-filled --></svg>
      </span>
      <span class="p-channel_sidebar__section_heading_label">Channels</span>
    </div>

    <!-- Channel row — default -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel" href="#">
        <span class="p-channel_sidebar__channel_icon_prefix p-channel_sidebar__channel_icon--hash">#</span>
        <span class="p-channel_sidebar__name">general</span>
      </a>
    </div>

    <!-- Channel row — selected -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel p-channel_sidebar__channel--selected" href="#">
        <span class="p-channel_sidebar__channel_icon_prefix p-channel_sidebar__channel_icon--hash">#</span>
        <span class="p-channel_sidebar__name">design</span>
      </a>
    </div>

    <!-- Channel row — unread with badge -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel p-channel_sidebar__channel--unread" href="#">
        <span class="p-channel_sidebar__channel_icon_prefix p-channel_sidebar__channel_icon--hash">#</span>
        <span class="p-channel_sidebar__name">engineering</span>
        <span class="p-channel_sidebar__channel_suffix">
          <span class="p-channel_sidebar__badge">3</span>
        </span>
      </a>
    </div>

    <!-- Channel row — muted -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel p-channel_sidebar__channel--muted" href="#">
        <span class="p-channel_sidebar__channel_icon_prefix p-channel_sidebar__channel_icon--hash">#</span>
        <span class="p-channel_sidebar__name">social</span>
      </a>
    </div>

    <!-- Private channel (lock icon) -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel" href="#">
        <span class="p-channel_sidebar__channel_icon_prefix p-channel_sidebar__channel_icon--lock">🔒</span>
        <span class="p-channel_sidebar__name">team-leads</span>
      </a>
    </div>

    <div class="p-channel_sidebar__spacer"></div>

    <!-- DMs section -->
    <div class="p-channel_sidebar__section_heading">
      <span class="p-channel_sidebar__section_heading_caret">
        <svg class="c-icon" style="font-size:12px"><!-- caret-down-filled --></svg>
      </span>
      <span class="p-channel_sidebar__section_heading_label">Direct Messages</span>
    </div>

    <!-- DM row — with presence dot (active) -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel" href="#">
        <span class="p-channel_sidebar__presence p-channel_sidebar__presence--active"></span>
        <span class="p-channel_sidebar__name">Jane Smith</span>
      </a>
    </div>

    <!-- DM row — with presence dot (away) -->
    <div class="p-channel_sidebar__row_container">
      <a class="p-channel_sidebar__channel" href="#">
        <span class="p-channel_sidebar__presence p-channel_sidebar__presence--away"></span>
        <span class="p-channel_sidebar__name">Bob Chen</span>
      </a>
    </div>
  </div>
</div>
```

| Element | Class |
|---------|-------|
| Container | `p-channel_sidebar` |
| Header | `p-channel_sidebar__header` |
| Workspace name | `p-channel_sidebar__header_name` |
| Search bar | `p-channel_sidebar__search` |
| Pages container | `p-channel_sidebar__pages` |
| Page row | `p-channel_sidebar__page_row` |
| Page row icon | `p-channel_sidebar__page_row_icon` |
| Scroll area | `p-channel_sidebar__list` |
| Section heading | `p-channel_sidebar__section_heading` |
| Section label | `p-channel_sidebar__section_heading_label` |
| Collapse caret | `p-channel_sidebar__section_heading_caret` |
| Row container | `p-channel_sidebar__row_container` |
| Channel row | `p-channel_sidebar__channel` |
| Channel icon | `p-channel_sidebar__channel_icon_prefix` |
| Channel name | `p-channel_sidebar__name` |
| Suffix area | `p-channel_sidebar__channel_suffix` |
| Badge | `p-channel_sidebar__badge` |
| Presence dot | `p-channel_sidebar__presence` |
| Spacer | `p-channel_sidebar__spacer` |
| Divider | `p-channel_sidebar__divider` |

**Channel states:**

| State | Class | Effect |
|-------|-------|--------|
| Selected | `p-channel_sidebar__channel--selected` | Highlight background, white text |
| Unread | `p-channel_sidebar__channel--unread` | Bold (weight 900), full opacity |
| Muted | `p-channel_sidebar__channel--muted` | Dimmed to 40% opacity |

**Theming:** Set CSS custom properties on `.p-channel_sidebar`:
- `--sidebar-bg` — background color (default: aubergine-90)
- `--sidebar-selected-bg` — selected item background
- `--sidebar-badge-bg` — notification badge color
- `--sidebar-presence-active` — active presence dot color
