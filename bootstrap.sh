#!/bin/bash

set -e

DOTFILES_ROOT="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "$DOTFILES_ROOT/.lib/log.sh"
cd "$DOTFILES_ROOT"


link_file () {
	local src=$1 dst=$2

	local overwrite= backup= skip=
	local action=

	if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
	then
		if [ "$overwrite_all" = "false" ] && [ "$backup_all" = "false" ] && [ "$skip_all" = "false" ]
		then
			local currentSrc="$(readlink $dst)"

			if [ "$currentSrc" == "$src" ]
			then
				skip=true;
			else
				user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
					[s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
				read -n 1 action

				case "$action" in
					o )
						overwrite=true;;
					O )
						overwrite_all=true;;
					b )
						backup=true;;
					B )
						backup_all=true;;
					s )
						skip=true;;
					S )
						skip_all=true;;
					* )
						;;
				esac
			fi
		fi

		overwrite=${overwrite:-$overwrite_all}
		backup=${backup:-$backup_all}
		skip=${skip:-$skip_all}

		if [ "$overwrite" == "true" ]
		then
			rm -rf "$dst"
			success "removed $dst"
		fi

		if [ "$backup" == "true" ]
		then
			mv "$dst" "${dst}.backup"
			success "moved $dst to ${dst}.backup"
		fi

		if [ "$skip" == "true" ]
		then
			success "skipped $src"
		fi
	fi

	if [ "$skip" != "true" ]  # "false" or empty
	then
		ln -s "$1" "$2"
		success "linked $1 to $2"
	fi
}

link_dotfiles () {
	info 'installing dotfiles'

	local overwrite_all=false backup_all=false skip_all=false

	if ! [ -t 0 ] # not interative
	then
		backup_all=true
	fi

	for src in $(find -H "$DOTFILES_ROOT" -maxdepth 2 -name '*.symlink' -not -path '*.git*')
	do
		dst="$HOME/.$(basename "${src%.*}")"
		link_file "$src" "$dst"
	done
}

link_dotconfig () {
	# Link .config
	# if installed into a different directory
	CONFIG_HOME="$HOME/.config"
	if [ -n "$XDG_CONFIG_HOME" ]; then CONFIG_HOME="$XDG_CONFIG_HOME"; fi

	if [ $(realpath "$CONFIG_HOME") != $(realpath "$DOTFILES_ROOT") ]; then
		for dir in $(cat "$DOTFILES_ROOT/dot-config.lst"); do
			link_file "$DOTFILES_ROOT/$dir" "$CONFIG_HOME/$dir"
		done
	fi
}

clone_submodules () {
	set +e
	# Clone submodules
	# These include separated Neovim config and some dependencies
	info "cloning submodules"
	git submodule update --init --recursive
	set -e
}

run_installers () {
	# Find the installers and run them iteratively
	info "Run all installers"
	find -H "$DOTFILES_ROOT" -maxdepth 2 -name 'install.sh' \
		-not -path '*.git*' | # not in .git
		grep -vF "$DOTFILES_ROOT/install.sh" | # filter out itself
		xargs -I{} /bin/bash {}
}

clone_submodules
link_dotfiles
link_dotconfig
run_installers
