" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? 'evim'
    finish
endif

" for version control, use vimrc in $HOME/.vim instead of .vimrc in $HOME
let $vim_home = fnamemodify($MYVIMRC, ':h')
let $vim_config_dir = $vim_home . '/config'
let $vim_plugins_config_dir =  $vim_config_dir . '/plugins'
let $vim_plugins_dir = '/samba/project/vim-plugins'

runtime! lib/mylib.vim
runtime! lib/man.vim

source $vim_config_dir/options.vim
source $vim_config_dir/keymap.vim
source $vim_plugins_config_dir/vim-plug.vim

" }}}


" vim:set ft=vim ts=4 sw=4:
