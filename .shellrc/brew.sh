command -v brew &>/dev/null

BREW_INSTALLED=$?

if [ $BREW_INSTALLED -eq 0 ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Skipping loading brew.sh"
fi

function install_direnv() {
    command -v direnv &> /dev/null
    local direnv_installed=$?

    if [ $direnv_installed -eq 0 ]; then
        eval "$(direnv hook zsh)"
        return 0
    fi

    read -p "Install direnv (y/n)? " yn
    case $yn in
        [Yy]* ) brew install direnv; break;;
        * ) return 0;;
    esac
}

install_direnv
