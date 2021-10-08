""telescope
nnoremap <C-p> <CMD>Telescope find_files<CR>
nnoremap <leader>ts :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>tg :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>tf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>tb :lua require('telescope.builtin').buffers()<CR>

nnoremap <leader>tvh :lua require('telescope.builtin').help_tags()<CR>
