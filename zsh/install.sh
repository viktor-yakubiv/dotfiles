#!/bin/bash
#
# ZSH installation
#
# This installs zgenom - a package manager for zsh
# using Git, since it cannot be installed through Homebrew

SCRIPT_ROOT="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "$(dirname "$SCRIPT_ROOT")/.lib/log.sh"

ZGENOM_HOME="$HOME/.local/share/zgenom"

mkdir -p "$ZGENOM_HOME"
if [ -d "$ZGENOM_HOME" ]; then
	info 'Zgenom seems to be installed. Skipping...'
else
	info "Clonning Zgenom to `$ZGENOM_HOME`"
	git clone https://github.com/jandamm/zgenom.git "$ZGENOME_HOME"
fi
