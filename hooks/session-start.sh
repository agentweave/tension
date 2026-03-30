#!/usr/bin/env bash
# Tension SessionStart hook
# Injects the active Tension profile into context at session start, clear, and compact.

TENSION_FILE=".tension.md"

# If no .tension.md in the working directory, exit silently
if [ ! -f "$TENSION_FILE" ]; then
  exit 0
fi

# Read the first line to identify the profile
first_line=$(head -n 1 "$TENSION_FILE")

# Extract the profile name (e.g. "# Tension: Tight" -> "tight")
profile=$(echo "$first_line" | sed 's/^#[[:space:]]*Tension:[[:space:]]*//' | tr '[:upper:]' '[:lower:]' | tr -d '[:space:]')

# If default profile or unrecognized, exit silently
if [ -z "$profile" ] || [ "$profile" = "default" ]; then
  exit 0
fi

# Read the full file content
content=$(cat "$TENSION_FILE")

# Escape content for JSON:
#   1. backslashes -> \\
#   2. double quotes -> \"
#   3. newlines -> \n
#   4. carriage returns -> \r
#   5. tabs -> \t
escaped=$(printf '%s' "$content" \
  | sed 's/\\/\\\\/g' \
  | sed 's/"/\\"/g' \
  | awk '{printf "%s\\n", $0}' \
  | sed 's/	/\\t/g')

# Wrap in EXTREMELY_IMPORTANT tags and output as additionalContext
printf '{"hookSpecificOutput":{"additionalContext":"<EXTREMELY_IMPORTANT>\\n%s\\n</EXTREMELY_IMPORTANT>"}}\n' "$escaped"
