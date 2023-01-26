-- recommendation from nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

require('galbie')

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

map("n", "<SPACE>", "<Nop>")
map("i", "<C-c>", "<Esc>")

-- Resize current pane
map("n", "<Leader>=", ":vertical resize +5<CR>")
map("n", "<Leader>-", ":vertical resize -5<CR>")
map("n", "<Leader>rp", ":resize 100<CR>")

-- system yoink
map("n", "<Leader>y", "+y")
map("v", "<Leader>y", "+y")
map("n", "<Leader>Y", "gg\"+yG")

-- changeword remap
map("n", "<Leader>cn", "*''cgn")
map("n", "<Leader>cN", "*''cgn")

-- Make Y behave as same as D
map("n", "Y", "y$")

-- Keep it center (THE_PRIMEAGEN)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ'z")

-- no more entire breaks
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', '!', '!<c-g>u')
map('i', '?', '?<c-g>u')
map('i', '}', '}<c-g>u')
map('i', ']', ']<c-g>u')
map('i', '}', '}<c-g>u')
map('i', ';', ';<c-g>u')
map('i', ':', ':<c-g>u')
map('i', '&', '&<c-g>u')

-- no more nvim doesn't understand how to QUIT
map('c', 'WQ', 'wq')
map('c', 'Wq', 'wq')
map('c', 'W', 'w')
map('c', 'Q', 'q')

-- yeet into null
map('n', '<Leader>d', '"_d')
map('v', '<Leader>d', '"_d')

-- joink them things
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '>-2<CR>gv=gv")
map('i', '<C-j>', ":m .+1<CR>==")
map('i', '<C-k>', ":m .-2<CR>==")

-- yeet the registers
-- map('n', '<Leader>cr', )

map('n', '<Leader>pwd', ':lcd%:p:h <CR>')
