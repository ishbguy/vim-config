" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

" let g:ycm_confirm_extra_conf = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings= 1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

" noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ 'c':1,
            \ 'cpp':1,
            \ 'objc':1,
            \ }


" vim:set ft=vim ts=4 sw=4:
