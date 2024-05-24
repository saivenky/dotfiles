# If module not enabled, skip everything
if [ ${DOTFILES_SCRIPTS_ENABLED-0} -ne 1 ]; then
    return 1
fi

# First pass, just add to the needed brew deps
if [ ${DOTFILES_SCRIPTS_BREW_DEPS-0} -ne 1 ]; then
    # No brew deps needed
    export DOTFILES_SCRIPTS_BREW_DEPS=1
    return 1
fi

# Install my personal collection of scripts from:
# https://github.com/saivenky/bin

install_dir="${HOME}/bin"

function install_bin {
    _install_bin
    _update_bin > /dev/null

    export PATH="${PATH}:${install_dir}"
}

function _install_bin {
    if [ -d "${install_dir}" ]; then
        # Already installed
        return 0
    fi

    echo "Install saivenky/bin..."
    git clone git@github.com:saivenky/bin.git "${install_dir}"
    pushd "${install_dir}"
    ./setup.sh install
    popd

}

function _update_bin {
    pushd "${install_dir}"
    git fetch
    git rebase origin/main
    ./setup.sh install
    popd
}

#install_bin
