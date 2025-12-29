# If module not enabled, skip everything
if [ ${DOTFILES_VIM_ENABLED-0} -ne 1 ]; then
    return 1
fi

# First pass, just add to the needed brew deps
if [ ${DOTFILES_VIM_BREW_DEPS-0} -ne 1 ]; then
    DOTFILES_BREW_PACKAGES+=(
        neovim
    )
    export DOTFILES_VIM_BREW_DEPS=1
    return 1
fi

# nvchad (pre-configured neovim setup)
[ ! -d $HOME/.config/nvim ] && git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

alias vim=nvim
export EDITOR=nvim