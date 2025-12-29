command -v brew &>/dev/null

export BREW_INSTALLED=$?

if [ $BREW_INSTALLED -ne 0 ]; then
    printf "Install Homebrew and then run 'dotfiles_brew_sync'.\n"
fi

function dotfiles_brew_sync() {
    brew update
    brew upgrade
    brew install $DOTFILES_BREW_PACKAGES
}

# Shell-aware tool initialization
if [ -n "$ZSH_VERSION" ]; then
    command -v direnv >/dev/null 2>&1 && eval "$(direnv hook zsh)"
    command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"
    command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
elif [ -n "$BASH_VERSION" ]; then
    command -v direnv >/dev/null 2>&1 && eval "$(direnv hook bash)"
    command -v fzf >/dev/null 2>&1 && eval "$(fzf --bash)"
    command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init bash)"
fi

# Custom cd wrapper with fallback for non-interactive shells (e.g., Claude Code)
# that may not have __zoxide_z loaded
function cd() {
    if type __zoxide_z >/dev/null 2>&1; then
        __zoxide_z "$@"
    else
        builtin cd "$@"
    fi
}

# Same for cdi (interactive zoxide)
function cdi() {
    if type __zoxide_zi >/dev/null 2>&1; then
        __zoxide_zi "$@"
    else
        builtin cd "$@"
    fi
}
