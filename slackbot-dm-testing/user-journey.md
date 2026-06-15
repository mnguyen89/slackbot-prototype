# Activate Vision — User Journey

## Persona

**Alex Johnson**
- Role: Marketing Manager at Acme Inc
- Team size: 8 people (designers, copywriters, social media, analytics)
- Current tools: Gmail, Google Drive, Google Calendar, Asana, Zoom
- Pain point: Too many tools, fragmented communication, context-switching kills productivity
- Goal: Consolidate her team's work into one place so nothing falls through the cracks
- Tech comfort: Moderate — comfortable with SaaS tools but doesn't want complex setup

---

## Journey 1: Desktop

### Phase 1 — Signup & Onboarding

**Screen 1: Segmented Signup**

Carmen visits slack.com and clicks "Get Started Free." She enters her work email and creates a password. Instead of dropping her into a blank workspace, Slack presents 2–3 quick questions:

- "What's your role?" → She selects **Marketing Manager**
- "What kind of team are you setting up?" → She selects **Marketing team**
- "How many people on your team?" → She selects **6–10**

These answers are captured immediately and fed into Slack's AI Onboarding Assistant to personalize her experience.

> **What Carmen sees:** A clean, minimal signup flow with large selectable cards for each question. No friction — feels like 30 seconds, not a form.

---

**Screen 2: Intelligent Scaffolding (AI Onboarding Assistant)**

Based on her "Marketing team" selection, Slack's AI automatically generates a suggested workspace structure:

- Proposed channels: `#campaigns`, `#content-planning`, `#general`
- A pre-filled Canvas titled "Marketing Team — Getting Started" with sections for team goals, weekly standup notes, and campaign tracking

Carmen can accept the suggestions as-is, rename channels, add more, or dismiss any she doesn't need. She keeps all three and renames `#content-planning` to `#content-calendar`.

> **What Carmen sees:** A workspace blueprint screen showing channel cards with descriptions and a Canvas preview. An "Accept & Continue" button at the bottom. Feels like Slack already understands her team.

---

**Screen 3: Today Page (Launchpad)**

Carmen enters her new workspace and lands on the **Today page** — a central hub that replaces the usual "cold start" emptiness. Instead of staring at an empty channel, she sees a clear, actionable checklist:

- [ ] Connect your tools (Google Drive, Calendar, Asana)
- [ ] Invite your team members
- [ ] Bring your existing work into Slack
- [ ] Send your first message

A progress bar at the top reads **"20% set up"** — completing the signup and scaffolding already gave her credit. The page feels alive, not empty.

> **What Carmen sees:** A dashboard-style page with a progress ring, checklist cards, and a welcoming header: "Welcome to Acme Inc, Carmen. Let's get your team set up."

---

### Phase 2 — Activation

**Screen 4: Bring Work into Slack**

Carmen clicks "Bring your existing work into Slack" from the Today checklist. A guided Canvas-based experience walks her through importing content:

- She selects Google Drive as a source
- Slack surfaces her recent marketing documents — campaign briefs, brand guidelines, content calendars
- She selects key files to pin in relevant channels
- A Canvas is auto-generated summarizing imported resources per channel

> **What Carmen sees:** A step-by-step import wizard inside a Canvas. File thumbnails from Google Drive with checkboxes. A preview of where each file will land in Slack.

---

**Screen 5: One-Click Authorization (Tool Integration)**

Carmen clicks "Connect your tools" from the Today checklist. Instead of being redirected to the Slack App Marketplace, an **embedded webview** appears right inside the Launchpad. It shows recommended apps based on her team type:

- Google Calendar
- Google Drive
- Outlook Calendar
- Microsoft OneDrive

Carmen clicks **Google Drive** — a single OAuth consent screen pops up. One click, and it's connected. She does the same for **Google Calendar** and **Asana** in quick succession. Three tools connected in under a minute.

> **What Carmen sees:** A grid of app icons with "Connect" buttons, all within the Today page. No page navigation, no marketplace browsing. OAuth popups are the only interruption.

