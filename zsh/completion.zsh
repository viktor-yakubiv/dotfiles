# This code is stolen from ohmyzsh and shared under:
#
# MIT License
# Copyright (c) 2009-2022 Robby Russell and contributors (https://github.com/ohmyzsh/ohmyzsh/contributors)
#
# https://github.com/ohmyzsh/ohmyzsh/blob/master/LICENSE.txt

# This function provides autocomplete when you start writing a directory name

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}

compdef _dirs d
