#!/bin/bash

DOTFILES_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Clone submodules
# These include separated Neovim config and some dependencies
git submodule update --init --recursive

source "$DOTFILES_ROOT/.bin/bootstrap"
source "$DOTFILES_ROOT/.bin/install"
