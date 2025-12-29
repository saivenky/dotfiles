#!/bin/bash
# Python development module

# If module not enabled, skip everything
if [ ${DOTFILES_PYTHON_ENABLED-0} -ne 1 ]; then
    return 0
fi

# Activate virtual environment
function venv() {
    local env_dirs=(.venv .env "$1")
    for env_dir in "${env_dirs[@]}"; do
        if [ -d "${env_dir}" ]; then
            source "${env_dir}/bin/activate"
            echo "Activated ${env_dir}"
            return 0
        fi
    done
    return 1
}

# Simple python shim: use virtualenv's interpreter when active, otherwise fall back to python3.
if [ ${DOTFILES_PYTHON_SHIM-0} -ne 1 ]; then
    if command -v python3 >/dev/null 2>&1; then
        python() {
            if [ -n "${VIRTUAL_ENV-}" ] && [ -x "${VIRTUAL_ENV}/bin/python" ]; then
                "${VIRTUAL_ENV}/bin/python" "$@"
            else
                command python3 "$@"
            fi
        }
        export DOTFILES_PYTHON_SHIM=1
    fi
fi
