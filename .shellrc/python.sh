# If module not enabled, skip everything
if [ ${DOTFILES_PYTHON_ENABLED-0} -ne 1 ]; then
    return 1
fi

# First pass, just add to the needed brew deps
if [ ${DOTFILES_PYTHON_BREW_DEPS-0} -ne 1 ]; then
    DOTFILES_BREW_PACKAGES+=(
        poetry
        pyenv
    )
    export DOTFILES_PYTHON_BREW_DEPS=1
    return 1
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Functions
# Activate virtual environment
function venv() {
    local env_dirs=(.venv .env "$1")
    for env_dir in "${env_dirs[@]}"
    if [ -d "${env_dir}" ]
    then
        source ${env_dir}/bin/activate
        echo "Activated ${env_dir}"
        return 0
    fi

    return 1
}

# jupyter
function install_ipykernel() {
    name=$1
    python -m ipykernel install --user --name "${name}"
}
