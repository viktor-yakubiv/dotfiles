alias gai='git add --interactive'
alias gbda="git branch --merged | egrep -v \"(^\*|master|dev)\" | xargs git branch -d"
alias grp="git remote prune"
alias grpo="git remote prune origin"
alias gshn="git show --name-only"
alias gbp="for b in \$(git for-each-ref --format='%(if:equals=[gone])%(upstream:track)%(then)%(refname:short)%(end)' refs/heads); do git branch -D \$b; done"
alias gst="git status -sb"
