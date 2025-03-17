#!/bin/sh
#
# ZSH installation
#
# This installs zgenom - a package manager for zsh
# using Git, since it cannot be installed through Homebrew
mkdir -p "$HOME/.local/share/zgenom"
git clone https://github.com/jandamm/zgenom.git "$HOME/.local/share/zgenom"
