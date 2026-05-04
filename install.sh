#!/bin/bash

# Configuration
APP_NAME="tcalc"
INSTALL_DIR="$HOME/$APP_NAME"
BIN_DIR="$HOME/.local/bin"
SOURCE_FILE="src/main.kt"

echo "Starting T-Calc Installation..."

# 1. Dependency Check
if ! command -v kotlinc &> /dev/null; then
    echo "❌ Kotlin compiler (kotlinc) not found."
    echo "Please install it: sudo apt install kotlin (Debian/Ubuntu) or your distro's equivalent."
    exit 1
fi

# 2. Create Directory Structure
echo " Creating directory at $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"

# 3. Compile the Application
echo "🔨 Compiling $SOURCE_FILE..."
kotlinc "$SOURCE_FILE" -include-runtime -d "$INSTALL_DIR/$APP_NAME.jar"

if [ $? -eq 0 ]; then
    echo "Compilation successful."
else
    echo "Compilation failed."
    exit 1
fi

# 4. Create the Terminal Shortcut (Wrapper)
echo "Setting up terminal shortcut..."
cat <<EOF> "$BIN_DIR/$APP_NAME"
#!/bin/bash
java -jar "$INSTALL_DIR/$APP_NAME.jar" "\$@"
EOF

# Make shortcut executable
chmod +x "$BIN_DIR/$APP_NAME"

echo "-----------------------------------------------"
echo "🎉 Installation Complete!"
echo "Type '$APP_NAME' in your terminal to start."
echo "Note: Ensure $BIN_DIR is in your PATH."
echo "-----------------------------------------------"
