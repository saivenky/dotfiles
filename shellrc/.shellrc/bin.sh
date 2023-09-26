# Install my personal collection of scripts from:
# https://github.com/saivenky/bin

function install_bin {
    local install_dir="${HOME}/bin"
    echo $install_dir
    if [ -d "${install_dir}" ]; then
        # Already installed
        return 0
    fi

    echo "Install saivenky/bin..."
    git clone git@github.com:saivenky/bin.git "${install_dir}"
    pushd "${install_dir}"
    ./setup.sh install
    popd

    export PATH="${PATH}:${install_dir}"
}

install_bin