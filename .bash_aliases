export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PYTHONSTARTUP=~/.pystartup

alias rebase="git pull --rebase origin master"
alias ve3="virtualenv -p python3 env"
alias vac=". ./env/bin/activate"

daysuntil() {
    d1=$(date +%s)
    d2=$(date -d "$1" +%s)
    total_days=$(( (d2 - d1) / 86400 ))
    weeks=$(( total_days / 7 ))
    days=$(( total_days % 7 ))
    echo "$weeks weeks, $days days ($total_days total days)"
}

fix-hscroll() {
    touchpadid=`xinput list | grep "Synaptics TouchPad" | cut -f2 | cut -d"=" -f2`
    scrolldistpropid=`xinput list-props $touchpadid | grep "Synaptics Scrolling Distance" | cut -f2 | tr -d "[[:alpha:]](): "`
    scrolldist=`xinput list-props $touchpadid | grep "Synaptics Scrolling Distance" | cut -f3`
    vscrolldist=`echo $scrolldist | cut -d"," -f1`
    hscrolldist=`echo $scrolldist | cut -d"," -f2`
    invhscrolldist=`echo "define abs(x) { if (x < 0) return (-x); return (x) }; abs($hscrolldist) * -1" | bc`
    xinput set-prop $touchpadid $scrolldistpropid $vscrolldist, $invhscrolldist
}
