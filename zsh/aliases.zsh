alias reload!='. ~/.zshrc'

# Common commads
alias t=touch

# Common locations
alias dl="~/Downloads"

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

# Vim-shortcuts, I've got used to
alias :q="exit"
