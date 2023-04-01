require("lspsaga").setup({
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>vd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>vsd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>vhd', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>vf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', '<leader>vca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>vsk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<leader>vsj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>vpd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>vrn', '<Cmd>Lspsaga rename<CR>', opts)
