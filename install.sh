#!/usr/bin/env bash

src=${PWD}
alacritty_dest=$HOME/.config/alacritty
bin_dst=$HOME/.local/bin
mpv_dst=$HOME/.config/mpv
neovim_dst=$HOME/.config/nvim
neovim_backup=$HOME/.local/share/nvim
vifm_dst=$HOME/.config/vifm
zsh_dst=$HOME/.config/zsh

delete_all() {
  for file in "$alacritty_dest" "$mpv_dst" "$neovim_dst" "$vifm_dst" \
    "$zsh_dst" "$HOME"/.{gitconfig,tmux.conf,zshrc}; do
    [[ -e $file ]] && rm -rf "$file"
  done
  printf "%s\n" "dotfiles deleted."
}

install_alacritty_configs() {
  if type -p alacritty &>/dev/null; then
    if [[ ! -e $alacritty_dest ]]; then
      mkdir -p "$alacritty_dest"
      cp -v "$src"/alacritty/alacritty.yml "$alacritty_dest"
    fi
  fi
}

install_mpv_configs() {
  if type -p mpv &>/dev/null; then
    mkdir -p "$mpv_dst"
    for file in "$src"/mpv/*; do
      cp -fv "$file" "$mpv_dst"
    done
  fi
}

install_neovim_configs() {
  mkdir -p "$neovim_dst"/colors
  mkdir -p "$neovim_backup"/{backup,undo}
  ln -sfv "$src"/nvim/init.vim "$neovim_dst"
  for file in "$src"/nvim/colors/*; do
    cp -fv "$file" "$neovim_dst"/colors
  done
}

install_vifm_configs() {
  mkdir -p "$vifm_dst"/colors
  cp -fv "$src"/vifm/colors/* "$vifm_dst"/colors
  ln -sfv "$src"/vifm/vifmrc "$vifm_dst"/vifmrc
}

install_zsh_configs() {
  mkdir -p "$HOME"/.cache/zsh
  mkdir -p "$zsh_dst"
  for file in "$src"/zsh/*; do
    ln -sfv "$file" "$zsh_dst"
  done
}

install_user_scripts() {
  mkdir -p "$bin_dst"
  for file in "$src"/bin/*; do
    cp -fv "$file" "$bin_dst"
  done
  chmod 700 "$bin_dst"/*
}

install_home_configs() {
  for file in tmux.conf zshrc; do
    ln -sfv "$src"/home/"$file" "$HOME"/."$file"
  done
  for file in ansible.cfg gitconfig; do
    cp -fv "$src"/home/"$file" "$HOME"/."$file"
    chmod 600 "$HOME"/."$file"
  done
}

main() {
  mkdir -p "$HOME"/projects/tmp
  install_alacritty_configs
  install_mpv_configs
  install_neovim_configs
  install_vifm_configs
  install_zsh_configs
  install_user_scripts
  install_home_configs
}

while [[ ! $# -eq 0 ]]; do
  case "$1" in
    --delete | -d)
      delete_all
      exit
      ;;
  esac
  shift
done

main "$@"

