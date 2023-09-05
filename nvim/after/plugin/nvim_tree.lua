vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    --adaptive_size = true,
    --mappings = {
    --list = {
    --{ key = "u", action = "dir_up" },
    --},
    --},
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  respect_buf_cwd = true,
})

-- nvim_tree maps
map("n", "\\", ":NvimTreeToggle<CR>")
map("n", "<Leader>nt", ":NvimTreeToggle<CR>")
map("n", "<Leader>nf", ":NvimTreeFindFile<CR>")
