-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "<SPACE>", "<Nop>")

map("n", "<Leader>vi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader>vd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>vs", ":lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Leader>vr", ":lua vim.lsp.buf.references()<CR>")
map("n", "<Leader>vh", ":lua vim.lsp.buf.hover()<CR>")

map("n", "<Leader>vn", ":lua vim.diagnostic.goto_next()<CR>")

map("n", "<Leader>fc", ":Neoformat<CR>")
