#!/usr/bin/env bash

echo "Starting PathSim Installation..."

# --- NEW: Java Dependency Check ---
if ! command -v java &> /dev/null; then
    echo ""
    echo "❌ Error: Java is not installed or not found in your system PATH."
    echo "PathSim requires Java to run."
    echo ""
    echo "Please install Java using your distribution's package manager:"
    echo "  Ubuntu/Mint: sudo apt install default-jre"
    echo "  Fedora:      sudo dnf install java-latest-openjdk"
    echo "  Arch Linux:  sudo pacman -S jre-openjdk"
    echo ""
    echo "Installation aborted."
    exit 1
fi
echo "✅ Java detected. Proceeding..."
# ----------------------------------

# 1. Define universal, user-specific installation paths
INSTALL_DIR="$HOME/.local/share/PathSim"
DESKTOP_DIR="$HOME/.local/share/applications"

# 2. Create the installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"
mkdir -p "$DESKTOP_DIR"

# 3. Copy the JAR file to the new installation folder
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
if [ ! -f "$SCRIPT_DIR/PathSim.jar" ]; then
    echo "❌ Error: PathSim.jar not found in the installer directory!"
    exit 1
fi
cp "$SCRIPT_DIR/PathSim.jar" "$INSTALL_DIR/PathSim.jar"

# 4. Generate a universal Bash wrapper script
cat << 'EOF' > "$INSTALL_DIR/run-pathsim"
#!/usr/bin/env bash

# Hunt for JavaFX modules globally
JFX_PATH=$(dirname $(find /usr/lib/jvm -name "javafx.controls.jar" 2>/dev/null | head -n 1))

# If JavaFX is found, append the module flags. If not (like in Java 8), run normally.
if [ -n "$JFX_PATH" ]; then
    java --module-path "$JFX_PATH" --add-modules javafx.controls,javafx.fxml -jar "$HOME/.local/share/PathSim/PathSim.jar"
else
    java -jar "$HOME/.local/share/PathSim/PathSim.jar"
fi
EOF

# Make the wrapper executable
chmod +x "$INSTALL_DIR/run-pathsim"

# 5. Generate the universal .desktop file
cat << EOF > "$DESKTOP_DIR/pathsim.desktop"
[Desktop Entry]
Type=Application
Name=PathSim
Comment=MIPS Processor Simulator
Exec=$INSTALL_DIR/run-pathsim
Icon=java
Terminal=false
Categories=Education;Development;
EOF

echo "✅ Installation Complete!"
echo "You can now launch PathSim directly from your application menu."
