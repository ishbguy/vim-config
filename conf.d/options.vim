" Copyright (c) 2018 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" this config file include some vim options settings

"Use Vim settings, rather than Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible              " be iMproved, required

set updatetime=300

"Fonts settiings
set autoread
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp936,gbk,ucs-bom
scriptencoding utf-8

"Colorsheme settings
set t_Co=256
set background=dark

"Menu
highlight  Pmenu      ctermfg=0 ctermbg=5   guibg=Magenta
"Selection
highlight  PmenuSel   ctermfg=0 ctermbg=3   guifg=Black   guibg=Yellow
highlight  PmenuThumb ctermbg=2 guibg=Green

"Switch syntax highlighting on, when the terminal has colors
"Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has('gui_running')
    syntax on
    set hlsearch
    nohlsearch
endif

"Show status
set laststatus=2
set showcmd
set showmode
set ruler
set cursorline
set cursorcolumn
set number
set cmdheight=1
set scrolloff=0
set sidescroll=0
set nowrap
set wildmenu
set incsearch

"Indentation
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set cindent shiftwidth=4

"Folding
set nofoldenable
set foldmethod=syntax

"Cursor keys wrap to previous/next line
set whichwrap=b,s,<,>,[,]

"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set list lcs=tab:\¦\ 

"No cursor rolling
set guicursor=a:block-blinkon0
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"No menu or toolbar
set guioptions-=m
set guioptions-=T
set completeopt-=preview
set mouse=

"Do not keep a backup file, use versions instead
if has('vms')
    set backup
else
    set nobackup
endif

if !isdirectory($HOME . '/.cache/vim-swap')
   silent! call mkdir($HOME . '/.cache/vim-swap', 'p')
endif
set directory=$HOME/.cache/vim-swap

"Keep 1000 lines of command line history
set history=1000
set viminfo='1000,<1000,h

set path=.,/usr/include,/usr/local/include,./include,./inc,
            \../inc,../include,../../inc,../../include
set tags=../tags,../TAGS,tags;/,TAGS;/

" Only do this part when compiled with support for autocommands.
if has('autocmd')

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(':DiffOrig')
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \             | wincmd p      | diffthis
endif

" ----- cscope ------------------------------ {{{

if has('cscope')
    set cscopeprg=/usr/bin/cscope
    set cscopetagorder=0
    set cscopetag
    set nocscopeverbose
    " add any database in current directory
    if filereadable('cscope.out')
        cs add cscope.out
        " else add database pointed to by environment
    elseif $CSCOPE_DB !=# ''
        cs add $CSCOPE_DB
    endif
    set cscopeverbose
endif
"show in quickfix
set cscopequickfix=s-,c-,d-,i-,e-,t-

" }}}

" vim:set ft=vim ts=4 sw=4:
