# Slackbot Onboarding — Interaction Spec for Engineering

## Overview

This document captures the interaction specifications for the Slackbot onboarding experience prototype. It covers all state management, user interactions, response generation logic, animations, and cross-component communication needed for implementation.

---

## 1. State Architecture

### Primary States

| State | Description |
|-------|-------------|
| **Home** | Card grid with welcome message, 5 prompt cards (2 left, 3 right) |
| **Conversation** | Chat thread with user/bot messages, typing indicator, CTA buttons |
| **Modal** | Overlay dialogs (Team Tools, Invite Team) |

### Navigation History

- Stack-based: `[{ view, substate }]` entries
- `view`: which sidebar panel is active (`slackbot-dm`, `new-channel`, etc.)
- `substate`: inner state of the slackbot view (`home` or `conversation`)
- Back/forward buttons enable/disable based on stack position
- Workspace name click = full state reset (escape hatch)

---

## 2. Personalization Model

### Input Dimensions

| Dimension | Values |
|-----------|--------|
| Team Size | `1-2`, `3-10`, `10-30`, `30+` |
| Use Case | `collab`, `projects`, `customers`, `external`, `integrations`, `ai` |

### Rules

1. If only `collab` selected → `isDefaultUseCaseOnly = true` → show follow-up question instead of full response
2. If multiple use cases → prioritize first non-`collab` selection as `primaryUseCase`
3. Both dimensions are stored and used to generate all responses

### Home Card Personalization

- **Right card 1**: "Set up Slack for [use case label]" — title changes per use case
- **Right card 2**: "Popular first moves" — subtitle changes per team size (e.g., "What do 3–10 person teams do first?")
- **Right card 3**: "How to use Slack" — static

---

## 3. Conversation Entry & Response Generation

### Entry Points

1. User clicks any of the 3 right-column prompt cards
2. User types in the home composer and sends
3. User types in the conversation composer (follow-up)

### Response Selection Logic

| Card Type | Detection | Response Function |
|-----------|-----------|-------------------|
| "Set up Slack for..." | Title starts with "Set up Slack for" | `getSetupResponse(useCase, teamSize)` |
| "Popular first moves" | Title === "Popular first moves" | `getFirstMovesResponse(useCase, teamSize)` |
| "How to use Slack" | Title === "How to use Slack" | `getHowToUseResponse(useCase, teamSize)` |

If `isDefaultUseCaseOnly === true`, show a follow-up question asking the user to clarify their use case instead of the full response.

### Response Content Structure

Each response follows this pattern:
1. **Intro line** — 1 sentence contextualizing the advice
2. **Content** — tables, bullet lists, or numbered steps (use-case specific)
3. **Divider** — horizontal rule
4. **Prompt text** — short line like "Want me to help with any of these?"
5. **3 CTA buttons** — actionable next steps with descriptions

### Follow-up Message Detection

When user sends a message in conversation, scan for keywords:
- `project`, `task`, `deadline` → projects
- `customer`, `client`, `crm`, `sales` → customers
- `external`, `partner`, `vendor` → external
- `integrat`, `tools` → integrations
- `ai`, `agent`, `automat` → ai

If a use case is detected, regenerate the full response for that use case + current team size. Otherwise, match topic keywords (channels, notifications, apps, huddles, workflows, search, threads, shortcuts) and return topic-specific responses.

---

## 4. CTA Buttons

### Format

Each response can contain up to 3 CTA markers in the format:
```
{{CTA:Button Label||Supporting description text}}
```

### Rendering Behavior

1. CTA markers are stripped from the typed text body
2. After the typewriter animation completes, buttons render as a group
3. Fade-in animation (0.3s ease)
4. Layout: vertical stack, each row = green button + gray description text beside it

### Visual Spec

- Button: `#007A5A` background, white text, 13px bold, 6px border-radius
- Hover: `#006048` background
- Description: `#616061`, 13px, beside the button
- Group gap: 6px between rows
- Group margin-top: 8px

### Interaction

- Buttons are clickable but in this prototype are non-functional (future: trigger the described action)
- Max 3 buttons per response, always

---

## 5. Typewriter Effect

### Behavior

1. Convert markdown to HTML first
2. Parse HTML into atomic units (full tags treated as single characters)
3. Render characters one at a time at **8ms intervals**
4. Pause longer at line breaks: **24ms** (3x normal)
5. After all text typed, render CTA button group (if present)
6. Auto-scroll to bottom every frame during typing

### Markdown Rendering

| Syntax | Output |
|--------|--------|
| `\|...\|` rows | `<table>` with `<th>` (first row) and `<td>` |
| `---` | `<hr>` divider |
| `• text` | Bullet div with left padding |
| `1. text` | Numbered list div |
| `**text**` | `<strong>` |
| `[text](url)` | `<a>` link (opens in new tab) |
| `` `#channel` `` | Pink channel badge pill |
| `` `code` `` | Gray inline code |

---

## 6. Typing Indicator

### Appearance

- 3 dots, each 6px diameter, gray (`#b0b0b0`)
- Bounce animation: translateY 0 → -4px at 30% of 1.2s cycle
- Staggered delays: 0ms, 150ms, 300ms

### Timing

