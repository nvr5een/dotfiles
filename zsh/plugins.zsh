# $ZSH_CONFIG/plugins.zsh

# zsh-history-substring-search: Arch Linux and Homebrew on macOS/Linux.
_history_search_paths=(
  /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  "$ZSH_HOMEBREW_PREFIX/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
  /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
  /home/linuxbrew/.linuxbrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
)
for _plugin_file in $_history_search_paths; do
  if [[ -r $_plugin_file ]]; then
    source "$_plugin_file"
    break
  fi
done
unset _history_search_paths _plugin_file

# fzf defaults and shell integration.
if (( $+commands[fzf] )); then
  export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS:---multi --cycle --prompt='❯ ' --pointer='❯' --marker='❯' --color=16}"

  if (( $+commands[rg] )); then
    export FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND:-rg --follow --hidden --files --glob '!.git/*' 2>/dev/null}"
  elif (( $+commands[fd] )); then
    export FZF_DEFAULT_COMMAND="${FZF_DEFAULT_COMMAND:-fd --hidden --follow --exclude .git --type f 2>/dev/null}"
  fi

  _fzf_shell_dirs=(
    /usr/share/fzf
    "$ZSH_HOMEBREW_PREFIX/opt/fzf/shell"
    /opt/homebrew/opt/fzf/shell
    /usr/local/opt/fzf/shell
    /home/linuxbrew/.linuxbrew/opt/fzf/shell
  )
  for _fzf_dir in $_fzf_shell_dirs; do
    if [[ -r $_fzf_dir/completion.zsh || -r $_fzf_dir/key-bindings.zsh ]]; then
      [[ -r $_fzf_dir/completion.zsh ]] && source "$_fzf_dir/completion.zsh"
      [[ -r $_fzf_dir/key-bindings.zsh ]] && source "$_fzf_dir/key-bindings.zsh"
      break
    fi
  done
  unset _fzf_shell_dirs _fzf_dir
fi
