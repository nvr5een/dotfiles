# ~/.zshrc

zmodload zsh/zprof

# Exports {{{
export VISUAL=nvim
export EDITOR=$VISUAL
export PAGER=less
export LESS="-iMFXR"

export LESS_TERMCAP_mb=$'\E[01;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=32;40:st=30;44:ex=01;32:*.7z=00;31:*.a=00;31:*.cab=00;31:*.arj=00;31:*.deb=00;31:*.egg=00;31:*.pkg=00;31:*.bz2=00;31:*.cbr=00;31:*.cbz=00;31:*.chm=00;31:*.dmg=00;31:*.gz=00;31:*.iso=00;31:*.jad=00;31:*.jar=00;31:*.nrg=00;31:*.pdf=00;31:*.rar=00;31:*.vcd=00;31:*.t=00;31:*.tar=00;31:*.tgz=00;31:*.xz=00;31:*.z=00;31:*.zip=00;31:*.ai=00;32:*.bmp=00;32:*.cdr=00;32:*.eps=00;32:*.gif=00;32:*.icns=00;32:*.ico=00;32:*.jpeg=00;32:*.jpg=00;32:*.pbm=00;32:*.pgm=00;32:*.png=00;32:*.pnm=00;32:*.ppm=00;32:*.ps=00;32:*.psd=00;32:*.raw=00;32:*.svg=00;32:*.tif=00;32:*.tiff=00;32:*.xpm=00;32:*.applescript=00;33:*.asm=00;33:*.awk=00;33:*.bash=00;33:*.bat=00;33:*.c=00;33:*.cl=00;33:*.cmd=00;33:*.coffee=00;33:*.cpp=00;33:*.cs=00;33:*.diff=00;33:*.el=00;33:*.go=00;33:*.h=00;33:*.hs=00;33:*.java=00;33:*.js=00;33:*.jsp=00;33:*.lua=00;33:*.m=00;33:*.patch=00;33:*.pl=00;33:*.pm=00;33:*.pod=00;33:*.ps=00;33:*.py=00;33:*.r=00;33:*.rb=00;33:*.sed=00;33:*.sh=00;33:*.sql=00;33:*.sty=00;33:*.tac=00;33:*.tcl=00;33:*.tex=00;33:*.tfm=00;33:*.vb=00;33:*.vim=00;33:*.wsgi=00;33:*.zsh=00;33:*.ascx=00;34:*.ashx=00;34:*.aspx=00;34:*.css=00;34:*.erb=00;34:*.htm=00;34:*.html=00;34:*.php=00;34:*.sass=00;34:*.scss=00;34:*.less=00;34:*.rst=00;34:*.textile=00;34:*.markdown=00;34:*.md=00;34:*.mkd=00;34:*.genshi=00;34:*.jinja=00;34:*.mako=00;34:*.django=00;34:*.haml=00;34:*.cfg=00;35:*.chm=00;35:*.conf=00;35:*.csv=00;35:*.doc=00;35:*.docx=00;35:*.dvi=00;35:*.epub=00;35:*.ini=00;35:*.json=00;35:*.key=00;35:*.log=00;35:*.mobi=00;35:*.msg=00;35:*.nfo=00;35:*.odf=00;35:*.pages=00;35:*.pdf=00;35:*.pps=00;35:*.ppt=00;35:*.pptx=00;35:*.rtf=00;35:*.txt=00;35:*.vcf=00;35:*.wpd=00;35:*.wps=00;35:*.xls=00;35:*.xlsx=00;35:*.xml=00;35:*.yml=00;35:*.3g2=00;36:*.3gp=00;36:*.aac=00;36:*.aif=00;36:*.asf=00;36:*.asx=00;36:*.avi=00;36:*.cue=00;36:*.dat=00;36:*.fcm=00;36:*.flac=00;36:*.flv=00;36:*.iff=00;36:*.m3u=00;36:*.m4a=00;36:*.mkv=00;36:*.mod=00;36:*.mov=00;36:*.mp3=00;36:*.mp4=00;36:*.mpa=00;36:*.mpeg=00;36:*.mpg=00;36:*.ogv=00;36:*.ra=00;36:*.rm=00;36:*.s3m=00;36:*.sid=00;36:*.spl=00;36:*.spx=00;36:*.swf=00;36:*.ts=00;36:*.vob=00;36:*.wav=00;36:*.wma=00;36:*.wmv=00;36:';
export LS_COLORS
export GREP_COLOR='37;45'

export HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zhistory}"
export HISTSIZE=10000
export SAVEHIST="$HISTSIZE"

