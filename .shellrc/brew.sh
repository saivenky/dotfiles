command -v brew &>/dev/null

BREW_INSTALLED=$?

if [ $BREW_INSTALLED -ne 0 ]; then
    print "Install Homebrew and then run 'dotfiles_brew_sync'.\n"
    return 1
fi

export DOTFILES_BREW_PACKAGES=(
    direnv
)

function dotfiles_brew_sync() {
    brew update
    brew upgrade
    brew install $DOTFILES_BREW_PACKAGES
}

# Hook for direnv
eval "$(direnv hook zsh)"
