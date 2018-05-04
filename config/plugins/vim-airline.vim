" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" config file for airline

" ----- airline settings ------------------------------ {{{

let g:airline_left_sep      = ''
let g:airline_left_alt_sep  = ''
let g:airline_right_sep     = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols       = {
            \ 'branch'     : '*',
            \ 'crypt'      : '#',
            \ 'linenr'     : '' ,
            \ 'maxlinenr'  : '' ,
            \ 'modified'   : '+',
            \ 'notexists'  : '!',
            \ 'paste'      : '&',
            \ 'readonly'   : 'O',
            \ 'space'      : ' ',
            \ 'spell'      : '$',
            \ 'whitespace' : '' ,
            \ 'ellipsis'   : '@'
            \ }
let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ }
let g:airline#extensions#default#layout = [
            \ [ 'a', 'b', 'c', 'error', 'warning'],
            \ [ 'x', 'y', 'z']
            \ ]
let g:airline_skip_empty_sections = 1
let g:airline#extensions#quickfix#quickfix_text = 'Qfx'
let g:airline#extensions#quickfix#location_text = 'Loc'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ['git', 'mercurial']
let g:airline#extensions#branch#use_vcscommand = 0
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#symbol = ''
let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#max_lines = 10000
let g:airline#extensions#whitespace#trailing_format = 'T[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'M[%s]'
let g:airline#extensions#whitespace#long_format = 'L[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'MF[%s]'
let g:airline#extensions#c_like_langs = ['c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#tabs_label = 'T'
let g:airline#extensions#tabline#buffer_idx_mode = 1

"airline-theme
if has('gui_running') || $DISPLAY !=# ':0.0'
    set guifont=Droid\ Sans\ Mono\ 10
    colorscheme solarized
else
    colorscheme desert
endif

" }}}

" ----- airline ------------------------------ {{{

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>, <Plug>AirlineSelectPrevTab
nmap <leader>. <Plug>AirlineSelectNextTab

" }}}

" vim:set ft=vim ts=4 sw=4:
