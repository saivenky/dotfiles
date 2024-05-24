If a module shell script in this folder requires brew dependencies to be
installed, follow the following structure for the file:

```zsh
# If module not enabled, skip everything
if [ ${DOTFILES_MYMODULE_ENABLED-0} -ne 1 ]; then
    return 1
fi

# First pass, just add to the needed brew deps
if [ ${DOTFILES_MYMODULE_BREW_DEPS-0} -ne 1 ]; then
    DOTFILES_BREW_PACKAGES+=(
        brewdep1
        brewdep2
    )
    export DOTFILES_MYMODULE_BREW_DEPS=1
    return 1
fi

# rest of the file
```