#!/bin/bash
set -euo pipefail

GODOT_VERSION="4.6.2-stable"

INSTALL_DIR="/opt/godot/${GODOT_VERSION}"

mkdir -p "$INSTALL_DIR"

curl -L -o /tmp/godot.zip \
  "https://github.com/godotengine/godot/releases/download/${GODOT_VERSION}/Godot_v${GODOT_VERSION}_mono_linux_x86_64.zip"

unzip /tmp/godot.zip -d "$INSTALL_DIR"

# Find the actual binary safely
GODOT_BIN=$(find "$INSTALL_DIR" -type f -name "Godot_v*_mono_linux_x86_64")

mv "$GODOT_BIN" "$INSTALL_DIR/godot"

chmod +x "$INSTALL_DIR/godot"

ln -sf "$INSTALL_DIR/godot" /usr/bin/godot

rm -f /tmp/godot.zip
