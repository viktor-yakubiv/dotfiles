#!/usr/bin/env zsh

OMZ_HOME=${OMZ_HOME:-"$HOME/.oh-my-zsh"}

ZSH="$OMZ_HOME"
ZSH_CUSTOM=${ZSH_CUSTOM:-"$ZSH/custom"}

if [ ! -f "$OMZ_HOME/oh-my-zsh.sh" ]; then
  # Install ZSH if not installed
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Install Spaceship Prompt
  git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1 &&
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi