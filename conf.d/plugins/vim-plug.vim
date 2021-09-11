" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" config file for vim-plug

" ----- vim-plug ------------------------------ {{{


call plug#begin($vim_plugins_dir)

" layout & style
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'config': $vim_plugins_config_dir . '/nerdtree.vim' }
Plug 'vim-airline/vim-airline', { 'config': $vim_plugins_config_dir . '/vim-airline.vim' }
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'

" jump & motion
Plug 'konfekt/fastfold'
Plug 'kshenoy/vim-signature', { 'config': $vim_plugins_config_dir . '/vim-signature.vim' }
Plug 'easymotion/vim-easymotion', { 'config': $vim_plugins_config_dir . '/vim-easymotion.vim' }

" text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'Chiel92/vim-autoformat', { 'config': $vim_plugins_config_dir . '/vim-autoformat.vim' }
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips', { 'config': $vim_plugins_config_dir . '/ultisnips.vim' }

" Project manager
Plug 'tpope/vim-fugitive', { 'config': $vim_plugins_config_dir . '/vim-fugitive.vim' }
Plug 'airblade/vim-gitgutter'
Plug 'dyng/ctrlsf.vim', { 'config': $vim_plugins_config_dir . '/ctrlsf.vim' }
Plug 'Yggdroot/LeaderF', { 'config': $vim_plugins_config_dir . '/LeaderF.vim', 'do': ':LeaderfInstallCExtension' }
Plug 'skywind3000/asyncrun.vim', { 'config': $vim_plugins_config_dir . '/asyncrun.vim' }

" Completion & Syntax Checker
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'w0rp/ale', { 'config': $vim_plugins_config_dir . '/ale.vim' }
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/OmniCppComplete', { 'config': $vim_plugins_config_dir . '/OmniCppComplete.vim' }
Plug 'c9s/perlomni.vim'
Plug 'aklt/plantuml-syntax'
Plug 'parkr/vim-jekyll', { 'config': $vim_plugins_config_dir . '/vim-jekyll.vim' }
" Markdown {{{
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'dkarter/bullets.vim'
Plug 'dhruvasagar/vim-table-mode'
" }}}

if empty(glob($vim_plugins_dir . '/*'))
    PlugInstall
endif

call plug#end()

" }}}

" vim:set ft=vim ts=4 sw=4:
