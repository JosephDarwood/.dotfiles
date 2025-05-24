#!/usr/bin/env bash

# Usage:
#   ./check-and-run.sh <process-name> <script-to-run>
#
# Example:
#   ./check-and-run.sh abcd "$HOME/Scripts/MyBash.sh"

aString="hyprpaper"
myScript="$HOME/Scripts/jHyprPaperRandomize"

# total timeout (seconds) and interval between checks
timeout=3
interval=0.2

# calculate number of loops (timeout / interval)
loops=15  # 3 / 0.2

for ((i=0; i<loops; i++)); do
  if hyprctl hyprpaper listloaded &> /dev/null; then
    echo "Success: process '$aString' found."
    bash "$myScript"
    exit 0
  fi
  sleep "$interval"
done

echo "Fail: process '$aString' not found after ${timeout}s."
exit 1

