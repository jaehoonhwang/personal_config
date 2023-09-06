-- recommendation from nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "

vim.cmd [[
  set completeopt=menuone,noinsert,noselect
  highlight! default link CmpItemKind CmpItemMenuDefault
]]

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

-- yeet the registers
-- map('n', '<Leader>cr', )

map('n', '<Leader>pwd', ':cd %:p:h <CR>')
map('n', '<Leader>cwd', ':cd %:h <CR>')

map("n", "<Leader>fc", ":lua vim.lsp.buf.format()<CR>")
map("n", "<SPACE>", "<Nop>")

-- Buffer next
map("n", "<Leader>bp", ":bprevious<CR>")
map("n", "<Leader>bn", ":bnext<CR>")
