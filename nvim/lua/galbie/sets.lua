local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.opt.encoding = 'utf-8'

-- Set tab options.
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- use spaces instead of tab.
vim.opt.smarttab = true
vim.opt.autoindent = true

-- Search
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Show ruler
vim.opt.ruler = true
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.showmode = true

-- Show line number
vim.opt.number = true
vim.opt.title = true
-- absolute position on the line else relative.
vim.opt.relativenumber = true
vim.opt.rnu = true -- relative line number.
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.errorbells = false

-- Appearance
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars["trail"] = "»"
vim.opt.listchars["tab"] = "»-"
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

-- Stop using swap files and no backup; everythign should be stored @ undodir
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = { prefix .. "/.vim/undodir//" }
vim.opt.undofile = true

-- Lsp Config
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect' }
vim.opt.shortmess:append { c = true }
-- No Fold
vim.opt.lazyredraw = true

-- Set timeout
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 25

-- Conceal level (https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json)
vim.opt.conceallevel = 0

-- Airline configuration
vim.cmd([[
  let g:airline_powerline_fonts = 1
  let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
  let g:airline_section_warning = ''
]])
-- Supertab
vim.cmd([[
  let g:indentLine_char = '▏'
  let g:indentLine_color_gui = '#363949'
]])
-- Tagbar
vim.cmd([[
  let g:tagbar_width = 30
  let g:tagbar_iconchars = ['↠', '↡']
]])
-- Go-yo
vim.cmd([[
  let g:goyo_linernr = 1
]])
-- Show active line
vim.cmd([[
  se cursorline
]])
-- 256 colorcs
vim.cmd([[
  set t_Co=256
  set background=dark
]])
