#!/bin/bash

SCRIPTS_DIR="$(pwd)"
DOTFILES_ROOT="$(realpath "$SCRIPTS_DIR/..")"
CONFIG_DIR="$DOTFILES_ROOT/config"

echo "Linking config for git"
ln -sf "$CONFIG_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$CONFIG_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

echo "Linking config for zsh"
ln -sf "$CONFIG_DIR/zsh/.zprofile" "$HOME/.zprofile"
ln -sf "$CONFIG_DIR/zsh/.zshrc" "$HOME/.zshrc"
