#!/bin/bash
# Android development module

[ "${DOTFILES_ANDROID_ENABLED:-0}" -ne 1 ] && return 0

export ANDROID_HOME="$HOME/Library/Android/sdk"
[ -d "$ANDROID_HOME" ] && export PATH="$ANDROID_HOME/emulator:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
