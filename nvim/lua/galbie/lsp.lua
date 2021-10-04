require'lspinstall'.setup()
local cmp = require('cmp')

local function on_attach(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

local snippet = {
    expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
    end,
}
local mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true })
}

local sources = {
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'buffer' },
}

cmp.setup({
    snippet = snippet,
    mapping = mapping,
    sources = sources,
})

local function make_config()
    return {
        -- enable snippet support
        capabilities = require('cmp_nvim_lsp').update_capabilities(
            vim.lsp.protocol.make_client_capabilities()),
        -- map buffer local keybindings when the language server attaches
        on_attach = on_attach,
    }
end

local function setup_servers()
    require'lspinstall'.setup()

    -- get all installed servers
    local servers = require'lspinstall'.installed_servers()

    for _, server in pairs(servers) do
      local config = make_config()

      -- language specific config
      if server == "sourcekit" then
        config.filetypes = {"swift", "objective-c", "objective-cpp"}; -- we don't want c and cpp!
      end
      if server == "clangd" then
        config.filetypes = {"c", "cpp"}; -- we don't want objective-c and objective-cpp!
      end

      require'lspconfig'[server].setup(config)
  end
end

-- Start of lua

setup_servers()

require'lspinstall'.post_install_hook = function ()
    setup_servers()
    vim.cmd("bufdo e")
end

