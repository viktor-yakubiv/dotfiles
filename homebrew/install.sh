#!/bin/bash
# Install Homebrew
#
# Homebrew is needed on both MacOS and Linux
# because some packages are not available from APT,
# and Snap is also not always available, e.g. in Codespaces

set -e

SCRIPT_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$(dirname "$SCRIPT_ROOT")/.lib/log.sh"

if test ! $(which brew); then
	info "Homebrew was not found in PATH. Installing..."
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Ensure PATH after the installation,
	# so the following script works.
	# Otherwice, PATH should have been already set
	# from the `.zshrc`.
	source "$SCRIPT_ROOT/env.zsh"
fi

info "Brewing core packages for all systems"
brew bundle --file="$SCRIPT_ROOT/core.brew"

# Brew OS-specific packages
if [ "$(uname -s)" == "Darwin" ]; then
	info "Brewing MacOS-scpecific packages"
	brew bundle --file="$SCRIPT_ROOT/macos.brew"
elif [ "$(uname -s)" == "Linux" ]; then
	info "Brewing Linux-scpecific packages"
	brew bundle --file="$SCRIPT_ROOT/linux.brew"
fi
