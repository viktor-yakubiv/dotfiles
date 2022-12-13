#!/usr/bin/env zsh

set -e

source "$DOT_HOME/.lib/log.sh"

src="${0:a:h}"
src_basename=$(basename "$src")

if [[ -n $XDG_CONFIG_HOME ]]; then
	dst="$XDG_CONFIG_HOME/$src_basename"
else
	dst="$HOME/.config/$src_basename"
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