| Event | Delay from user action |
|-------|----------------------|
| Bot message row appears (with typing) | 800ms |
| Typing indicator hidden, response starts | 2200ms |
| For follow-ups: typing appears | 400ms, response at 2000ms |

---

## 7. Back / Forward Navigation

### History Push Events

| Action | State Pushed |
|--------|-------------|
| Click prompt card | `{ view: 'slackbot-dm', substate: 'conversation' }` |
| Click "Ask Slackbot" (new chat) | `{ view: 'slackbot-dm', substate: 'home' }` |
| Click sidebar item | `{ view: '[item]', substate: 'home' }` |

### Back Button

- Decrements index, restores previous state
- If previous state is `home`: exits conversation, resets bot messages, clears follow-ups
- If previous state is `conversation`: re-enters conversation mode (shows existing messages)
- Updates sidebar selection to match

### Forward Button

- Increments index, restores next state
- Same restoration logic as back

### Button States

- Disabled (grayed out, not clickable) when at boundary
- Back disabled when `index === 0`
- Forward disabled when `index === last`

---

## 8. Escape Hatch (Workspace Name)

### Trigger

Click the workspace icon + name ("Acme Inc") in the sidebar header.

### Behavior — Full Reset

1. Clear navigation history entirely
2. Reset to initial state: `[{ view: 'slackbot-dm', substate: 'home' }]`
3. Back/forward buttons both disabled
4. Slackbot view restored to card grid (no conversation)
5. Home composer hidden
6. Congrats banner reset (can appear again on next 2nd visit)
7. Visit counter reset to 0
8. Prompt title cleared
9. `isDefaultUseCaseOnly` reset to true

---

## 9. Home Composer

### Visibility

- Hidden by default (below viewport, 0 opacity)
- Shown when user clicks "Ask Slackbot" button or close button
- Slide-up animation: 1s cubic-bezier

### Input Behavior

- Contenteditable div, placeholder text: "How should I use Slackbot for my role?"
- Send button activates (green) when text is present
- Enter = send, Shift+Enter = newline
- After send: text cleared, enters conversation mode with typed text as prompt

---

## 10. Congrats Banner

### Trigger

- Appears on 2nd return to home state (`homeVisitCount >= 2`)
- Does not appear if already dismissed in current session

### Visual

- Animated gradient border (cyan → green → gold → red)
- Blur glow effect
- Contains the home composer inside it
- "Try Slackbot Free" heading + dismiss X button

### Dismiss Animation (450ms)

1. Inner content fades out + height collapses (300ms)
2. Background/shadow fades (400ms)
3. Composer moves back to normal position
4. Banner hidden after 450ms

---

## 11. Intro Animation Sequence

### Timing (from sidebar-content-ready signal)

| Phase | Start | Duration | Description |
|-------|-------|----------|-------------|
| Header fade | 270ms | 720ms | Header opacity 0→1 |
| Title typewriter | 270ms | ~500ms | Character-by-character (31-54ms/char) |
| Hero settle | 2700ms | 1400ms | Image shrinks 244px→102px, body shifts up |
| Subheading | 2640ms | 600ms | Subtitle fades in |
| Left cards | +650ms after subhead | 300ms | 2 cards fade in (0, 90ms stagger) |
| Right cards | +450ms after left | 500ms | 3 cards fade in (0, 140ms, 270ms stagger) |

---

## 12. Cross-Component Communication

### Parent → Slackbot View (postMessage)

| Message | Purpose |
|---------|---------|
| `'sidebar-content-ready'` | Trigger intro animation |
| `{ type: 'onboarding-complete', teamSize, useCases }` | Pass personalization data |
| `{ type: 'nav-restore', substate }` | Back/forward state restoration |
| `{ type: 'nav-full-reset' }` | Workspace escape hatch reset |
| `'banner-dismissed'` | AI banner closed, expand content |

### Slackbot View → Parent (postMessage)

| Message | Purpose |
|---------|---------|
| `'slackbot-dm-view-ready'` | Iframe loaded, ready to receive data |
| `{ type: 'nav-state-push', substate }` | Push state for back/forward tracking |

---

## 13. Response Database Summary

| Function | Variants | Content |
|----------|----------|---------|
| `getSetupResponse` | 6 use cases | Channels table + integrations table + 3 CTAs |
| `getFirstMovesResponse` | 4 team sizes | Numbered steps + tables + 3 CTAs |
| `getHowToUseResponse` | 6 use cases | Feature table + tips + shortcuts + 3 CTAs |
| `followUpQuestions` | 3 card types | Clarifying question with bullet options |
| `generateFollowUpResponse` | ~10 topics | Topic-specific help + 3 CTAs |

All responses use consistent structure: content → divider → prompt → CTAs.

---

## 14. Key Design Decisions

1. **Max 3 CTAs** per response — keeps choices manageable
2. **CTA label is short action**, description explains what happens — scannable
3. **Typewriter speed (8ms)** is fast enough to feel responsive but slow enough to read
4. **Back/forward is incremental** — undoes individual card clicks, not just sidebar navigation
5. **Escape hatch is a full reset** — user can always get back to clean state
6. **Follow-up detection is keyword-based** — no ML, just string matching
7. **Responses are dense** — minimal whitespace, tables over verbose bullets
8. **Divider before CTAs** — visually separates informational content from actions
