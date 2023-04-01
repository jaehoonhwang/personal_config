local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({})

lspconfig.setup {
  ensure_installed = { "sumneko_lua", "tailwindcss", "astro", "clangd", "cssls",
  "dockerls", "eslint", "gopls", "html", "jsonls", "jdtls", "tsserver", "ltex",
  "marksman", "jedi_language_server", "yamlls"},
  automatic_installation = true,
}
