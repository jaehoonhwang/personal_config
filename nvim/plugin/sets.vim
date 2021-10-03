set encoding=utf-8

" Set tabs
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent

" Search
set incsearch nohlsearch

" Show Ruler
set ruler laststatus=2 showcmd showmode
set nowrap

set number
set title
set relativenumber
set rnu
set exrc
set hidden
set noerrorbells

" Appearance
set termguicolors
set signcolumn=yes
set list listchars=trail:»,tab:»-
set scrolloff=8
set colorcolumn=80

" Stop using swap files and no backup; everythign should be stored @ undodir
set nobackup
set noswapfile
set undodir=~/.vim/undodir
set undofile

"Lsp Config
set completeopt=menuone,noinsert,noselect
set shortmess+=c
