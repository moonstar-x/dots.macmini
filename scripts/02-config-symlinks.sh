#!/bin/bash

set -euo pipefail

SCRIPTS_DIR="$(pwd)"
DOTFILES_ROOT="$(realpath "$SCRIPTS_DIR/..")"
CONFIG_DIR="$DOTFILES_ROOT/config"

MAC_XDG_CONFIG_HOME="$HOME/Library/Application Support"
LINUX_XDG_CONFIG_HOME="$HOME/.config"

echo "Linking config for btop"
mkdir -p "$LINUX_XDG_CONFIG_HOME/btop/themes"
rm -rf "$LINUX_XDG_CONFIG_HOME/btop/btop.conf" "$LINUX_XDG_CONFIG_HOME/btop/themes"
ln -sf "$CONFIG_DIR/btop/btop.conf" "$LINUX_XDG_CONFIG_HOME/btop/btop.conf"
ln -sf "$CONFIG_DIR/btop/themes" "$LINUX_XDG_CONFIG_HOME/btop/themes"

echo "Linking config for ghostty"
mkdir -p "$MAC_XDG_CONFIG_HOME/com.mitchellh.ghostty"
ln -sf "$CONFIG_DIR/ghostty/config" "$MAC_XDG_CONFIG_HOME/com.mitchellh.ghostty/config"

echo "Linking config for git"
ln -sf "$CONFIG_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$CONFIG_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

echo "Linking config for jellyfin-tui"
mkdir -p "$MAC_XDG_CONFIG_HOME/jellyfin-tui"
ln -sf "$CONFIG_DIR/jellyfin-tui/config.yaml" "$MAC_XDG_CONFIG_HOME/jellyfin-tui/config.yaml"

echo "Linking config for starship"
ln -sf "$CONFIG_DIR/starship/config.toml" "$LINUX_XDG_CONFIG_HOME/starship.toml"

echo "Linking config for sublime-text"
mkdir -p "$MAC_XDG_CONFIG_HOME/Sublime Text/Packages/User"
ln -sf "$CONFIG_DIR/sublime-text/Preferences.sublime-settings" "$MAC_XDG_CONFIG_HOME/Sublime Text/Packages/User/Preferences.sublime-settings"
ln -sf "$CONFIG_DIR/sublime-text/Default.sublime-keymap" "$MAC_XDG_CONFIG_HOME/Sublime Text/Packages/User/Default.sublime-keymap"

echo "Linking config for zsh"
ln -sf "$CONFIG_DIR/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"
