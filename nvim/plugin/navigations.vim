"" QuickFix
nnoremap <c-q> :call ToggleQFList(1)<cr>
nnoremap <C-k> :cprev<CR>zz
nnoremap <C-j> :cnext<CR>zz

"" LocalList
nnoremap <leader>q :call ToggleQFList(0)<cr>
nnoremap <leader>k :lprev<CR>zz
nnoremap <leader>j :lnext<CR>zz

nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun
