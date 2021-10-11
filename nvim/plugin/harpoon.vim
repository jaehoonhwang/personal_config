nnoremap <leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <F1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <F2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <F3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <F4> :lua require("harpoon.ui").nav_file(4)<CR>
