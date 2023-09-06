require("lspsaga").setup({
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({})
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",    -- optional
    'nvim-treesitter/nvim-treesitter' -- optional
  }
})

-- RANT ON
-- Thought hover_doc() was suppose to focus on the floating window so that I could
-- scroll up and down, but it turns out that you need to press the hover_doc
-- twice in order go INTO the floating window. That's a time wasted.
-- Also, it doesn't have anything to do with nvim-cmp since it works fine.
-- RANT OFF

local opts = { noremap = false, silent = true }
vim.keymap.set('n', '<leader>vd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>vsd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>vsw', '<Cmd>Lspsaga show_workspace_diagnostics<CR>', opts)
vim.keymap.set('n', '<leader>vh', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<leader>vf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', '<leader>vca', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('n', '<leader>vsk', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', '<leader>vsj', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>vpd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>vrn', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', '<leader>vol', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', '<leader>vic', '<Cmd>Lspsaga incoming_calls<CR>', opts)
vim.keymap.set('n', '<leader>voc', '<Cmd>Lspsaga outcoming_calls<CR>', opts)
vim.keymap.set('n', '<leader>tt', '<cmd>Lspsaga term_toggle<CR>', opts)
