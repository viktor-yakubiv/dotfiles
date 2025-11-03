#!/bin/bash
# Install Homebrew
#
# Homebrew is needed on both MacOS and Linux
# because some packages are not available from APT,
# and Snap is also not always available, e.g. in Codespaces

set -e

SCRIPT_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"

if test ! $(which brew); then
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Ensure PATH after the installation,
	# so the following script works.
	# Otherwice, PATH should have been already set
	# from the `.zshrc`.
	source "$SCRIPT_ROOT/env.zsh"
fi

# Brew core packages for all systems
brew bundle --file="$SCRIPT_ROOT/core.brewfile"

# Brew OS-specific packages
if [ "$(uname -s)" == "Darwin" ]; then
	brew bundle --file="$SCRIPT_ROOT/macos.brewfile"
elif [ "$(uname -s)" == "Linux" ]; then
	brew bundle --file="$SCRIPT_ROOT/linux.brewfile"
fi
