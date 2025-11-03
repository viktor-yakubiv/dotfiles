#!/bin/bash
#
# Sets up Git

set -e

SCRIPT_ROOT="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "$(dirname "$SCRIPT_ROOT")/.lib/log.sh"

cd "$SCRIPT_ROOT"

if ! [ -f gitconfig.local.symlink ]; then
	info 'Setting up Git config'

	git_credential='cache'
	if [ "$(uname -s)" = "Darwin" ]; then
		git_credential='osxkeychain'
	fi

	template_file="local.template"
	if [ "$CODESPACES" = "true" ]; then
		template_file="codespace.template"
	fi

	sed \
		-e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
		"$template_file" > gitconfig.local.symlink

	info 'Do not forget to edit default name and email if needed'
	success 'gitconfig'
fi
