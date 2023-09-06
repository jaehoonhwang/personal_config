local nvim_lsp = require("lspconfig")
local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })

local servers = {
  pylsp = {},
  tailwindcss = {},
  cssls = {},
  astro = {},
  eslint = {},
  rust_analyzer = {},
  gopls = {},
  html = {},
  jsonls = {},
  tsserver = require('lsp-config.tsserver'),
  lua_ls = require('lsp-config.lua_ls'),
}

-- TODO(jaehoonh): https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#add-parentheses-after-selecting-function-or-method-item
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- luasnip
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-f>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    -- working as intended
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    -- working as intended
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    -- working as intended
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    {
      { name = 'buffer' },
    },
  }),
  formatting = {
    format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
  }
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format(
        {
          bufnr = bufnr,
          formatting_options = { tabSize = 2, insertSpaces = true },
        })
    end,
  })
end


local on_attach = function(client, bufnr)
  enable_format_on_save(client, bufnr)
end

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Install Mason first.
mason.setup({})
mason_lspconfig.setup {
  ensure_installed = { "tailwindcss", "angularls", "astro", "clangd", "cssls",
    "dockerls", "eslint", "html", "jsonls", "jdtls", "tsserver", "ltex",
    "marksman", "jedi_language_server", "rust_analyzer", "yamlls" },
  automatic_installation = false, -- set this as true, for the first time.
}

-- Install servers; ensure that it's after Mason according to its documentation.
for name, user_options in pairs(servers) do
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  options = vim.tbl_deep_extend('force', options, user_options)
  nvim_lsp[name].setup(options)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
  }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for t, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. t
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})

vim.cmd [[
set completeopt=menuone,noinsert,noselect
highlight! default link CmpItemKind CmpItemMenuDefault
]]
