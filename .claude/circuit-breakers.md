# Circuit Breakers

These rules fire at the moment of editing. They are not reference material — they are hard stops.

## Before every edit

1. **What value am I writing?** If it's a color, spacing, radius, font size, shadow, or weight — where did I look it up? If the answer is "I know this" or "it's probably" — STOP. Look it up from Slacky tokens.css, Design Tokens MCP, or the webapp source. Then write it. If I found the value in the webapp and multiple files returned different values for the same property — STOP. Do not pick one. List every conflicting value with its file path. Flag any path containing `WIP/`, `experimental/`, `deprecated/`, or `legacy/` as potentially non-production. Ask the user which matches the live product before writing anything.

2. **Does this value match my value table?** If I printed a value table earlier in this conversation, the value I'm about to write must match a row in that table exactly. If I'm writing a different token or a different resolved value than what the table says — I'm deviating from my own research. Use the table value, not what I think it should be. If the table is wrong, correct the table first and print the correction, then edit the code.

3. **What am I fixing?** If this edit is a fix, state the root cause in one sentence before editing. "The background looks wrong" is not a root cause. "The background uses `--dt_color-surf-pry` which resolves to `#1d1c1d0f` (semi-transparent), but it needs a solid fill" is a root cause. If you can't state the root cause, you don't understand the bug — read the file first.

4. **Is this my third attempt at the same fix?** If yes — STOP EDITING. Re-read the full file. Write out what you think is happening and where the conflict is. Propose a plan to the user. Do not make another edit until they confirm.

5. **Did the user suggest an approach?** If the user told you how to fix something and you haven't tried their way yet — try their way first. Do not propose alternatives until you've tried what they asked for.

6. **Is this approach feasible?** Before writing code for a new approach, verify the key assumption. Can CSS style cross-origin iframe content? (No.) Does this API require auth from a browser? (Check first.) Does this file/function/endpoint exist? If you can't confirm feasibility, say so before writing code.

## After every edit

7. **Re-read the section you just changed.** Did it land correctly? Did it break anything adjacent? If you're not sure, read wider.

8. **Are there siblings?** If you fixed one instance (one message background, one icon, one spacing value), grep the file for every identical pattern. Fix all of them or none of them.

9. **Did something that was working break?** If a feature that previously worked now doesn't (hover card disappeared, layout collapsed, server stopped), that's a regression you introduced. Revert your change immediately and understand why it broke before trying again.

## Always

10. **No speculative CSS.** Every property must solve a specific identified problem. If you're adding a property "just in case" or "to be safe" — remove it.

11. **Don't override — replace.** If a CSS rule is wrong, fix the rule. Don't add a second rule to override it. Remove the broken code and write the correct code.

12. **Say "I don't know."** If you're unsure what's causing a visual bug, say so. That's better than a guess that creates a new bug. Never say "looks correct" or "should work" — say "I believe this is correct because [specific evidence]" or "I'm not sure this is right."

13. **Plain language.** The user is a designer. No jargon. No "submodules," "DOM ancestry," "column-count clipping." Say what happened in plain English.
