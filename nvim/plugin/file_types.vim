filetype plugin indent on
"
" HTML, XML, Jinja
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>

" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype cpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype hpp setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype c setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype h setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype cxx setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype hxx setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype ts setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype js setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype rs setlocal omnifunc=v:lua.vim.lsp.omnifunc
