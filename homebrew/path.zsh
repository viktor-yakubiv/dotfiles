# Patch paths on Linux only
if [[ "$(uname)" == "Linux" && "$PATH" != "*/linuxbrew/*" ]]; then
	export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
	export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
	export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX/Homebrew"

	export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
	export MANPATH="$HOMEBREW_PREFIX/share/man:$MANPATH"
	export INFOPATH="$HOMEBREW_PREFIX/share/info:$INFOPATH"
fi
