" ~/.config/nvim/init.vim

" Plugins {{{

let s:minpac_dir = '~/.config/nvim/pack/minpac/opt/minpac'
if has('vim_starting')
  if empty(glob(s:minpac_dir))
    echo "Installing minpac ..."
    execute '!git clone --depth 1 https://github.com/k-takata/minpac ' . s:minpac_dir
    autocmd VimEnter * source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
  endif
endif

packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('joereynolds/vim-minisnip')
call minpac#add('chase/vim-ansible-yaml')
call minpac#add('ekalinin/Dockerfile.vim')

" Plugin settings
let g:minisnip_dir = '~/.config/nvim/minisnip'
let g:markdown_folding = 1

" Plugin management commands
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" }}}
" Options {{{

set clipboard^=unnamed,unnamedplus " use system clipboard
set hidden " allow hiding buffers with unsaved changes
set history=1000 " keep 1000 lines of command line history
set lazyredraw " do not redraw screen while executing macros (performance)
set modelines=0 " do not check modelines for commands (security)
set omnifunc=syntaxcomplete#Complete " enable autocompletion
set pastetoggle=<F2>
set path=.,** " search directory tree relative to directory of current file
set timeoutlen=500 " milliseconds waited for mapped sequence to complete
set updatetime=100 " time waited after typing before updating signs (gitgutter)

" Cursor
set cpoptions+=$ " put a '$' at end of text being changed in current line
set cursorline " highlight cursorline
set scrolloff=5 " minimum number of lines kept above and below cursor
set showmatch " highlight matching brackets
set virtualedit=block " allow cursor to go anywhere in visual block mode

" Line numbers
set number " show line numbers
set relativenumber " enable vertical motion commands (e.g. j k + -)

" Formatting
set colorcolumn=+1 " highlight column set by 'textwidth' +1
set expandtab " use spaces when inserting tabs
set shiftwidth=2 " number of spaces to use for each (auto)indent
set softtabstop=-1 " use shiftwidth value for tab and backspace
set textwidth=80 " wrap text at 80 characters

" Invisible characters
set listchars=tab:>\ ,eol:¬,extends:>,precedes:<,nbsp:+
set showbreak=↪  " string put at beginning of wrapped lines

" Searching
set ignorecase " ignore case in search patterns
set smartcase " search is case-sensitive when pattern contains capital letters

" Backups
set backup
set backupdir=~/.local/share/nvim/backup
set noswapfile
set undofile " save undo history

" Wildmenu
set wildcharm=<C-z> " used in mappings to invoke completion
set wildignorecase " ignore case when completing file names and directories
set wildignore+=*.git,*.DS_Store
set wildignore+=*.bmp,*.gif,*.jp*,*.png
set wildignore+=*.gz,*.rar,*.zip

" Statusline
set statusline= " begin left align
set statusline+=%{GitForStatusline()}
set statusline+=%{PasteForStatusline()}
set statusline+=\ %F " file path
set statusline+=%m " modified?
set statusline+=%r " read only?
set statusline+=%= " begin right align
set statusline+=\ %y " file type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ %{&fileformat}
set statusline+=\ [%p%% " percentage through file
set statusline+=\ %l:%c] " line:column

colorscheme sourcerer

" }}}
" Mappings {{{

let mapleader="\<Space>"

" Remap 'esc' and 'ctrl-c'
inoremap jk <Esc>
cnoremap jk <C-c>

" Format highlighted text with 'Q'
nnoremap Q gqap
vnoremap Q gq

" Yank to end of line
noremap Y y$

" Manage buffers and files
nnoremap <leader><Space> :e#<CR>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>e :e <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>
nnoremap <leader>f :find *
nnoremap <leader>g :vim<Space>

" Circular window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" Close all but current fold
nnoremap <leader>z zMzvzz

" Navigate wrapped lines with 'relativenumber' set
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Replace all occurrences of word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Clear search highlighting with 'ctrl-l'
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Edit my notes
if !empty(glob('~/projects/private/notes'))
  nnoremap <leader>n :e ~/projects/private/notes/
endif

" Edit and source vimrc
nnoremap <silent> <leader>v :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" }}}
" Functions {{{

function! GitBranch() abort
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitForStatusline() abort
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'['.l:branchname.']':''
endfunction

function! PasteForStatusline() abort
  let l:paste_status=&paste
  if l:paste_status == 1
    return '[paste]'
  else
    return ''
  endif
endfunction

function! StripWhitespace() abort
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
nnoremap <leader>sw :call StripWhitespace()<CR>

" https://github.com/vim/vim/issues/4738#issuecomment-714609892
if has('linux')
  function! OpenURLUnderCursor()
    let s:uri = matchstr(getline('.'), '[a-z]*:\/\/[^ >,;()]*')
    let s:uri = shellescape(s:uri, 1)
    if s:uri != ''
      silent exec "!xdg-open '".s:uri."'"
      :redraw!
    endif
  endfunction
  nnoremap gx :call OpenURLUnderCursor()<CR>
endif

" }}}
" Autocommands {{{

augroup general
  autocmd!
  autocmd BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
  autocmd VimResized * :wincmd =
  autocmd BufNewFile,BufReadPost *.md set ft=markdown
  autocmd BufNewFile,BufReadPost *hosts*,*.yml set ft=ansible
  autocmd BufNewFile,BufReadPost Vagrantfile set ft=ruby
  autocmd BufNewFile,BufReadPost *vifmrc*,*.vifm set ft=vim
  autocmd FileType css,less,scss,javascript,java
        \ setlocal foldmethod=marker foldmarker={,}
  autocmd Filetype sh,vim,zsh setlocal foldmethod=marker
  autocmd Filetype python setlocal foldmethod=indent tabstop=4
augroup END

" Restore last cursor position when reopening files
augroup cursor_position
  autocmd!
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
augroup END

" Automatically open quickfix window after 'grep', etc.
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
augroup END

" }}}
