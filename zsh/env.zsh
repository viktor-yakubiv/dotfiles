# Projects directory for development
if [ "$(uname -s)" = "Darwin" ]; then
	export DEV_HOME="$HOME/Development"
else
	export DEV_HOME="$HOME"
fi
