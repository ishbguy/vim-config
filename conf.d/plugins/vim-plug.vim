" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" config file for vim-plug

" ----- vim-plug ------------------------------ {{{


call plug#begin($vim_plugins_dir)

" layout & style
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline', { 'config': $vim_plug_conf_dir . '/vim-airline.vim' }
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'rhysd/vim-color-spring-night'
Plug 'tomasr/molokai'

" Project manager
Plug 'scrooloose/nerdtree', { 'config': $vim_plug_conf_dir . '/nerdtree.vim' }
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
" Plug 'dyng/ctrlsf.vim', { 'config': $vim_plug_conf_dir . '/ctrlsf.vim' }
Plug 'Yggdroot/LeaderF', { 'config': $vim_plug_conf_dir . '/LeaderF.vim', 'do': ':LeaderfInstallCExtension' }
Plug 'voldikss/LeaderF-floaterm'
Plug 'voldikss/vim-floaterm', { 'config': $vim_plug_conf_dir . '/vim-floaterm.vim' }
Plug 'skywind3000/asyncrun.vim', { 'config': $vim_plug_conf_dir . '/asyncrun.vim' }
Plug 'skywind3000/asynctasks.vim', { 'config': $vim_plug_conf_dir . '/asynctasks.vim' }
Plug 'skywind3000/vim-terminal-help', { 'config': $vim_plug_conf_dir . '/vim-terminal-help.vim' }
Plug 'skywind3000/LeaderF-snippet', { 'config': $vim_plug_conf_dir . '/LeaderF-snippet.vim' }
Plug 'skywind3000/vim-quickui', { 'config': $vim_plug_conf_dir . '/vim-quickui.vim' }

" jump & motion
Plug 'konfekt/fastfold'
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion', { 'config': $vim_plug_conf_dir . '/vim-easymotion.vim' }

" text manipulation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
Plug 'Chiel92/vim-autoformat', { 'config': $vim_plug_conf_dir . '/vim-autoformat.vim' }
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips', { 'config': $vim_plug_conf_dir . '/ultisnips.vim' }

" Completion & Syntax Checker
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'config': $vim_plug_conf_dir .'/coc.vim' }
" Plug 'FittenTech/fittencode.vim', { 'config': $vim_plug_conf_dir . '/fittencode.vim' }
" Plug 'Exafunction/codeium.vim', { 'config':$vim_plug_conf_dir . '/codeium.vim' }
" Plug 'w0rp/ale', { 'config': $vim_plug_conf_dir . '/ale.vim' }
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'vim-scripts/OmniCppComplete', { 'config': $vim_plug_conf_dir . '/OmniCppComplete.vim' }
" Plug 'c9s/perlomni.vim'
Plug 'aklt/plantuml-syntax'
Plug 'hashivim/vim-terraform'
Plug 'nathangrigg/vim-beancount'
" Plug 'parkr/vim-jekyll', { 'config': $vim_plug_conf_dir . '/vim-jekyll.vim' }
" Markdown {{{
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'dkarter/bullets.vim'
Plug 'dhruvasagar/vim-table-mode'
" }}}
Plug 'girishji/devdocs.vim'

call plug#end()

if empty(glob($vim_plugins_dir . '/*'))
    PlugInstall
endif

" }}}

" vim:set ft=vim ts=4 sw=4:
