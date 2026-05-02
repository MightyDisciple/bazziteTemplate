#!/bin/bash
set -euo pipefail

GODOT_VERSION="4.6.2-stable"

BASE="/opt/godot/${GODOT_VERSION}"
ARCHIVE_DIR="${BASE}/Godot_v${GODOT_VERSION}_mono_linux_x86_64"

mkdir -p "$BASE"

curl -L -o /tmp/godot.zip \
  "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_mono_linux_x86_64.zip"

unzip /tmp/godot.zip -d "$BASE"

mv "${ARCHIVE_DIR}/Godot_v${GODOT_VERSION}_mono_linux.x86_64" \
   "${ARCHIVE_DIR}/godot"

chmod +x "${ARCHIVE_DIR}/godot"

ln -sf "${ARCHIVE_DIR}/godot" /usr/bin/godot

rm -f /tmp/godot.zip
