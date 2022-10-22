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
    if [ -d .venv ]
    then
        source .venv/bin/activate
    fi

    if [ -d .env ]
    then
        source .env/bin/activate
    fi
}

# jupyter
function install_ipykernel() {
    name=$1
    python -m ipykernel install --user --name "${name}"
}
