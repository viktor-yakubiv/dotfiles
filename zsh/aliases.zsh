alias reload!='. ~/.zshrc'

# Quick app calls
if [[ $OSTYPE == darwin* ]]; then
  alias chrome="open -a \"Chrome Canary\""
  alias firefox="open -a \"Firefox Developer Edition\""
  alias merge="open -a \"Sublime Merge\""
fi

# Shortcuts for browsers
alias ff="firefox"
alias ch="chrome"

# Programming languages
alias py=python3
alias js=node

# Editor
if nvim --version &> /dev/null; then
	alias vim=nvim
fi
