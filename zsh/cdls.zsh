# Listing contents on `cd`

function list_all() {
  emulate -L zsh
  ls -A
}

chpwd_functions=(${chpwd_functions[@]} "list_all")
