" Use the Solarized Dark theme
set background=dark
colorscheme solarized
if !has('gui_running')
  let g:solarized_termtrans=1
  let g:solarized_termcolors=256
endif

" Make Vim more useful
set nocompatible
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
"Sensible defaults by tpope"
set autoindent
set complete-=i
set nrformats-=octal
set ttimeout
set ttimeoutlen=100
set autoread
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options
if &history < 1000
  set history=1000
endif
" Search upwards for tags file instead of only locally
if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set undofile

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
" Convert tabs to spaces
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>
" Remap leader space to unhighlight searches
nnoremap <Leader><Space> :noh<CR>
" Enable file type detection
filetype plugin indent on
" Y yanks from the cursor to the end of line as expected
nnoremap Y y$
" Wrap lines by default
set wrap linebreak
set showbreak=" "
" Allow easy navigation between wrapped lines
nnoremap j gj
nnoremap k gk
" Disable annoying beeps on errors
set noerrorbells
set visualbell
" Don't ignore case when search has capital letter (although also don't ignore case by default).
set smartcase
" Easier esc in insert mode
inoremap jk <Esc>
inoremap kj <Esc>
inoremap kk <Esc>
inoremap jj <Esc>
" Select all
nnoremap <Leader>a ggVG
" Map backspace to kill previous word
inoremap <BS> <C-W>
" hide toolbar
if has("gui_running")
  set guioptions=egmrt
endif
" Don’t show the intro message when starting Vim
set shortmess=atI
" Reselect lines were juste pasted
nnoremap <leader>v V`]
" Save on lost focus
autocmd BufLeave,FocusLost * silent! :wa
" Open splits right and below"
set splitbelow
set splitright
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Search wraps around EOF
set wrapscan
" Deal with fish shell
if &shell =~# 'fish$'
  set shell=/bin/bash
endif
" Always load matchit
if !exists('g:loaded_matchit')
  runtime macros/matchit.vim
endif
" Parse *.md files as Markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Indent Python files:
autocmd BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79

" Plugins with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-expand-region'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'pangloss/vim-javascript'
Plug 'terryma/vim-multiple-cursors'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'vim-scripts/indentpython.vim'
Plug 'digitaltoad/vim-pug'
Plug 'mbbill/undotree'
Plug 'w0rp/ale'
call plug#end()

"fzf
nmap ; :Buffers<CR>
nmap <leader>t :Files<CR>
nmap <leader>r :Tags<CR>
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow -g "!{.git,node_modules}/*" 2>/dev/null'
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

"JSX
let g:jsx_ext_required = 0
