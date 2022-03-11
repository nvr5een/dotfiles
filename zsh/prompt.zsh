# $ZSH_CONFIG/prompt.zsh

setopt prompt_subst # perform arithmetic expansion in prompts (required)

autoload -Uz colors && colors

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Edit of 'Common' zsh theme
# https://github.com/jackharrisonsherlock/common
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

colors_host_me=green
colors_current_dir=blue
colors_git_status_default=default
colors_git_status_staged=green
colors_git_status_unstaged=yellow

PROMPT='$(common_host)$(common_current_dir)$(common_git_status)❯ '

common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$colors_host_me]%}$me%f:"
  fi
}

common_current_dir() {
  # echo -n "%B%{$fg[$colors_current_dir]%}%c%f%b "
  echo -n "%{$fg[$colors_current_dir]%}%c%f "
}

common_git_status() {
  local message=""
  local message_color="%F{$colors_git_status_default}"

  local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
  local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

  if [[ -n ${staged} ]]; then
    message_color="%F{$colors_git_status_staged}"
  elif [[ -n ${unstaged} ]]; then
    message_color="%F{$colors_git_status_unstaged}"
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n ${branch} ]]; then
    message+="${message_color}${branch}%f "
  fi

  echo -n "${message}"
}

#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Change cursor shape for different vi modes
# https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52
#-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

cursor_mode() {
  cursor_block='\e[2 q'
  cursor_beam='\e[6 q'

  function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
      [[ $1 = 'block' ]]; then
      echo -ne $cursor_block
    elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
      echo -ne $cursor_beam
    fi
  }

  zle-line-init() {
    echo -ne $cursor_beam
  }

  zle -N zle-keymap-select
  zle -N zle-line-init
}

cursor_mode

