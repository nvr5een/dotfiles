" ~/.config/nvim/init.vim

" Plugins {{{
let s:minpac_dir = '~/.config/nvim/pack/minpac/opt/minpac'
if has('vim_starting')
  if empty(glob(s:minpac_dir))
    echo "Installing minpac ..."
    execute '!git clone --depth 1 https://github.com/k-takata/minpac ' . s:minpac_dir
    autocmd VimEnter * source $MYVIMRC | call PackInit() |
          \ call minpac#update('', {'do': 'call minpac#status()'})
  endif
endif

function! PackInit() abort
  packadd minpac
    
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  " Utilities
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('joereynolds/vim-minisnip')
  " Syntax
  call minpac#add('pearofducks/ansible-vim')
  call minpac#add('ekalinin/Dockerfile.vim')
  call minpac#add('gabrielelana/vim-markdown')
  call minpac#add('vim-python/python-syntax')
endfunction

" Plugin settings
let g:ansible_attribute_highlight = "ab"
let g:ansible_extra_keywords_highlight = 1
let g:markdown_enable_folding = 1 " performace hit
let g:markdown_enable_spell_checking = 0
let g:minisnip_dir = '~/.config/nvim/minisnip'
let g:python_highlight_all = 1
let g:python_highlight_file_headers_as_comments = 1

" Define user commands for updating/cleaning plugins
command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" }}}
" Settings {{{
set backup
set backupdir=~/.local/share/nvim/backup
set clipboard^=unnamed,unnamedplus
set colorcolumn=+1
set cpoptions+=$
set cursorline
set expandtab
set hidden
set history=1000
set ignorecase
set lazyredraw
set listchars=tab:>\ ,eol:¬,extends:>,precedes:<,nbsp:+
set modelines=0
set number
set omnifunc=syntaxcomplete#Complete
set pastetoggle=<F2>
set path=.,**
set relativenumber
set scrolloff=5
set shiftwidth=2
set showbreak=↪ 
set showmatch
set smartcase
set softtabstop=-1
set noswapfile
set textwidth=80
set timeoutlen=500
set undofile
set updatetime=100
set virtualedit=all
set wildcharm=<C-z>
set wildignorecase

set wildignore+=*.git,*.DS_Store
set wildignore+=*.bmp,*.gif,*.jp*,*.png
set wildignore+=*.gz,*.rar,*.zip

" }}}
" Statusline {{{
set statusline= " begin left align
set statusline+=%{StatuslinePaste()}
set statusline+=\ %F " file path
set statusline+=%m " modified?
set statusline+=%r " read only?
set statusline+=%= " begin right align
set statusline+=\ %y " file type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ %{&fileformat}
set statusline+=\ [%p%% " percentage through file
set statusline+=\ %l:%c] " line:column

" }}}
" Mappings {{{
let mapleader="\<Space>"

" Remap escape
inoremap jk <Esc>

" Yank to end of line
noremap Y y$

" https://www.vi-improved.org/recommendations/
" https://stackoverflow.com/questions/16082991/vim-switching-between-files-rapidly-using-vanilla-vim-no-plugins
nnoremap <leader><Space> :e#<CR>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>e :e <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>
nnoremap <leader>f :find *
nnoremap <leader>g :vim<Space>
nnoremap <leader>s :call StripWhitespace()<CR>

" Close all but current fold
nnoremap <leader>z zMzvzz

" Replace all occurrences of word under cursor
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" Circular window navigation
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" Navigate wrapped lines with 'relativenumber' set
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Text formatting
nnoremap Q gqap
vnoremap Q gq

" Edit private notes
if !empty(glob('~/projects/private/notes'))
  nnoremap <leader>n :e ~/projects/private/notes/
endif

" Clear search highlighting with 'ctrl-l'
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" }}}
" Functions {{{
function! StatuslinePaste() abort
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

" }}}
" Autocommands {{{
augroup nvimStartup
  autocmd!
  autocmd BufNewFile,BufReadPost Vagrantfile set ft=ruby
  autocmd Filetype sh,vim,zsh setlocal foldmethod=marker
  " Resize splits when the window is resized
  autocmd VimResized * :wincmd =
  " When editing a file, always jump to the last known cursor position.
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
  " Automatic location/quickfix window
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
  autocmd VimEnter * cwindow
augroup END

" }}}

colorscheme sourcerer

