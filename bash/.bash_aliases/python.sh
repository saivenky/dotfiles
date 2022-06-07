# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
command -v poetry >/dev/null || export PATH="$HOME/.local/bin:$PATH"

# Python Autocompletion
export PYTHONSTARTUP=~/.pythonrc
export PYTHONSTARTUP=~/.pystartup

alias ve3="virtualenv -p python3 env"
alias vac=". ./env/bin/activate"


install-ipykernel() {
    python -m ipykernel install --user --name "$1" --display-name "$2"
}