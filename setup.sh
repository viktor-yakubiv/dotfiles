#!/bin/bash

DOTFILES_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# Clone submodules
# These include separated Neovim config and some dependencies
git submodule update --init --recursive

source "$DOTFILES_ROOT/.bin/bootstrap"
source "$DOTFILES_ROOT/.bin/install"

# Link .config
# if installed into a different directory
CONFIG_HOME="$HOME/.config"
if [ -n "$XDG_CONFIG_HOME" ]; then CONFIG_HOME="$XDG_CONFIG_HOME"; fi

if realpath("$CONFIG_HOME") != realpath("$DOTFILES_ROOT"); then
	for dir in $(cat "$DOTFILES_ROOT/dot-config.lst"); do
		ln -s "~/.config/$dir" "$DOTFILES_ROOT/$dir"
	done
fi
