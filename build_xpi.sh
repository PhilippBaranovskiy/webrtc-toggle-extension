#!/usr/bin/env bash
# pack_extension.sh – create the XPI for the WebRTC‑toggle extension
# Usage: ./pack_extension.sh [output_dir]
#   output_dir defaults to the parent directory of the current folder (..)

set -euo pipefail

# ---------- Configuration ----------
output_name="webrtc_toggle_on_and_off.xpi"
files_to_zip=("icons" "js" "LICENSE" "manifest.json")
# -----------------------------------

# Determine where the XPI should be placed
# If an argument is supplied, use it; otherwise use the current directory (.)
out_dir="${1:-.}"
mkdir -p "$out_dir"

# Build the full path for the archive
out_path="${out_dir}/${output_name}"

# Run the zip command (recursive, preserving paths)
zip -r "$out_path" "${files_to_zip[@]}"

echo "Created XPI: $out_path"
