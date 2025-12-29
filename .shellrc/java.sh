#!/bin/bash
# Java development module

[ "${DOTFILES_JAVA_ENABLED:-0}" -ne 1 ] && return 0

# Add OpenJDK to PATH
[ -d "/opt/homebrew/opt/openjdk/bin" ] && export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
