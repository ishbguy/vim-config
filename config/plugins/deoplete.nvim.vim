" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

function! s:my_cr_function()
    if pumvisible()
        call UltiSnips#ExpandSnippetOrJump()
        return "\<C-Y>"
    else
        return "\<CR>"
    endif
endfunction
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>

"" <TAB>: completion.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" vim:set ft=vim ts=4 sw=4:
