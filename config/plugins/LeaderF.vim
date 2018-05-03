" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<CR>
noremap <m-p> :LeaderfFunction<CR>
noremap <m-n> :LeaderfBuffer<CR>
noremap <m-m> :LeaderfTag<CR>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.cache/LeaderF')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0}

let g:Lf_NormalMap = {
            \ 'File':   [['<ESC>', ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
            \ 'Buffer': [['<ESC>', ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
            \ 'Mru':    [['<ESC>', ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
            \ 'Tag':    [['<ESC>', ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
            \ 'Function':    [['<ESC>', ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
            \ 'Colorscheme':    [['<ESC>', ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
            \ }

" vim:set ft=vim ts=4 sw=4:
