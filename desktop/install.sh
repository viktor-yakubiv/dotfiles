#!/bin/bash
# Desktop apps installation from Homebrew

SCRIPT_ROOT="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "$(dirname "$SCRIPT_ROOT")/.lib/log.sh"

# MacOS is always assumed to be desktop
if [ "$(uname -s)" = "Darwin" ]; then
	info "Installing desktop apps via Homebrew"
	brew bundle --file "$SCRIPT_ROOT/macos.brew"


# Linux is considered desktop in **some** cases;
# it's precise but should likely detect Ubuntu Desktop
elif [ "$XDG_SESSION_TYPE" = x11 ] || [ "$XDG_SESSION_TYPE" = wayland ]; then
	# Nothing to do on Linux Desktop,
	# as I don't use it currently
	info "Nothing to install for Linux desktop"

# Skipping otherwice
else
	info "Skipping desktop environment installation"
fi
