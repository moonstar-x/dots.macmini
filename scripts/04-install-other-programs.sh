#!/bin/bash

cmd="$1"
shift

# Functions

jellyfin-tui() {
  echo "Installing jellyfin-tui"

  brew install mpv
  git clone https://github.com/dhonus/jellyfin-tui /tmp/jellyfin-tui
  cd /tmp/jellyfin-tui

  export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
  export PATH=$PATH:~/.cargo/bin/
  cargo install --path .

  rm -rf /tmp/jellyfin-tui
}

# Runner

if declare -f "$cmd" > /dev/null; then
  "$cmd"
else
  echo "Unknown command: $cmd"
fi
