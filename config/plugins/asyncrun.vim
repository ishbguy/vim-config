" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

let g:asyncrun_open = 6
let g:asyncrun_bell = 1
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']

if &filetype ==? 'c' || &filetype ==? 'cpp'
    nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <CR>
    nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>
    nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <CR>
    nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <CR>
    nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <CR>
    nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <CR>
endif

nnoremap <F10> :call asyncrun#quickfix_toggle(6)<CR>

" vim:set ft=vim ts=4 sw=4:
