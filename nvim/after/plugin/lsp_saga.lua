local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>vsd', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>vhd', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>vf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', '<leader>vsh', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', '<leader>vpd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>vrn', '<Cmd>Lspsaga rename<CR>', opts)
