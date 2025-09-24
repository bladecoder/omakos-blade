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
# Configure the zsh shell using omakos defaults
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak
cp ./configs/zshrc ~/.zshrc

# Copy zsh configs to local share
mkdir -p ~/.local/share/zsh
cp ./configs/zsh/* ~/.local/share/zsh/
print_success "ZSH configured!"
