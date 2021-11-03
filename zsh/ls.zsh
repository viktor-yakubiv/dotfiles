function list_all() {
  emulate -L zsh
  ls -a
}
chpwd_functions=(${chpwd_functions[@]} "list_all")
