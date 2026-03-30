---
name: set
description: Set the active Tension profile — tight, default, loose, or free
arguments: "<profile> — one of: tight, default, loose, free"
---

# /tension:set

Set the active Tension profile for this project.

## Arguments

`<profile>` — one of: `tight`, `default`, `loose`, `free`

If no argument is provided, show the available profiles and ask which one to use.

If an invalid profile name is provided, list the valid options.

## Steps

### 1. Validate the profile name

Valid profiles: `tight`, `default`, `loose`, `free`.

If no argument provided, respond with:

> **Available profiles:**
> - `tight` — you drive, Claude assists. Asks before every action.
> - `default` — standard Claude Code behavior. No overrides.
> - `loose` — Claude drives your task. Acts freely, summarizes at end.
> - `free` — full ownership. Claude self-directs, iterates, and improves until done.
>
> Run `/tension:set <profile>` to switch.

Then stop.

If an invalid name is provided, respond with:

> Unknown profile "`<name>`". Valid profiles: `tight`, `default`, `loose`, `free`.

Then stop.

### 2. Read the profile template

Read the file at `${CLAUDE_PLUGIN_ROOT}/profiles/<profile>.md`.

### 3. Write `.tension.md`

Write the profile template content to `.tension.md` in the current working directory (project root). This overwrites any existing content, including hand-edits.

### 4. Ensure CLAUDE.local.md references `.tension.md`

The Tension reference goes in `CLAUDE.local.md` (personal, not committed) rather than `CLAUDE.md` (shared project instructions), because the active profile is a personal preference.

Read `CLAUDE.local.md` in the current working directory.

- If `CLAUDE.local.md` exists and already contains the text `.tension.md` — do nothing.
- If `CLAUDE.local.md` exists but does not contain `.tension.md` — append this section at the end:

```
## Tension
Follow the behavioral guidelines in .tension.md.
```

- If `CLAUDE.local.md` does not exist — create it with just that content.

Also check `CLAUDE.md` — if it contains a `## Tension` section referencing `.tension.md` (from an older version of the plugin), remove that section so the reference isn't duplicated.

### 5. Confirm and apply

Output the following:

> **Tension set to `<profile>`.**

Then output the full content of the profile template. This ensures the behavioral instructions take effect immediately in the current session.
