#!/bin/bash

DOTFILES_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Clone submodules
# These include separated Neovim config and some dependencies
git submodule update --init --recursive

source "$DOTFILES_ROOT/.bin/bootstrap"
source "$DOTFILES_ROOT/.bin/install"

# Link .config
# if installed into a different directory
for dir in $(cat "$DOTFILES_ROOT/dot-config.lst"); do
	ln -s "~/.config/$dir" "$DOTFILES_ROOT/$dir"
done
