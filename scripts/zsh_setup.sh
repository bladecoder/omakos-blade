#!/bin/bash

set -e

# Source utility functions
source ./scripts/utils.sh

# set zsh as default shell
if ! command -v zsh &>/dev/null; then
  step "Setting ZSH as default shell…"
  chsh -s $(which zsh)
  print_success "ZSH set as default shell!"
fi

step "Configuring ZSH…"
# Copy zsh configs to local share
mkdir -p ~/.local/share/zsh
cp ./configs/zsh/* ~/.local/share/zsh/

# Copy zshrc configuration
if [ -f "./configs/zshrc" ]; then
  step "Setting up Zsh configuration..."
  if [ ! -f "$HOME/.zshrc" ]; then
    cp "./configs/zshrc" "$HOME/.zshrc"
    print_success "Zsh configuration installed"
  elif files_are_identical "$HOME/.zshrc" "./configs/zshrc"; then
    print_success_muted "Zsh configuration already up to date"
  elif confirm_override "$HOME/.zshrc" "./configs/zshrc" "Zsh configuration"; then
    cp "./configs/zshrc" "$HOME/.zshrc"
    print_success "Zsh configuration installed"
  else
    print_muted "Skipping Zsh configuration"
  fi
else
  print_warning "Zsh configuration file not found"
fi

print_success "ZSH configured!"
