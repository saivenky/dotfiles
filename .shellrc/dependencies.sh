#!/bin/bash
# Central dependency manifest

DOTFILES_BREW_PACKAGES=()

# Core tools (always included)
DOTFILES_BREW_PACKAGES+=(direnv fzf git-delta zoxide)

# Module dependencies
[ "${DOTFILES_PYTHON_ENABLED:-0}" -eq 1 ] && DOTFILES_BREW_PACKAGES+=(pipx poetry pyenv)
[ "${DOTFILES_VIM_ENABLED:-0}" -eq 1 ] && DOTFILES_BREW_PACKAGES+=(neovim)
[ "${DOTFILES_JAVA_ENABLED:-0}" -eq 1 ] && DOTFILES_BREW_PACKAGES+=(openjdk)
[ "${DOTFILES_RUBY_ENABLED:-0}" -eq 1 ] && DOTFILES_BREW_PACKAGES+=(rbenv)

export DOTFILES_BREW_PACKAGES
