#!/bin/bash

SCRIPT_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

# MacOS is always assumed to be desktop
if [ "$(uname -s)" == "Darwin" ]; then
	brew bundle "$SCRIPT_ROOT/macos.brewfile"


# Linux is considered desktop in **some** cases;
# it's precise but should likely detect Ubuntu Desktop
elif [ "$XDG_SESSION_TYPE" = x11 ] || [ "$XDG_SESSION_TYPE" = wayland ]; then
	# Nothing to do on Linux Desktop,
	# as I don't use it currently


# Skipping otherwice
else
	echo "Skipping desktop environment installation".
fi
