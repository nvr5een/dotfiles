" ~/.config/nvim/init.vim

let s:minpac_dir = '~/.config/nvim/pack/minpac/opt/minpac'
if has('vim_starting')
  if empty(glob(s:minpac_dir))
    echo "Installing minpac ..."
    execute '!git clone --depth 1 https://github.com/k-takata/minpac ' . s:minpac_dir
    autocmd VimEnter * source $MYVIMRC | call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
  endif
endif

function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('airblade/vim-gitgutter')
  call minpac#add('justinmk/vim-dirvish')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('dag/vim-fish')
endfunction

command! PackUpdate source $MYVIMRC | call PackInit() | call minpac#update()
command! PackClean  source $MYVIMRC | call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

set hidden
set clipboard^=unnamed,unnamedplus
set cursorline
set scrolloff=5
set showmatch
set cpoptions+=$
set virtualedit=all
set number
set expandtab
set shiftwidth=2
set softtabstop=-1
set ignorecase
set smartcase
set backup
set backupdir=~/.local/share/nvim/backup
set noswapfile
set undofile
set modelines=0
set updatetime=100
set path=.,**
set wildcharm=<C-z>
set wildignorecase

set wildignore+=*.git,*.DS_Store
set wildignore+=*.bmp,*.gif,*.jp*,*.png
set wildignore+=*.gz,*.rar,*.zip

set statusline=
set statusline+=\%F
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ %{&fileformat}
set statusline+=\ [%p%%
set statusline+=\ %l:%c]

let mapleader="\<Space>"

nnoremap <leader><Space> :e#<CR>
nnoremap <leader>b :buffer <C-z><S-Tab>
nnoremap <leader>e :e <C-r>=fnameescape(expand('%:p:h'))<CR>/*<C-d>
nnoremap <leader>f :find *
nnoremap <leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <leader>s :call StripWhitespace()<CR>
inoremap jk <Esc>
nnoremap Y y$

nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

set relativenumber
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if !empty(glob('~/projects/private/notes'))
  nnoremap <leader>n :e ~/projects/private/notes/
endif

function! StripWhitespace() abort
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

augroup vimStartup
  autocmd!
  autocmd Filetype python setlocal foldmethod=indent tabstop=4
  autocmd Filetype markdown,text setlocal colorcolumn=+1 textwidth=80
  autocmd VimResized * :wincmd =
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
  autocmd VimEnter * cwindow
augroup END

colorscheme sourcerer

