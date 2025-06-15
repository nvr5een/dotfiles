#!/usr/bin/env bash

dotfiles_dir=${PWD}
alacritty_dir=~/.config/alacritty
mpv_dir=~/.config/mpv
tmux_dir=~/.config/tmux
vifm_dir=~/.config/vifm
vim_dir=~/.vim
zsh_dir=~/.config/zsh

install_alacritty_configs() {
  if type -p alacritty &>/dev/null; then
    mkdir -p "$alacritty_dir"
    ln -sfv "$dotfiles_dir"/alacritty/alacritty.toml "$alacritty_dir"/alacritty.toml
  fi
}

install_mpv_configs() {
  if type -p mpv &>/dev/null; then
    mkdir -p "$mpv_dir"
    for file in "$dotfiles_dir"/mpv/*; do
      ln -sfv "$file" "$mpv_dir"
    done
  fi
}

install_tmux_configs() {
  if type -p tmux &>/dev/null; then
    mkdir -p "$tmux_dir"
    for file in "$dotfiles_dir"/tmux/*; do
      ln -sfv "$file" "$tmux_dir"
    done
  fi
}

install_vifm_configs() {
  if type -p vifm &>/dev/null; then
    mkdir -p "$vifm_dir"/colors
    if [[ "$OSTYPE" = "linux-gnu"* ]]; then
      ln -sfv "$dotfiles_dir"/vifm/vifmrc "$vifm_dir"/vifmrc
    elif [[ "$OSTYPE" = "darwin"* ]]; then
      ln -sfv "$dotfiles_dir"/vifm/vifmrc-osx "$vifm_dir"/vifmrc
    fi
    # colorscheme
    for file in "$dotfiles_dir"/vifm/colors/*; do
      ln -sfv "$file" "$vifm_dir"/colors
    done
    # favicons
    ln -sfv "$dotfiles_dir"/vifm/favicons.vifm "$vifm_dir"
  fi
}

install_vim_configs() {
  if type -p vim &>/dev/null; then
    mkdir -p "$vim_dir"/{colors,undo}
    for file in "$dotfiles_dir"/vim/colors/*; do
      ln -sfv "$file" "$vim_dir"/colors
    done
    ln -sfv "$dotfiles_dir"/vim/vimrc ~/.vimrc
  fi
}

install_zsh_configs() {
  if type -p zsh &>/dev/null; then
    mkdir -p ~/.cache/zsh
    mkdir -p "$zsh_dir"
    for file in "$dotfiles_dir"/zsh/{options,completion,prompt,aliases,plugins}.zsh; do
      ln -sfv "$file" "$zsh_dir"
    done
    ln -sfv "$dotfiles_dir"/zsh/zshrc ~/.zshrc
  fi
}

main() {
  mkdir -p ~/projects/tmp
  install_alacritty_configs
  install_mpv_configs
  install_tmux_configs
  install_vifm_configs
  install_vim_configs
  install_zsh_configs
}

main "$@"
