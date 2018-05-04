" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = 'tags'

let g:gutentags_modules = []
let s:ctags_executable = expand($vim_plugins_dir . '/ctags/ctags')
if executable(s:ctags_executable)
    let g:gutentags_ctags_executable = s:ctags_executable
    let g:gutentags_modules += ['ctags']
elseif executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
    let g:gutentags_auto_add_gtags_cscope = 0
    let $GTAGSLABEL = 'native-pygments'
    let $GTAGSCONF = $vim_plugins_config_dir . '/gtags.conf'
    runtime config/plugins/gtags.vim
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags

" vim:set ft=vim ts=4 sw=4:
