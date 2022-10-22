# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if ! [ -d ~/.zsh/powerlevel10k ]
then
    echo "Downloading powerlevel10k"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        ~/.zsh/powerlevel10k
fi
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

if ! [ -d ~/.zsh/zsh-autocomplete ]
then
    echo "Downloading zsh-autocomplete"
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git
fi
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':autocomplete:*' min-delay 1.0  # seconds (float)
zstyle ':autocomplete:*' insert-unambiguous yes
zstyle ':autocomplete:history-search:*' list-lines 10  # int


source ~/.bash_aliases/main.sh
source ~/.bash_aliases/python.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
