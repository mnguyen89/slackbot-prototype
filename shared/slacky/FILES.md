# What's in this folder — a plain-English guide

This is the Slacky component library. It has a few HTML pages that can look
similar at a glance, so here's what each one is and when you'd use it. None of
them are duplicates — they each do a different job.

---

## The reference site (3 browsable pages)

These three are the tabs of the Slacky reference site. Open any of them in a
browser and you'll see the same "Slacky" header with tabs across the top that
link to the other two.

| Page | What it is | When you use it |
|------|-----------|-----------------|
| **showcase.html** | The **component gallery** — every Slacky component (buttons, inputs, menus, cards, etc.) shown live with examples. | When you want to see what components exist and how they look, or grab one to use. |
| **messagekit.html** | The **message reference** — message anatomy, reactions, reply bars, and the actions toolbar. | When you're building anything message-related and want the exact structure. |
| **shells.html** | The **shells gallery** — shows the full-page Slack layouts inside a framed preview. | When you want to browse the available full-client layouts. It currently lists one shell (Channel Message) and is where new shells would be added later. |

---

## The building blocks (2 templates you copy)

These two aren't meant to be opened directly — they're **templates**. Opening
them where they live will look broken, because their paths only work once
they've been copied into a prototype folder.

| Page | What it is | When you use it |
|------|-----------|-----------------|
| **shell-channel.html** | The **full Slack channel layout** — top nav, tab rail, sidebar, channel header, message pane, thread panel, and composer. Aubergine-themed. This is the real, reusable shell that `shells.html` previews in its frame. | When you want your prototype to sit inside a complete Slack UI instead of a blank page. |
| **starter.html** | A **blank starting template** — a nearly-empty page wired up to load Slacky. | When starting a brand-new prototype. Don't open it directly — run `../new-prototype.sh` from the kit root, which copies it into a new folder as `index.html` with all the paths in the right place. |

---

## Good to know

- **Why templates look "broken" when opened directly:** pages here load their
  styling with short paths like `reset.css` and `slacky.js`, which only work
  when the file sits right next to those files. `starter.html` uses
  `shared/slacky/...` paths that only resolve after it's copied out into a
  prototype folder (one level above `shared/slacky/`). That's expected — it's a
  template, not a finished page.

- **The fonts load locally.** The reference pages use the font files in
  `fonts/circular/`, so they work offline and don't depend on any published
  website staying up.

- **To preview any page properly:** run a local server from this folder
  (`python3 -m http.server 8007`) and open e.g.
  `http://localhost:8007/showcase.html`. Previewing with Finder's spacebar
  (Quick Look) won't work — it doesn't run JavaScript, so icons and components
  won't appear even though the page is fine.
