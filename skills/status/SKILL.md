---
name: status
description: Show the currently active Tension profile
---

# /tension:status

Show the currently active Tension profile for this project.

## Steps

### 1. Check for `.tension.md`

Read `.tension.md` in the current working directory.

If the file does not exist, respond with:

> **No Tension profile active.** Run `/tension:set <profile>` to set one.

Then stop.

### 2. Identify the profile

Read the first line of `.tension.md`. Match the heading to determine the profile:

- `# Tension: Tight` → tight
- `# Tension: Default` → default
- `# Tension: Loose` → loose
- `# Tension: Free` → free

If the heading doesn't match any known profile, respond with:

> **Custom Tension profile active.** `.tension.md` has been hand-edited and doesn't match a standard profile.

Then stop.

### 3. Show status

Respond with:

> **Tension: `<profile>`**

Then show a one-line description:

- tight: "You drive, Claude assists. Asks before every action."
- default: "Standard Claude Code behavior. No overrides."
- loose: "Claude drives your task. Acts freely, summarizes at end."
- free: "Full ownership. Claude self-directs, iterates, and improves until done."

### 4. If free, show goals status

If the profile is `free`, check for `.tension-goals.md`.

If it exists, count the total goals and completed goals (lines matching `- [x]` vs `- [ ]`), and show:

> **Goals:** X/Y completed

If `.tension-goals.md` does not exist, show:

> **Goals:** No goals checklist yet.