typeset -U PATH
[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/projects/private/bin" ]] && export PATH="$HOME/projects/private/bin:$PATH"

if type surfraw &>/dev/null; then
  if [[ -d "/usr/local/lib/surfraw" ]]; then
    export PATH="/usr/local/lib/surfraw:$PATH"
  elif [[ -d "/usr/lib/surfraw" ]]; then
    export PATH="/usr/lib/surfraw:$PATH"
  fi
  if type w3m &>/dev/null; then
    export SURFRAW_text_browser=w3m
    export SURFRAW_graphical=no
  fi
fi

if type brew &>/dev/null; then
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH"
  export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:/usr/local/share/man:$MANPATH"
  export HOMEBREW_NO_EMOJI=1
fi

# }}}
# Options {{{

# Changing Directories
setopt AUTO_CD # perform 'cd' if command is name of directory
setopt AUTO_PUSHD # make cd push old directory onto directory stack
setopt PUSHD_IGNORE_DUPS # don't push duplicate directories onto directory stack
setopt PUSHD_SILENT # do not print directory stack after pushd or popd

# Completion
setopt ALWAYS_TO_END # move cusor to end of word when completion is inserted
setopt COMPLETE_ALIASES # aliases are distinct commands for completion purposes
setopt COMPLETE_IN_WORD # perform completion from both ends of words
setopt NO_MENU_COMPLETE # do not insert first match on ambiguous completion

# Expansion and Globbing
setopt EXTENDED_GLOB # needed for file modification glob modifiers with compinit

# History
setopt EXTENDED_HISTORY # save each command's timestamp
setopt HIST_IGNORE_ALL_DUPS # remove duplicate command lines from history
setopt HIST_IGNORE_SPACE # remove commands from history beginning with a space
setopt INC_APPEND_HISTORY # add commands immediately to $HISTFILE incrementally
setopt NO_SHARE_HISTORY # import commands manually with `fc-RI'

# Input/Output
setopt CORRECT # correct spelling of commands
setopt NO_CORRECT_ALL # do not correct spelling of command arguments
setopt INTERACTIVE_COMMENTS # allow comments in interactive shells

# Job Control
setopt NO_CHECK_JOBS # don't report on jobs when shell exits
setopt NO_HUP # don't kill jobs on shell exit
setopt LONG_LIST_JOBS # list jobs in long format
setopt NOTIFY # report status of background/suspended jobs immediately

# Prompting
setopt PROMPT_SUBST # perform arithmetic expansion in prompts (required)

# }}}
# Completion {{{

fpath=(~/.zsh/completion $fpath)

# Cherry-picked from:
# https://github.com/sorin-ionescu/prezto/blob/master/modules/completion/init.zsh
# https://grml.org/zsh/zsh-lovers.html

# Load and initialize completion system with a cache time of 20 hours.
autoload -Uz compinit
_comp_path="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
if [[ $_comp_path(#qNmh-20) ]]; then
  compinit -C -d "$_comp_path"
else
  mkdir -p "$_comp_path:h"
  compinit -i -d "$_comp_path"
fi
unset _comp_path

# Enable caching for command completion
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

# Case-insensitive (all), partial-word, and then substring completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
       'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _expand_alias _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word. But make
# sure to cap (at 7) the max-errors to avoid hanging.
zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Ignore completion functions for unavailable commands
zstyle ':completion:*:functions' ignored-patterns '_*'

# Kill
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' squeeze-slashes true

# }}}
# Key Bindings {{{
bindkey -e
bindkey 'jk' vi-cmd-mode

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey -M vicmd "k" history-beginning-search-backward-end
bindkey -M vicmd "j" history-beginning-search-forward-end

# ctrl+vim keys for menu navigation
zmodload zsh/complist
bindkey -M menuselect '^h' vi-backward-char
bindkey -M menuselect '^k' vi-up-line-or-history
bindkey -M menuselect '^l' vi-forward-char
bindkey -M menuselect '^j' vi-down-line-or-history

# In vi-cmd-mode, 'v' edits current command with $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# }}}
# Prompt {{{
# https://github.com/jackharrisonsherlock/common
# https://thevaluable.dev/zsh-install-configure/
autoload -Uz colors && colors

COMMON_COLORS_HOST_ME=green
COMMON_COLORS_HOST_AWS_VAULT=yellow
COMMON_COLORS_CURRENT_DIR=blue
COMMON_COLORS_RETURN_STATUS_TRUE=yellow
COMMON_COLORS_RETURN_STATUS_FALSE=red
COMMON_COLORS_GIT_STATUS_DEFAULT=default
COMMON_COLORS_GIT_STATUS_STAGED=green
COMMON_COLORS_GIT_STATUS_UNSTAGED=yellow
COMMON_COLORS_GIT_PROMPT_SHA=green
COMMON_COLORS_BG_JOBS=yellow

COMMON_PROMPT_SYMBOL=">"
PROMPT='$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'
RPROMPT='$(common_git_status)'

common_host() {
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_ME]%}$me%{$reset_color%}:"
  fi
  if [[ $AWS_VAULT ]]; then
    echo "%{$fg[$COMMON_COLORS_HOST_AWS_VAULT]%}$AWS_VAULT%{$reset_color%} "
  fi
}

common_current_dir() {
  echo -n "%{$fg[$COMMON_COLORS_CURRENT_DIR]%}%c "
}

common_return_status() {
  echo -n "%(?.%F{$COMMON_COLORS_RETURN_STATUS_TRUE}.%F{$COMMON_COLORS_RETURN_STATUS_FALSE})$COMMON_PROMPT_SYMBOL%f "
}

common_git_status() {
  local message=""
  local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"

  local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
  local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

  if [[ -n ${staged} ]]; then
    message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
  elif [[ -n ${unstaged} ]]; then
    message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
  fi

  local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
  if [[ -n ${branch} ]]; then
    message+="${message_color}${branch}%f"
  fi

  echo -n "${message}"
}

common_bg_jobs() {
  bg_status="%{$fg[$COMMON_COLORS_BG_JOBS]%}%(1j.↓%j .)"
  echo -n $bg_status
}

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

# }}}
# Aliases and functions {{{
alias :q='exit'
alias diskspace='du -S | sort -n -r | less'
alias ports='netstat -tulanp'
alias pro='cd ~/projects'
alias reload='. ~/.zshrc; echo ZSH config reloaded!'

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias df='df -h'
alias du='du -ch'
alias grep='grep --color=auto'
alias mkdir='nocorrect mkdir -pv'
alias mount='mount | column -t'

alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -iv'
alias ln='ln -iv'
alias mv='nocorrect mv -iv'
alias rm='rm -Iv'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias ga='git add'
alias gb='git branch'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gl='git pull'
alias gmv='git mv -v'
alias gp='git push'
alias grm='git rm'
alias gs='git status'

if (( $+commands[apt-get] )); then
  alias apti='sudo apt install --no-install-recommends'
  alias aptu='sudo apt update'
  alias aptf='sudo apt full-upgrade'
  alias aptr='sudo apt remove'
  alias aptp='sudo apt purge'
  alias apta='sudo apt autoremove'
  alias apts='apt search'
  alias aptq='apt show'
  alias aptli='apt list --installed | less'
  alias aptlu='apt list --upgradeable'
  alias aptstat='dpkg -l | wc -l'
fi

if (( $+commands[pacman] )); then
  if (( $+commands[yay] )); then
    alias paci='yay -S' # install package(s) (incl AUR)
    alias pacu='yay -Syu' # sync, then upgrade all packages (incl AUR)
    alias pacs='yay -Ss' # search for package(s) (incl AUR)
    alias pacq='yay -Si' # show package info (incl AUR)
  else
    alias paci='sudo pacman -S' # install package(s)
    alias pacu='sudo pacman -Syu' # sync, then upgrade all packages
    alias pacs='pacman -Ss' # search for package(s)
    alias pacq='pacman -Si' # show package info
  fi
  alias pacr='sudo pacman -R' # remove package(s) but retain configs and depends
  alias pacrr='sudo pacman -Rns' # remove package(s), configs and depends
  alias pacro='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages
  alias pacli='pacman -Q | less' # list all packages currently installed
  alias pacll='pacman -Qqm' # list all packages locally installed
  alias paco='pacman -Qo' # determine which package owns a given file
  alias pacf='pacman -Ql' # list all files installed by a given package
  alias pacc='sudo pacman -Sc' # delete all packages not currently installed
  alias pacm='makepkg -fsic' # make package from PKGBUILD, install deps, clean
  alias pacstat='pacman -Q | wc -l' # print number of installed packages
fi

fname() {
  find . -iname "*$@*"
}

mkcd() {
  mkdir -p "$*"; cd "$*"
}

# Print tidy, colorized $PATH
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\", \"$fg[green]/usr$reset_color\"); \
           sub(\"/bin\", \"$fg[blue]/bin$reset_color\"); \
           sub(\"/opt\", \"$fg[cyan]/opt$reset_color\"); \
           sub(\"/sbin\", \"$fg[magenta]/sbin$reset_color\"); \
           sub(\"/local\", \"$fg[yellow]/local$reset_color\"); \
           sub(\"/.rvm\", \"$fg[red]/.rvm$reset_color\"); \
           print }"
}

# }}}

[[ -e ~/.zshrc.local ]] && . ~/.zshrc.local
