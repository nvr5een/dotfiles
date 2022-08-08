# $ZSH_CONFIG/aliases.zsh

alias :q='exit'
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

alias ga='git add'
alias gb='git branch'
alias gcm='git commit -v -m'
alias gco='git checkout'
alias gcl='git clone'
alias gd='git diff'
alias gmv='git mv -v'
alias grm='git rm'
alias gs='git status'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

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

if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
  alias k='kubectl'
fi

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

