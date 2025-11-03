# Listing contents on `cd`

function __list_all() {
  emulate -L zsh
  ls -A
}

chpwd_functions=(${chpwd_functions[@]} "__list_all")
