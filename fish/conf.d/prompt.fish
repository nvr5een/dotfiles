set -g __fish_git_prompt_showdirtystate
set -g __fish_git_prompt_showuntrackedfiles

set -g __fish_git_prompt_char_stateseparator ''
set -g __fish_git_prompt_color normal
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
        echo -en "\e[2 q"
        printf '> '
      case insert
        echo -en "\e[6 q"
        printf '> '
      case replace_one
        echo -en "\e[4 q"
        printf '> '
      case visual
        echo -en "\e[2 q"
        printf '> '
      case '*'
        echo -en "\e[2 q"
        printf '> '
    end
  end

end

