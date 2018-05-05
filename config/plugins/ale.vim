" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.
" ----- ALE ------------------------------ {{{

"let g:ale_sign_column_always = 1
let g:ale_sign_error = 'E!'
let g:ale_sign_warning = 'W!'
let g:ale_statusline_format = ['X %d', '! %d', 'O ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%][%severity%] %s'

"let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%][%severity%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
            \ 'perl' : 'all',
            \}
let g:ale_perl_perl_options = '-c -Mwarnings -Ilib -I../lib -It/lib -I../t/lib'
let g:ale_perl_perlcritic_showrules = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c11'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" }}}

" ----- ALE ------------------------------ {{{

nmap <silent> <Leader>p <Plug>(ale_previous_wrap)
nmap <silent> <Leader>n <Plug>(ale_next_wrap)
nmap <silent> <Leader>d :ALEDetail<CR>

" }}}

" vim:set ft=vim ts=4 sw=4:
