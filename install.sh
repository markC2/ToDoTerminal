#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/share/todo"
BIN_LINK="$HOME/bin/todo"

mkdir -p "$(dirname "$BIN_LINK")"

if [ -d "$INSTALL_DIR/.git" ]; then
  echo "Updating existing install..."
  git -C "$INSTALL_DIR" pull
else
  echo "Cloning into $INSTALL_DIR..."
  git clone https://github.com/MarkC2/ToDoTerminal.git "$INSTALL_DIR"
fi

chmod +x "$INSTALL_DIR/todo"
ln -sf "$INSTALL_DIR/todo" "$BIN_LINK"

echo "Installed at $BIN_LINK -> $INSTALL_DIR/todo"
echo "Make sure $HOME/bin is on your PATH."
