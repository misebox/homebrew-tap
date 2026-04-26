#!/usr/bin/env bash
# Update an existing Formula/<tool>.rb in place: version + sha256 lines.
# The two sha256 lines are expected in file order:
#   1st = macOS arm64, 2nd = Linux x86_64.
# Usage: scripts/update-formula.sh <tool> <version>
set -euo pipefail

cd "$(dirname "$0")/.."

if [ $# -ne 2 ]; then
  echo "usage: scripts/update-formula.sh <tool> <version>" >&2
  exit 2
fi

tool="$1"
version="$2"
formula="Formula/${tool}.rb"

[ -f "$formula" ] || { echo "not found: $formula" >&2; exit 1; }

output=$(scripts/sha256.sh "$tool" "$version")
macos_arm=$(awk '/aarch64-apple-darwin/     {print $2}' <<<"$output")
linux_x86=$(awk '/x86_64-unknown-linux-gnu/ {print $2}' <<<"$output")
[ -n "$macos_arm" ] && [ "$macos_arm" != "-" ] || { echo "error: macOS arm64 SHA not found (asset missing on release)" >&2; exit 1; }
[ -n "$linux_x86" ] && [ "$linux_x86" != "-" ] || { echo "error: Linux x86_64 SHA not found (asset missing on release)" >&2; exit 1; }

tmp=$(mktemp)
awk -v v="$version" -v m="$macos_arm" -v l="$linux_x86" '
  /^[[:space:]]*version[[:space:]]+"[^"]*"/ {
    sub(/"[^"]*"/, "\"" v "\"")
  }
  /^[[:space:]]*sha256[[:space:]]+"[^"]*"/ {
    sha++
    if      (sha == 1) sub(/"[^"]*"/, "\"" m "\"")
    else if (sha == 2) sub(/"[^"]*"/, "\"" l "\"")
  }
  { print }
' "$formula" > "$tmp"
mv "$tmp" "$formula"

echo "updated $formula to version $version"
