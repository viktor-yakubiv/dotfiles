if [ "$CODESPACES" = "true" ] && [ -z "$SSH_CONNECTION" ]; then
	export EDITOR="code --wait"
else
	export EDITOR="nvim"
fi
