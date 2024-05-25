command -v brew &>/dev/null

export BREW_INSTALLED=$?

if [ $BREW_INSTALLED -ne 0 ]; then
    print "Install Homebrew and then run 'dotfiles_brew_sync'.\n"
fi

function dotfiles_brew_sync() {
    brew update
    brew upgrade
    brew install $DOTFILES_BREW_PACKAGES
}

if [ ${DOTFILES_BREW_DEPS-0} -ne 1 ]; then
    export DOTFILES_BREW_PACKAGES=(
        direnv
        fzf
        git-delta
        zoxide
    )
    export DOTFILES_BREW_DEPS=1
    return 1
fi

eval "$(direnv hook zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
