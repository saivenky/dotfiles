function daysuntil() {
    d1=$(date +%s)
    d2=$(date -d "$1" +%s)
    total_days=$(( (d2 - d1) / 86400 ))
    weeks=$(( total_days / 7 ))
    days=$(( total_days % 7 ))
    echo "$weeks weeks, $days days ($total_days total days)"
}

function randtime() {
    d1=$(date -d "$1" +%s)
    d2=$(date -d "$2" +%s)
    rand_time=$(shuf -i $d1-$d2 -n 1)
    date -d @$rand_time
}
