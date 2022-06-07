alias rebase="git pull --rebase origin master"
alias ve3="virtualenv -p python3 env"
alias vac=". ./env/bin/activate"
alias youtube-dl="python3 -m youtube_dl"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

daysuntil() {
    d1=$(date +%s)
    d2=$(date -d "$1" +%s)
    total_days=$(( (d2 - d1) / 86400 ))
    weeks=$(( total_days / 7 ))
    days=$(( total_days % 7 ))
    echo "$weeks weeks, $days days ($total_days total days)"
}

randtime() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    rand_time=$(shuf -i $d1-$d2 -n 1)
    date -d @$rand_time
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
