#!/bin/bash
# Ruby development module

[ "${DOTFILES_RUBY_ENABLED:-0}" -ne 1 ] && return 0

command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