---

**Screen 6: Email Integration & Search**

After connecting GSuite, Slack offers Carmen the **email connector**. She enables it with one toggle. Now:

- She can search her email directly from Slack's search bar
- AI-generated answers combine results from Slack messages AND her email
- Email previews render inline — she can read full emails and view attachments without leaving Slack

Carmen searches "Q2 campaign brief" and gets a Slack message from herself in `#campaigns` alongside an email thread with her agency. Both results appear in one unified view.

> **What Carmen sees:** The familiar Slack search bar, but results now include an "Email" tab. AI answer cards summarize key points across both sources. Email previews expand inline with attachment thumbnails.

---

### Phase 3 — Scaling the Team

**Screen 7: Simplified Invite Experience**

Carmen clicks "Invite your team" from the Today checklist. A streamlined invite modal appears:

- She pastes 4 email addresses (Alex, Sarah, Jordan, Priya)
- Alternatively, she can copy a shareable invite link
- She adds a personal note: "Hey team! We're moving to Slack. Check it out."

After sending, the Today page transforms into a **"Shared Team Section"** — a dynamic avatar grid showing Carmen (joined) alongside 4 placeholder avatars with pending status.

> **What Carmen sees:** A simple email input field with a "Send Invites" button. After sending, the Today page updates live with a team avatar grid and status indicators.

---

**Screen 8: Dynamic Progress Visualization**

Over the next hour, team members start joining. The Today page updates in real time:

- Alex joins → his avatar fills in, the feed shows "Alex joined the team"
- Sarah joins → "Sarah created #project-alpha" appears in the activity feed
- Only 2 of 5 core members have joined

A nudge card appears: **"Your team could use a designer — invite one now."** The workspace feels active and alive, even with just a few people.

> **What Carmen sees:** An animated avatar grid filling in as members join. A live activity feed below the grid. Contextual nudge cards suggesting next actions based on who's missing.

---

**Screen 9: Feature Penetration & Premium Value**

As the team starts collaborating — sharing files, messaging in channels — Slackbot surfaces premium features at the right moments:

- When Carmen posts a question in `#campaigns`, Slackbot suggests: "Start a huddle to discuss this live with your team"
- When multiple people edit a shared doc, Slackbot recommends: "Create a Canvas in #campaigns to keep everyone aligned"

These contextual recommendations position the team as ideal candidates for Pro plan conversion.

> **What Carmen sees:** Slackbot messages that feel helpful, not pushy. Feature suggestions appear as inline cards within the conversation flow, with "Try it" buttons.

---

**Screen 10: Milestone Celebrations**

The team hits key milestones:

- All 5 invited members have joined
- First tool (Google Drive) is connected and actively used
- 3 channels are active with daily messages

The Launchpad celebrates: **"Your team is 80% set up!"** A visual progress animation plays. The remaining checklist items guide Carmen toward full-scale collaboration — setting up workflows, connecting more tools, and exploring premium features.

> **What Carmen sees:** A confetti-style animation on the Today page. The progress ring jumps to 80%. A celebratory banner: "Acme Inc Marketing is almost fully set up!"

---

**Screen 11: Smart Invites v2 (Contextual Recommendations)**

Carmen shares a Google Doc link in `#campaigns`. Slackbot recognizes the document through the connected Google Drive integration and surfaces a suggestion:

**"Jordan Lee and Priya Patel also have access to this document. Want to invite them to #campaigns?"**

Carmen taps "Invite" — a pre-filled invitation is sent with context: "Carmen invited you to #campaigns to collaborate on Q2 Campaign Brief."

> **What Carmen sees:** A Slackbot card below her Google Doc link showing profile pictures of suggested invitees, pulled from the integrated app's collaborator data. One-tap invite buttons.

---

### Phase 4 — Viral Loops

**Screen 12: Instant Huddle with External Guest**

