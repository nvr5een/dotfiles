set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_color brblack
set __fish_git_prompt_color_branch normal

set __fish_git_prompt_showdirtystate
set __fish_git_prompt_showuntrackedfiles

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_invalidstate '#'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_untrackedfiles '%'

set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_invalidstate brred
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_untrackedfiles yellow

set __fish_git_prompt_showupstream auto

set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind yellow

function fish_prompt
  set_color blue
  printf '%s' (prompt_pwd)
  printf '%s ' (__fish_git_prompt)
  if test -z (string match -ri '^no|false|0$')
    switch $fish_bind_mode
      case default
        set_color normal
        printf '\e[2 q'
        printf '❯ '
      case insert
        set_color normal
        printf '\e[6 q'
        printf '❯ '
      case replace_one
        set_color normal
        printf '\e[4 q'
        printf '❯ '
      case visual
        set_color normal
        printf '\e[2 q'
        printf '❯ '
      case '*'
        set_color normal
        printf '\e[2 q'
        printf '❯ '
    end
  end
end

