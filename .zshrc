# Check for Homebrew and halt if not installed
source $HOME/.shellrc/brew.sh

export DOTFILES_PYTHON_ENABLED=1
export DOTFILES_VIM_ENABLED=1
export DOTFILES_SCRIPTS_ENABLED=0

source $HOME/.shellrc/python.sh; 
source $HOME/.shellrc/vim.sh; 
source $HOME/.shellrc/scripts.sh; 

if [ ${BREW_INSTALLED-1} -ne 0 ] ; then
    return 1
fi

# Zsh plugins
# Zinit plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Install zsh plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light marlonrichert/zsh-autocomplete
zinit light zsh-users/zsh-autosuggestions

# Configure zsh plugin: zsh-autocomplete
zstyle ':autocomplete:*' min-delay 0.4  # seconds (float)
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:history-search:*' list-lines 10  # int
# Makes Enter submit the line
bindkey -M menuselect '\r' .accept-line

# Configure zsh plugin: zsh-autosuggestions
# Press Tab twice to accept the current suggestion
# Single tab doesn't seem to work
bindkey '\t\t' autosuggest-accept

# Aliases
alias l='ls -Ah --color'
alias ll='ls -ahl --color'
alias tmux='force_color_prompt=1 tmux'
alias gwdiff='git diff --word-diff --no-index --'

# Functions
source ~/.shellrc/functions.sh

# Optional parts of zshrc
source ~/.shellrc/python.sh
source ~/.shellrc/vim.sh
source ~/.shellrc/scripts.sh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Shell integrations
source ~/.shellrc/brew.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
