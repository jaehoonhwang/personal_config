local nvim_tree = require('nvim-tree')

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', 'Y', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'e', api.tree.expand_all, opts('Expand All'))
end

local function key_map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  update_focused_file = {
    enable = true,
  },
  respect_buf_cwd = true,
  on_attach = my_on_attach,

})

-- nvim_tree maps
key_map("n", "\\", ":NvimTreeToggle<CR>")
key_map("n", "<Leader>nt", ":NvimTreeToggle<CR>")
key_map("n", "<Leader>nf", ":NvimTreeFindFile<CR>")
