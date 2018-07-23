" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? 'evim'
    finish
endif

" for version control, use vimrc in $HOME/.vim instead of .vimrc in $HOME
let $vim_home = fnamemodify($MYVIMRC, ':h')
let $vim_config_dir = $vim_home . '/config'
let $vim_plugins_config_dir =  $vim_config_dir . '/plugins'
let $vim_plugins_dir = $HOME . '/.vim-plugins'
if executable('realpath')
    let $vim_plugins_dir =
                \ systemlist('realpath ' . $vim_home . '/..')[0] . '/vim-plugins'
endif

if !isdirectory($vim_plugins_dir)
    call mkdir($vim_plugins_dir, 'p')
endif

runtime! lib/mylib.vim
runtime! lib/man.vim

source $vim_config_dir/options.vim
source $vim_config_dir/keymap.vim
source $vim_plugins_config_dir/vim-plug.vim

"airline-theme
if has('gui_running') || $DISPLAY !=# ':0.0'
    set guifont=Droid\ Sans\ Mono\ 10
    colorscheme solarized
else
    colorscheme spring-night
endif

" }}}

" vim:set ft=vim ts=4 sw=4:
