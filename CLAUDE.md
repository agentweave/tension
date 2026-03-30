## Project

Tension is a Claude Code plugin for configurable agent autonomy. It's pure markdown — no code to build, no tests to run.

## Structure

- `profiles/` — behavioral templates (tight, default, loose, free). These are the product.
- `skills/set/` — the `/tension:set` skill that writes profiles to `.tension.md`
- `skills/status/` — the `/tension:status` skill that shows the active profile
- `.claude-plugin/plugin.json` — plugin manifest

## Working on profiles

Profile templates are prompt engineering. When editing:
- Tight and loose share four sections: Working, Communication, Errors, Commits.
- Free has five sections: Working, Communication, Errors, Commits, Scope.
- Each non-default profile has a permission mode awareness preamble. Keep these consistent in intent but tailored per profile.
- Test changes by running `/tension:set <profile>` and observing Claude's behavior.