Carmen is in a huddle with her team in `#proj-external-guests-huddles-canvas` discussing an upcoming campaign. She realizes they need input from Dana, an external freelance designer. Carmen clicks "Add people" and enters Dana's email.

Dana receives an instant link and joins the huddle directly — no Slack account required. She hears the conversation, shares her screen, and contributes in real time. This is Dana's first exposure to Slack.

> **What Carmen sees:** A standard huddle interface with an "Invite external" option. Dana appears as a guest participant with a "Guest" badge.

> **What Dana sees:** A browser-based huddle window with audio, video, and screen sharing. A subtle banner: "You're in a Slack huddle. Want to create your own workspace?"

---

**Screen 13: External User Nudge**

After the huddle ends, Dana receives a follow-up email:

**"Great conversation with the Acme team! Continue collaborating on Slack."**

The email includes a CTA to create her own Slack workspace. Dana clicks through, enters her info, and starts a new workspace for her freelance business — carrying the experience forward. The viral loop is complete.

> **What Dana sees:** A well-designed email with a recap of the huddle. A prominent "Create Your Workspace" button. Clicking it leads to a streamlined signup optimized for her context.

---
---

## Journey 2: Mobile

### Phase 1 — Signup & Onboarding

**Screen 1: Mobile Signup**

Carmen downloads the Slack app on her phone and taps "Create a New Workspace." She enters her work email and creates a password. The same segmented questions appear, optimized for mobile:

- "What's your role?" → Large, tappable cards. She selects **Marketing Manager**
- "What kind of team?" → She selects **Marketing team**
- "Team size?" → She selects **6–10**

The form is vertically stacked with generous touch targets. Each question is a single screen with a "Next" button — it feels fast and native.

> **What Carmen sees:** Full-screen cards, one question at a time, with smooth transitions. Feels like a modern app onboarding flow, not a web form.

---

**Screen 2: Intelligent Scaffolding (AI Onboarding Assistant)**

The AI Onboarding Assistant suggests the same workspace structure as desktop, but presented as swipeable cards:

- Channel card: `#campaigns` — "For managing marketing campaigns"
- Channel card: `#content-planning` — "For editorial and content calendar"
- Channel card: `#general` — "For team-wide updates"
- Canvas card: "Marketing Team — Getting Started"

Carmen swipes through, renames `#content-planning` to `#content-calendar`, and taps "Create Workspace."

> **What Carmen sees:** A card carousel of suggested channels, each with a description and edit icon. A "Create Workspace" button at the bottom. Compact and swipeable.

---

### Phase 2 — Activation

**Screen 3: Bring Work into Slack**

Carmen taps "Bring your work in" from a setup prompt. The mobile import flow opens:

- She selects Google Drive from a list of cloud sources
- Her recent files appear in a scrollable list with thumbnails
- She taps to select key documents and assigns them to channels
- A confirmation screen shows what will be imported and where

> **What Carmen sees:** A native-feeling file picker showing Google Drive contents. Checkbox selection, channel assignment dropdowns, and a summary before confirming.

---

**Screen 4: One-Click Authorization (Tool Integration)**

Carmen taps "Connect your tools" from a setup prompt. A bottom sheet slides up showing recommended apps:

- Google Calendar
- Google Drive
- Outlook Calendar
- Microsoft OneDrive

She taps **Google Drive** — the native iOS/Android OAuth sheet appears. One tap to authorize. She repeats for Google Calendar and Asana. Three connections in under 30 seconds.

> **What Carmen sees:** A bottom sheet with app icons and "Connect" buttons. Native OS OAuth prompts — familiar and trustworthy. Connected apps show a green checkmark.

---

**Screen 5: Email Integration & Search**

After connecting GSuite, Carmen enables the email connector via a toggle in settings. Now from mobile:

- She taps the search bar and types "Q2 campaign brief"
- Results show Slack messages and email threads in unified cards
- AI-generated answer cards summarize key findings
- She can tap to expand full email previews with attachments

