#!/usr/bin/env bash
# build_icons.sh – create 128 px, 64 px, 32 px and 16 px PNGs from
#                 icon_on.png and icon_off.png
# Default output directory: ./icons (can be overridden with a path argument)

set -euo pipefail

# ---------- Settings ----------
sizes=(128 64 48 32 16)          # target dimensions
src_files=("icon_on.png" "icon_off.png")
default_out_dir="src/icons"
# --------------------------------

# Output directory (argument 1 or default)
out_dir="${1:-$default_out_dir}"
mkdir -p "$out_dir"

# Use ImageMagick's modern entry point
# Prefer "magick" (IM 7+); fall back to "convert" for older installations
if command -v magick >/dev/null 2>&1; then
  IM_CMD="magick"
else
  IM_CMD="convert"
fi

# Verify the chosen command exists
if ! command -v "$IM_CMD" >/dev/null 2>&1; then
  echo "Error: ImageMagick is not installed (neither 'magick' nor 'convert' found)." >&2
  exit 1
fi

# Process each source image
for src in "${src_files[@]}"; do
  if [[ ! -f "$src" ]]; then
    echo "Warning: source file '$src' not found – skipping." >&2
    continue
  fi

  base="$(basename "$src" .png)"   # e.g. icon_on

  for sz in "${sizes[@]}"; do
    out_file="${out_dir}/${base}_${sz}.png"
    "$IM_CMD" "$src" -resize "${sz}x${sz}" "$out_file"
    echo "Created $out_file"
  done
done
