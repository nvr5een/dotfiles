# $ZSH_CONFIG/prompt.zsh

# Minimal built-in prompt: context over SSH, current directory and failure status
# on the left; Git branch on the right. vcs_info avoids dirty-tree scans.
setopt prompt_subst
autoload -Uz vcs_info add-zsh-hook add-zle-hook-widget

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{242}%b%f'
zstyle ':vcs_info:git:*' actionformats '%F{yellow}%b:%a%f'

_prompt_update_vcs() {
  vcs_info
}
add-zsh-hook precmd _prompt_update_vcs

typeset -g _prompt_context=''
if [[ -n $SSH_CONNECTION || ( -n $LOGNAME && -n $USER && $LOGNAME != $USER ) ]]; then
  _prompt_context='%F{green}%n@%m%f '
fi

PROMPT='${_prompt_context}%F{blue}%1~%f %(?..%F{red}%?%f )%F{magenta}❯%f '
RPROMPT='${vcs_info_msg_0_}'

# Cursor shape follows the active Vi keymap without replacing other ZLE widgets.
if [[ $TERM != dumb ]]; then
  _prompt_cursor_for_keymap() {
    if [[ $KEYMAP == vicmd ]]; then
      print -rn -- $'\e[2 q'
    else
      print -rn -- $'\e[6 q'
    fi
  }

  _prompt_cursor_insert() {
    print -rn -- $'\e[6 q'
  }

  add-zle-hook-widget keymap-select _prompt_cursor_for_keymap
  add-zle-hook-widget line-init _prompt_cursor_insert
fi
