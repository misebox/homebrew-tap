#!/usr/bin/env bash
# Print SHA256 hashes of the GitHub Release assets for a formula update.
# Usage: scripts/sha256.sh <tool> <version>
#   e.g. scripts/sha256.sh oadig 0.2.0
set -euo pipefail

if [ $# -ne 2 ]; then
  echo "usage: scripts/sha256.sh <tool> <version>" >&2
  exit 2
fi

tool="$1"
version="$2"
base="https://github.com/misebox/${tool}/releases/download/v${version}"

targets=(
  "aarch64-apple-darwin       tar.gz"
  "x86_64-unknown-linux-gnu   tar.gz"
  "x86_64-pc-windows-msvc     zip"
)

for row in "${targets[@]}"; do
  target=$(echo "$row" | awk '{print $1}')
  ext=$(echo "$row"    | awk '{print $2}')
  url="${base}/${tool}-${target}.${ext}"
  printf "%-30s " "$target"
  if hash=$(curl -fsSL "$url" 2>/dev/null | shasum -a 256 | awk '{print $1}') \
     && [ -n "$hash" ] && [ "$hash" != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" ]; then
    echo "$hash"
  else
    echo "-"
  fi
done
