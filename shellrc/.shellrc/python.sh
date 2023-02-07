# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null
pyenv_installed=$?
if [ $pyenv_installed -eq 0 ]
then
    eval "$(pyenv init -)"
else
    echo "Skipping aliases for pyenv (not installed)"
fi

# poetry
command -v poetry >/dev/null || export PATH="$HOME/.local/bin:$PATH"

# Python Autocompletion
# export PYTHONSTARTUP=~/.pythonrc
# export PYTHONSTARTUP=~/.pystartup

function venv_activate() {
    local env_dirs=(.venv .env)
    for env_dir in "${env_dirs[@]}"
    if [ -d "${env_dir}" ]
    then
        source .venv/bin/activate
        exit 0
    fi
}

# jupyter
function install_ipykernel() {
    name=$1
    python -m ipykernel install --user --name "${name}"
}
