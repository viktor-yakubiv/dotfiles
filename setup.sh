#!/bin/bash

DOTFILES_ROOT="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
source "$DOTFILES_ROOT/.bin/bootstrap"
source "$DOTFILES_ROOT/.bin/install"
