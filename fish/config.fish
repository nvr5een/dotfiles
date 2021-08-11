# ~/.config/fish/config.fish

set fish_color_command brgreen
set fish_color_comment brblack
set fish_color_end green
set fish_color_error brred
set fish_color_escape cyan
set fish_color_operator cyan
set fish_color_param brblue
set fish_color_quote yellow
set fish_color_redirection blue

function :q; exit; end
function gs; git status; end
function pro; cd ~/projects; end

function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
  for mode in default insert visual
    fish_default_key_bindings -M $mode
  end
  fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings

function vim_esc_remap --description "Remap 'ESC' to 'jk' for Vi-style bindings"
  if commandline -P
    commandline -f cancel
  else
    set fish_bind_mode default
    commandline -f backward-char force-repaint
  end
end
bind -M insert jk vim_esc_remap

set -g __fish_git_prompt_showdirtystate
set -g __fish_git_prompt_showuntrackedfiles

set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_color blue
set -g __fish_git_prompt_color_branch normal

set -g __fish_git_prompt_char_dirtystate '*'
set -g __fish_git_prompt_char_invalidstate '#'
set -g __fish_git_prompt_char_stagedstate '+'
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_invalidstate yellow
set -g __fish_git_prompt_color_stagedstate green

set -g __fish_git_prompt_char_untrackedfiles '%'
set -g __fish_git_prompt_color_untrackedfiles yellow

function fish_prompt

  set_color blue
  printf '%s' (prompt_pwd)
  printf '%s' (__fish_git_prompt)

  if test -z (string match -ri '^no|false|0$')
    switch $fish_bind_mode
      case default
        printf '\e[2 q'
        printf '$ '
      case insert
        printf '\e[6 q'
        printf '$ '
      case replace_one
        printf '\e[4 q'
        printf '$ '
      case visual
        printf '\e[2 q'
        printf '$ '
      case '*'
        printf '\e[2 q'
        printf '$ '
    end
  end

end

