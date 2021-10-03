""" Optixal's Neovim Init.vim (modified)

""" Vim-Plug
call plug#begin()

" Aesthetics - Main
"" Airline make bottom bar looks nice
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"" Make NerdTreee file look nice
Plug 'ryanoasis/vim-devicons'
"" Distraction free setting
Plug 'junegunn/goyo.vim'
"" Color scheme
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'

" Functionalities
"" git
Plug 'tpope/vim-fugitive'
"" super nocompatible
Plug 'tpope/vim-sensible'
"" auto surrounds for things
Plug 'tpope/vim-surround'
"" tagbar
Plug 'majutsushi/tagbar'
"" tree file structures
Plug 'scrooloose/nerdtree'
"" comment
Plug 'scrooloose/nerdcommenter'
"" More stuff
Plug 'jiangmiao/auto-pairs'
"" HTML close tag
Plug 'alvan/vim-closetag'
"" indent line
Plug 'Yggdroot/indentLine'
"" Syntax highlighting
Plug 'sheerun/vim-polyglot'
"" tab for auto complete
Plug 'ervandew/supertab'
"" boilerplate for codes
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"" bullet stuff
Plug 'dkarter/bullets.vim'
"""
Plug 'mbbill/undotree'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-treesitter/nvim-treesitter'

" Langauge Server for your definition needs
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

call plug#end()

""" Python3 VirtualEnv
let g:python3_host_prog = expand('~/.config/nvim/env/bin/python')

syntax on
set bg=dark
let g:gruvbox_dark_contrast="hard"
autocmd vimenter * ++nested colorscheme gruvbox
colorscheme gruvbox

lua require('galbie')

""" Custom Mappings
let mapleader=" "

" Leader mapping
nnoremap <SPACE> <Nop>
nmap <leader>w :TagbarToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>g :Goyo<CR>

nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nmap \ :NERDTreeToggle<CR>

"" system yoink
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

""changeword remap
nnoremap <leader>cn *''cgn
nnoremap <leader>cN *''cgn

imap <C-c> <Esc>
" Make Y behave as same as D
nnoremap Y y$

" Keep it center (THE_PRIMEAGEN)
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

"no more entire breaks
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap } }<c-g>u
inoremap ] ]<c-g>u
inoremap } }<c-g>u
inoremap ; ;<c-g>u
inoremap : :<c-g>u
inoremap & &<c-g>u

" jumplist
nnoremap <expr>k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr>j (v:count > 5 ? "m'" . v:count : "") . 'j'

" yeet into null registry
noremap <leader>d "_d
vnoremap <leader>d "_d

"joink
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre lua Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    " autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
