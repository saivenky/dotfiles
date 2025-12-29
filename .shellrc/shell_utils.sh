#!/bin/bash
# Shell utility functions

# Safe source - only source if file exists
shell_source() {
    [ -f "$1" ] && source "$1"
}

# Shell detection
detect_shell() {
    [ -n "$ZSH_VERSION" ] && echo "zsh" || echo "bash"
}

export -f shell_source detect_shell 2>/dev/null || true
