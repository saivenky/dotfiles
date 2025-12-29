#!/bin/bash
# Personal scripts module

# If module not enabled, skip everything
if [ ${DOTFILES_SCRIPTS_ENABLED-0} -ne 1 ]; then
    return 0
fi

# Install personal collection of scripts from:
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
    pushd "${install_dir}" || return 1
    ./setup.sh install
    popd || return 1
}

function _update_bin {
    pushd "${install_dir}" || return 1
    git fetch
    git rebase origin/main
    ./setup.sh install
    popd || return 1
}

# Uncomment to auto-install
#install_bin
