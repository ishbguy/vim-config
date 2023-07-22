" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

"Set the hotkey leader
let g:mapleader = "\<Space>"

" ----- General ------------------------------ {{{

nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>
nmap <Leader>W :w<CR>
nmap <Leader>w :w<CR>

nmap <Space><Space>  <C-F>
vmap <Space><Space>  <C-F>
nmap <Leader>m  :<C-U>exe 'Man '.expand(v:count).' '. expand("<cword>")<CR>
" imap <Leader>D  <C-R>=strftime("%Y-%m-%d %H:%M:%S %z")<CR>
nmap Y          y$
nmap <Leader>x  ddp
nmap <Leader>N  :nohlsearch<CR>
nmap <F1>       :<C-U>call MyHelp(v:count)<CR>
nmap <F4>       :call MyToggleMouse()<CR>
nmap <F11>      :call ToggleFullscreen()<CR>

" Don't use Ex mode, use Q for formatting
map Q gqip

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U>  <C-G>u<C-U>

"Let the current line to the higher of screen
nmap <C-H>      zz<C-D>

" }}}

" ----- Window operations ------------------------------ {{{

"Windows navigate
nmap <Leader>wh <C-W>h
nmap <Leader>wj <C-W>j
nmap <Leader>wk <C-W>k
nmap <Leader>wl <C-W>l

"Go to preview/next windows
nmap <Leader>wp <C-W>p
nmap <Leader>ww <C-W>w
nmap <s-tab>    <C-w>p
nmap <tab>      <C-w>w

"Exchange with next windows
nmap <Leader>wx <C-W>x

"Close/only the current window
nmap <Leader>wc <C-W>c
nmap <Leader>c  :close<CR>
nmap <Leader>wo <C-W>o
nmap <Leader>o  :only<CR>

"Close preview window
nmap <Leader>wz <C-W>z

"New windows
nmap <Leader>wn <C-W>n
nmap <Leader>v  :vertical split

" window resize
nmap -          <C-W>-
nmap +          <C-W>+
nmap [B         <C-W>-
nmap [A         <C-W>+
nmap <C-Down>   <C-W>-
nmap <C-Up>     <C-W>+
nmap [D         <C-W><
nmap [C         <C-W>>
nmap <C-Right>  <C-W><
nmap <C-Left>   <C-W>>

" }}}

" ----- Tag operations ------------------------------ {{{

nmap <CR>       <C-]>
nmap <BS>       <C-t>
nmap <Leader>tp :tprevious<CR>
nmap <Leader>tn :tnext<CR>

" }}}

" ----- Quickfix ------------------------------ {{{

nmap <Leader>cp :cp<CR>
nmap <Leader>cn :cn<CR>

" }}}

" vim:set ft=vim ts=4 sw=4:
