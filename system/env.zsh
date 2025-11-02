# MacOS on Apple Silicon
if [[ -x /opt/homebrew/bin/brew ]]; then
	HOMEBREW_PREFIX='/opt/homebrew'

# MacOS on Intel
elif [[ -x /usr/local/bin/brew ]]; then
	HOMEBREW_PREFIX='/usr/local'

# Linux
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
	HOMEBREW_PREFIX='/home/linuxbrew/.linuxbrew'
fi

# Patch PATH with the Homebrew prefix if it has not been yet!
#
# This could happen, for example, when Homebrew was installed
# as a devcontainer feature and the environment is already set up.
if [[ -n "$HOMEBREW_PREFIX" && "$PATH" != "*$HOMEBREW_PREFIX*" ]]; then
	eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"
fi

# Add dotfiles and local bonaries to PATH
export PATH="./bin:$DOT_HOME/bin:$PATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