> **What Carmen sees:** The Slack search bar with tabbed results (All, Messages, Email). AI summary cards at the top. Expandable email cards with attachment previews optimized for mobile viewing.

---

### Phase 3 — Scaling the Team

**Screen 6: Simplified Invite Experience**

Carmen taps "Invite your team" from a setup prompt. The mobile invite flow offers multiple paths:

- Enter email addresses manually
- Tap "Share Link" to open the native share sheet — she sends the link via iMessage to her team
- Import contacts from her phone's address book

She shares the invite link via group text. A dynamic avatar grid appears showing her team's join status.

> **What Carmen sees:** An invite screen with email input, a large "Share Link" button, and a contacts import option. After inviting, an avatar grid with real-time join status.

---

**Screen 7: Dynamic Progress Visualization**

Push notifications keep Carmen informed as her team joins:

- **Push notification:** "Alex just joined Acme Inc on Slack"
- **Push notification:** "Sarah created #project-alpha"

Inside the app, an activity feed shows join events and channel creation. A nudge card appears: "Your team could use a designer — invite one now." Carmen taps "Invite" directly from the card.

> **What Carmen sees:** Rich push notifications with team activity. An in-app feed with avatar animations as members join. Contextual nudge cards with one-tap actions.

---

**Screen 8: Feature Penetration & Premium Value**

As mobile collaboration picks up, Slackbot surfaces feature suggestions through contextual prompts:

- In a busy `#campaigns` thread, a suggestion appears: "This is getting long — start a huddle to talk it out"
- After Carmen shares multiple files: "Try Canvas to organize these docs for your team"

Notifications also nudge premium features: "Your team had 12 conversations today. Unlock advanced analytics with Pro."

> **What Carmen sees:** Inline Slackbot suggestion cards in channels. Occasional smart notifications that feel timely, not spammy. "Try it" buttons lead directly to the feature.

---

**Screen 9: Milestone Celebrations**

The team hits milestones and Carmen sees a celebration card in the app:

**"Your team is 80% set up!"**

A progress animation plays. The remaining steps are shown as a compact checklist. Carmen can tap into each one to complete the final setup actions.

> **What Carmen sees:** A full-width celebration card with animated progress ring. Confetti animation. A "Finish Setup" checklist below.

---

**Screen 10: Smart Invites v2 (Contextual Recommendations)**

Carmen shares a Google Doc link in `#campaigns` from her phone. Slackbot detects collaborators:

**"Jordan Lee and Priya Patel also have access to this doc. Invite them to #campaigns?"**

Carmen taps "Invite Both" — done in one tap. Pre-filled invitations are sent with context about the shared document.

> **What Carmen sees:** A Slackbot card below her message with suggested invitee avatars and a single "Invite" button. Minimal effort, maximum context.

---

### Phase 4 — Viral Loops

**Screen 11: Instant Huddle with External Guest**

Carmen is in a mobile huddle with her team. She taps "Add people" and enters Dana's email. Dana receives a link via email/SMS and joins the huddle instantly from her own phone — no Slack account needed.

Dana participates in the conversation with full audio. She sees a subtle prompt: "Enjoying Slack? Create your own workspace."

> **What Carmen sees:** The standard mobile huddle interface with an "Invite External" option. Dana appears as a guest with a badge.

> **What Dana sees:** A mobile web-based huddle with audio controls. A non-intrusive banner inviting her to create a workspace.

---

**Screen 12: External User Nudge**

After the huddle, Dana receives an email and/or SMS:

**"Great conversation with the Acme team! Continue collaborating on Slack."**

Dana taps the link on her phone, which opens a mobile-optimized signup. She creates her own workspace for her freelance design business in under 2 minutes. The viral loop continues — Dana will eventually invite her own clients and collaborators.

> **What Dana sees:** A mobile-optimized email with huddle recap. Tapping the CTA opens the Slack app (or app store). Streamlined mobile signup with minimal fields. Her own workspace, ready to go.
