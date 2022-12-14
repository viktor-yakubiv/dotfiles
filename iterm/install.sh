#!/usr/bin/env zsh

set -e
source '../.lib/log.sh'

DOT_HOME="$HOME/.dotfiles" # check if exists first

# Linking this directory

defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOT_HOME/iterm"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
success 'linked iTerm2 config'
