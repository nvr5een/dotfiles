#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'
shopt -s nullglob

# Resolve repo root to the script's directory so it can run from anywhere
dotfiles_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)"

alacritty_dir="$HOME/.config/alacritty"
mpv_dir="$HOME/.config/mpv"
tmux_dir="$HOME/.config/tmux"
vifm_dir="$HOME/.config/vifm"
vim_dir="$HOME/.vim"
zsh_dir="$HOME/.config/zsh"

LN_FLAGS="-sf"

# Back up non-symlink files that would be overwritten
link() { # link <src> <dst>
  local src="$1" dst="$2" ts
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    ts="$(date +%Y%m%d-%H%M%S)"
    mv -v "$dst" "${dst}.bak.${ts}"
  fi
  echo "Linking $dst -> $src"
  ln $LN_FLAGS "$src" "$dst"
}

install_alacritty_configs() {
  if command -v alacritty &>/dev/null; then
    mkdir -p "$alacritty_dir"
    link "$dotfiles_dir/alacritty/alacritty.toml" "$alacritty_dir/alacritty.toml"
  fi
}

install_mpv_configs() {
  if command -v mpv &>/dev/null; then
    mkdir -p "$mpv_dir/shaders"

    # Guard missing files (brace expansion doesn't use nullglob)
    for file in "$dotfiles_dir"/mpv/{input,mpv}.conf; do
      [[ -e "$file" ]] || continue
      link "$file" "$mpv_dir/$(basename "$file")"
    done

    # Only iterate if source dir exists
    if [[ -d "$dotfiles_dir/mpv/shaders" ]]; then
      for file in "$dotfiles_dir"/mpv/shaders/*; do
        [[ -e "$file" ]] || continue
        link "$file" "$mpv_dir/shaders/$(basename "$file")"
      done
    fi
  fi
}

install_tmux_configs() {
  if command -v tmux &>/dev/null; then
    mkdir -p "$tmux_dir"
    if [[ -d "$dotfiles_dir/tmux" ]]; then
      for file in "$dotfiles_dir"/tmux/*; do
        [[ -e "$file" ]] || continue
        link "$file" "$tmux_dir/$(basename "$file")"
      done
    fi
  fi
}

install_vifm_configs() {
  if command -v vifm &>/dev/null; then
    mkdir -p "$vifm_dir/colors"
    case "$OSTYPE" in
      linux-gnu*)  link "$dotfiles_dir/vifm/vifmrc"     "$vifm_dir/vifmrc" ;;
      darwin*)     link "$dotfiles_dir/vifm/vifmrc-osx" "$vifm_dir/vifmrc" ;;
      *)           link "$dotfiles_dir/vifm/vifmrc"     "$vifm_dir/vifmrc" ;;
    esac

    if [[ -d "$dotfiles_dir/vifm/colors" ]]; then
      for file in "$dotfiles_dir"/vifm/colors/*; do
        [[ -e "$file" ]] || continue
        link "$file" "$vifm_dir/colors/$(basename "$file")"
      done
    fi

    [[ -e "$dotfiles_dir/vifm/favicons.vifm" ]] && \
      link "$dotfiles_dir/vifm/favicons.vifm" "$vifm_dir/favicons.vifm"
  fi
}

install_vim_configs() {
  if command -v vim &>/dev/null; then
    mkdir -p "$vim_dir"/{colors,ftdetect,syntax,undo}

    if [[ -d "$dotfiles_dir/vim/colors" ]]; then
      for file in "$dotfiles_dir"/vim/colors/*; do
        [[ -e "$file" ]] || continue
        link "$file" "$vim_dir/colors/$(basename "$file")"
      done
    fi

    if [[ -d "$dotfiles_dir/vim/syntax" ]]; then
      for file in "$dotfiles_dir"/vim/syntax/*; do
        [[ -e "$file" ]] || continue
        link "$file" "$vim_dir/syntax/$(basename "$file")"
      done
    fi

    [[ -e "$dotfiles_dir/vim/vimrc" ]] && link "$dotfiles_dir/vim/vimrc" "$HOME/.vimrc"
  fi
}

install_zsh_configs() {
  if command -v zsh &>/dev/null; then
    mkdir -p "$HOME/.cache/zsh" "$zsh_dir"
    if [[ -d "$dotfiles_dir/zsh" ]]; then
      for file in "$dotfiles_dir"/zsh/{options,completion,prompt,aliases,plugins}.zsh; do
        [[ -e "$file" ]] || continue
        link "$file" "$zsh_dir/$(basename "$file")"
      done
    fi
    [[ -e "$dotfiles_dir/zsh/zshrc" ]] && link "$dotfiles_dir/zsh/zshrc" "$HOME/.zshrc"
  fi
}

main() {
  install_alacritty_configs
  install_mpv_configs
  install_tmux_configs
  install_vifm_configs
  install_vim_configs
  install_zsh_configs
}

main "$@"
