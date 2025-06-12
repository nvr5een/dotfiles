#!/usr/bin/env bash

dotfiles_dir=${PWD}
alacritty_dir=~/.config/alacritty
git_dir=~/.config/git
mpv_dir=~/.config/mpv
neovim_dir=~/.config/nvim
neovim_backups_dir=~/.local/share/nvim
tmux_dir=~/.config/tmux
vifm_dir=~/.config/vifm
zsh_dir=~/.config/zsh
bin_dir=~/.local/bin
vim_dir=~/.vim

install_alacritty_configs() {
  if type -p alacritty &>/dev/null; then
    mkdir -p "$alacritty_dir"
    ln -sfv "$dotfiles_dir"/alacritty/alacritty.toml "$alacritty_dir"/alacritty.toml
  fi
}

install_git_configs() {
  mkdir -p "$git_dir"
  for file in "$dotfiles_dir"/git/*; do
    ln -sfv "$file" "$git_dir"
  done
}

install_mpv_configs() {
  if type -p mpv &>/dev/null; then
    mkdir -p "$mpv_dir"
    for file in "$dotfiles_dir"/mpv/*; do
      ln -sfv "$file" "$mpv_dir"
    done
  fi
}

install_neovim_configs() {
  mkdir -p "$neovim_dir"/colors
  mkdir -p "$neovim_backups_dir"/{backup,undo}
  ln -sfv "$dotfiles_dir"/nvim/init.vim "$neovim_dir"
  for file in "$dotfiles_dir"/nvim/colors/*; do
    ln -sfv "$file" "$neovim_dir"/colors
  done
}

install_tmux_configs() {
  mkdir -p "$tmux_dir"
  for file in "$dotfiles_dir"/tmux/*; do
    ln -sfv "$file" "$tmux_dir"
  done
}

install_vifm_configs() {
  mkdir -p "$vifm_dir"/colors
  if [[ "$OSTYPE" = "linux-gnu"* ]]; then
    ln -sfv "$dotfiles_dir"/vifm/vifmrc "$vifm_dir"/vifmrc
  elif [[ "$OSTYPE" = "darwin"* ]]; then
    ln -sfv "$dotfiles_dir"/vifm/vifmrc-macos "$vifm_dir"/vifmrc
  fi
  for file in "$dotfiles_dir"/vifm/colors/*; do
    ln -sfv "$file" "$vifm_dir"/colors
  done
}

install_zsh_configs() {
  mkdir -p ~/.cache/zsh
  mkdir -p "$zsh_dir"
  for file in "$dotfiles_dir"/zsh/{options,completion,prompt,aliases,plugins}.zsh; do
    ln -sfv "$file" "$zsh_dir"
  done
  ln -sfv "$dotfiles_dir"/zsh/zshrc ~/.zshrc
}

install_user_scripts() {
  mkdir -p "$bin_dir"
  for file in "$dotfiles_dir"/bin/*; do
    ln -sfv "$file" "$bin_dir"
  done
}

install_vim_configs() {
  mkdir -p "$vim_dir"/{colors,undo}
  for file in "$dotfiles_dir"/vim/colors/*; do
    ln -sfv "$file" "$vim_dir"/colors
  done
  ln -sfv "$dotfiles_dir"/vim/vimrc ~/.vimrc
}

main() {
  mkdir -p ~/projects/tmp
  install_alacritty_configs
  install_git_configs
  install_mpv_configs
  # install_neovim_configs
  install_vifm_configs
  install_zsh_configs
  install_tmux_configs
  # install_user_scripts
  install_vim_configs
}

main "$@"
