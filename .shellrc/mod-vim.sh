#!/bin/bash
# Vim/Neovim configuration module

# If module not enabled, skip everything
if [ ${DOTFILES_VIM_ENABLED-0} -ne 1 ]; then
    return 0
fi

# Install NvChad (pre-configured neovim setup) if nvim config doesn't exist
[ ! -d "$HOME/.config/nvim" ] && git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

alias vim=nvim
export EDITOR=nvim
