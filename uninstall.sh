#!/usr/bin/env bash

echo "Starting PathSim Uninstallation..."

# Define the exact paths used during installation
INSTALL_DIR="$HOME/.local/share/PathSim"
DESKTOP_ENTRY="$HOME/.local/share/applications/pathsim.desktop"

# 1. Remove the application directory and all its contents
if [ -d "$INSTALL_DIR" ]; then
    echo "🗑️  Removing application files from $INSTALL_DIR..."
    rm -rf "$INSTALL_DIR"
else
    echo "⚠️  Application directory not found. It may have already been removed."
fi

# 2. Remove the desktop shortcut from the launcher
if [ -f "$DESKTOP_ENTRY" ]; then
    echo "🗑️  Removing desktop shortcut..."
    rm -f "$DESKTOP_ENTRY"
else
    echo "⚠️  Desktop shortcut not found."
fi

echo ""
echo "✅ Uninstallation Complete! PathSim has been removed from your system."