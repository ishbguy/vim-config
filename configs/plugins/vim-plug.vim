" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" config file for vim-plug

" ----- vim-plug ------------------------------ {{{


call plug#begin($vim_plugins_dir)

" Visaul Editor
Plug 'mhinz/vim-startify'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'rhysd/vim-color-spring-night'
Plug 'vim-airline/vim-airline', { 'config': $vim_plugins_config_dir . '/vim-airline.vim' }
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'config': $vim_plugins_config_dir . '/nerdtree.vim' }
Plug 'konfekt/fastfold'
Plug 'kshenoy/vim-signature', { 'config': $vim_plugins_config_dir . '/vim-signature.vim' }

" Useful Edited Tools
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion', { 'config': $vim_plugins_config_dir . '/vim-easymotion.vim' }
Plug 'Chiel92/vim-autoformat', { 'config': $vim_plugins_config_dir . '/vim-autoformat.vim' }
Plug 'tpope/vim-commentary'

" Completion & Syntax Checker
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips', { 'config': $vim_plugins_config_dir . '/ultisnips.vim' }

" C/C++ completion

" YCM integration
Plug 'Valloric/YouCompleteMe', {
            \ 'for': ['c', 'cpp'],
            \ 'config': $vim_plugins_config_dir . '/YouCompleteMe.vim',
            \ 'do': 'yaourt --noconfirm -S clang cmake && ./install.py --clang-completer --system-libclang',
            \ }
Plug 'rdnetto/YCM-Generator', {
            \ 'branch': 'stable',
            \ 'for': ['c', 'cpp'],
            \ }
" deoplete integration
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim', {
            \ 'config': $vim_plugins_config_dir . '/deoplete.nvim.vim',
            \ 'do': 'yaourt --noconfirm -S python-neovim',
            \ }
Plug 'Shougo/deoplete-clangx', {
            \ 'config': $vim_plugins_config_dir . '/deoplete-clangx.vim',
            \ 'do': 'yaourt --noconfirm -S clang',
            \ }
Plug 'zchee/deoplete-jedi', { 'do': 'yaourt --noconfirm -S python-jedi' }

" conflic with YCM
Plug 'w0rp/ale', {
            \ 'config': $vim_plugins_config_dir . '/ale.vim',
            \ 'do': 'yaourt --noconfirm -S bear',
            \ }

Plug 'universal-ctags/ctags', { 'do': './autogen.sh && ./configure && make' }
Plug 'ludovicchabant/vim-gutentags', {
            \ 'config': $vim_plugins_config_dir . '/vim-gutentags.vim',
            \ 'do': 'yaourt --noconfirm -S global python-pygments',
            \ }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/OmniCppComplete', { 'config': $vim_plugins_config_dir . '/OmniCppComplete.vim' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neco-vim'
Plug 'Shougo/echodoc.vim', { 'config': $vim_plugins_config_dir . '/echodoc.vim' }
Plug 'c9s/perlomni.vim'
Plug 'aklt/plantuml-syntax'

" Project manager
Plug 'tpope/vim-fugitive', { 'config': $vim_plugins_config_dir . '/vim-fugitive.vim' }
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim', { 'config': $vim_plugins_config_dir . '/ctrlsf.vim' }
Plug 'skywind3000/asyncrun.vim', { 'config': $vim_plugins_config_dir . '/asyncrun.vim' }
Plug 'Yggdroot/LeaderF', {
            \ 'config': $vim_plugins_config_dir . '/LeaderF.vim',
            \ 'do': './install.sh',
            \ }

if empty(glob($vim_plugins_dir . '/*'))
    if executable('yaourt')
        PlugInstall
    else
        echoerr 'You need to install **yaourt**!'
        finish
    endif
endif

call plug#end()

" }}}

" vim:set ft=vim ts=4 sw=4:
