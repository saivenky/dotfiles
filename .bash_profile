HOMEBREW_PREFIX=/opt/homebrew
if [ -d "$HOMEBREW_PREFIX/bin" ]; then
    # Avoid brew shellenv; its /bin/ps call is blocked in Codex sandbox runs
    export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
fi
. ~/.bashrc
