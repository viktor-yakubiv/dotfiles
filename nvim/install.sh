#!/usr/bin/env zsh

set -e

source "$(dirname "$(dirname "$0")")/.lib/log.sh"

DOT_HOME="$HOME/.dotfiles" # check if exists first

src="${0:a:h}"

if [[ -n $XDG_CONFIG_HOME ]]; then
	dst="$XDG_CONFIG_HOME/nvim"
else
	dst="$HOME/.config/nvim"
fi

if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]; then
	local current_src="$(readlink $dst)"

	if [[ "$current_src" == "$src" ]]; then
		info "$dst already linked to $src"
		exit 0
	fi

	mv "$dst" "$dst.backup"
	info "moved $dst to ${dst}.backup"
fi

ln -s "$src" "$dst"
success "linked $dst to $src"
