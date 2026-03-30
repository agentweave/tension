# Tension

A dial for agent autonomy.

Four profiles — **tight**, **default**, **loose**, **free** — control how Claude behaves. Switch anytime with `/tension:set`.

Part of the [agentweave](https://github.com/agentweave) suite.

## Install

```bash
claude plugin install agentweave/tension
```

## Usage

```bash
/tension:set tight      # You drive, Claude assists
/tension:set default    # Standard Claude Code behavior
/tension:set loose      # Claude drives, you review
/tension:set free       # Full ownership, Claude self-directs

/tension:status         # Show active profile
```

The active profile is stored in `.tension.md` in your project root.

## Profiles

| Profile | Tension | You are... | Claude... |
|---------|---------|------------|-----------|
| tight | High | Driving | Asks before acting, explains steps |
| default | Normal | Co-piloting | Standard behavior, no overrides |
| loose | Low | Reviewing | Acts freely, summarizes at end |
| free | None | Away | Self-directs, iterates, improves until done |

## How It Works

1. `/tension:set <profile>` writes behavioral instructions to `.tension.md`
2. Claude picks them up automatically
3. Behavior changes — communication, error handling, commits, scope

Pure markdown. Edit `.tension.md` by hand if you want — no plugin required.

The **free** profile also creates `.tension-goals.md` — a goals checklist that Claude works through autonomously and you can review or edit while it runs.

## Should I commit `.tension.md`?

**Shared team preference:** Commit it so everyone uses the same profile.

**Personal preference:** Add `.tension.md` and `.tension-goals.md` to `.gitignore`.

## License

MIT
