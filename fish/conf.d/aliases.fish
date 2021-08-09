# ~/.config/fish/conf.d/aliases.fish

alias :q='exit'
alias pro='cd ~/projects'

alias grep='grep --color=auto'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias df='df -h'
alias du='du -ch'
alias mkdir='mkdir -pv'
alias mount='mount | column -t'

alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias cp='cp -iv'
alias ln='ln -iv'
alias mv='mv -iv'
alias rm='rm -Iv'

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

if type -p apt-get &>/dev/null
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
end

if type -p pacman &>/dev/null
  if type -p yay &>/dev/null
    alias paci='yay -S'
    alias pacu='yay -Syu'
    alias pacs='yay -Ss'
    alias pacq='yay -Si'
  else
    alias paci='sudo pacman -S'
    alias pacu='sudo pacman -Syu'
    alias pacs='pacman -Ss'
    alias pacq='pacman -Si'
  end
  alias pacr='sudo pacman -R'
  alias pacrr='sudo pacman -Rns'
  alias pacro='pacman -Qtdq | sudo pacman -Rns -'
  alias pacli='pacman -Q | less'
  alias pacll='pacman -Qqm'
  alias pacf='pacman -Ql'
  alias pacc='sudo pacman -Sc'
  alias pacm='makepkg -fsic'
  alias pacstat='pacman -Q | wc -l'
end

