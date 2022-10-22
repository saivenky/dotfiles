alias l='ls -ah --color'

alias tmux='force_color_prompt=1 tmux'

try_source() {
    alias_file=$1

    if [ -f $alias_file ]
    then
        source $alias_file
    else
        echo "Skipped sourcing $alias_file"
    fi
}

# change editor
export EDITOR=vim
