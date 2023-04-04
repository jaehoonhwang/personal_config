local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
  sources = {
    -- Diagnostic
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.diagnostics.fish,
    -- Formatter
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.prettier,
  }
})
