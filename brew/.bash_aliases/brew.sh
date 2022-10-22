command -v brew &>/dev/null

BREW_INSTALLED=$?

if [ $BREW_INSTALLED -eq 0 ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Skipping loading brew.sh"
fi
