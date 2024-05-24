# Date and time
function gnu_date() {
  gnu_date_exists=$(command -v gdate)
  if [ -n "${gnu_date_exists}" ]; then
    gdate "$@"
  else
    date "$@"
  fi
}

function daysuntil() {
    d1=$(gnu_date +%s)
    d2=$(gnu_date -d "$1" +%s)
    total_days=$(( (d2 - d1) / 86400 ))
    weeks=$(( total_days / 7 ))
    days=$(( total_days % 7 ))
    echo "$weeks weeks, $days days ($total_days total days)"
}

function randtime() {
    d1=$(gnu_date -d "$1" +%s)
    d2=$(gnu_date -d "$2" +%s)
    rand_time=$(shuf -i $d1-$d2 -n 1)
    gnu_date -d @$rand_time
}

command -v git-filter-repo &>/dev/null
if [ $? -ne 0 ]; then
    curl -o $HOME/.local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo
fi