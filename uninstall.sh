#!/bin/bash

APP_NAME="tcalc"
INSTALL_DIR="$HOME/$APP_NAME"
BIN_DIR="$HOME/.local/bin"

echo "Uninstalling T-Calc..."

# Remove the application directory
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "Removed $INSTALL_DIR"
fi

# Remove the binary shortcut
if [ -f "$BIN_DIR/$APP_NAME" ]; then
    rm "$BIN_DIR/$APP_NAME"
    echo "Removed $BIN_DIR/$APP_NAME"
fi

echo "T-Calc has been successfully removed."
