" Copyright (c) 2018 - Now Herbert Shen <ishbguy@hotmail.com>
"               All Rights Reserved.

let s:windows = has('win32') || has('win64') || has('win16') || has('win95')

"----------------------------------------------------------------------
" strip heading and ending spaces
"----------------------------------------------------------------------
function! s:string_strip(text)
    return substitute(a:text, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunc

"----------------------------------------------------------------------
" display error message
"----------------------------------------------------------------------
function! s:ErrorMsg(msg)
    redraw! | echo '' | redraw!
    echohl ErrorMsg
    echom 'ERROR: '. a:msg
    echohl NONE
endfunc

"----------------------------------------------------------------------
" search gtags db by gutentags buffer variable
"----------------------------------------------------------------------
function! s:get_gtags_file() abort
    if !exists('b:gutentags_files')
        return ''
    endif
    if !has_key(b:gutentags_files, 'gtags_cscope')
        return ''
    endif
    let s:tags = b:gutentags_files['gtags_cscope']
    if filereadable(s:tags)
        return s:tags
    endif
    return ''
endfunc

"----------------------------------------------------------------------
" list cscope dbs
"----------------------------------------------------------------------
function! s:list_cscope_dbs()
    redir => s:cs_list
    noautocmd silent cs show
    redir END
    let s:records = []
    for s:text in split(s:cs_list, "\n")
        let s:text = s:string_strip(s:text)
        if s:text ==# ''
            continue
        endif
        if strpart(s:text, 0, 1) ==# '#'
            continue
        endif
        let s:p1 = stridx(s:text, ' ')
        if s:p1 < 0
            continue
        endif
        let s:p2 = stridx(s:text, ' ', s:p1 + 1)
        if s:p2 < 0
            continue
        endif
        let s:p3 = strridx(s:text, ' ', len(s:text) - 1)
        if s:p3 < 0 || s:p3 <= s:p2
            continue
        endif
        let s:db_id = strpart(s:text, 0, s:p1)
        let s:db_pid = strpart(s:text, s:p1 + 1, s:p2 - s:p1)
        let s:db_path = strpart(s:text, s:p2 + 1, s:p3 - s:p2)
        let s:item = {}
        let s:item.id = s:string_strip(s:db_id)
        let s:item.pid = s:string_strip(s:db_pid)
        let s:item.path = s:string_strip(s:db_path)
        let s:records += [s:item]
    endfor
    return s:records
endfunc

" noautocmd echo s:list_cscope_dbs()

"----------------------------------------------------------------------
" check db is connected
"----------------------------------------------------------------------
function! s:db_connected(dbname)
    let s:record = s:list_cscope_dbs()
    for s:item in s:record
        let s:p1 = fnamemodify(s:item.path, ':p')
        let s:p2 = fnamemodify(a:dbname, ':p')
        let s:equal = 0
        if s:windows || has('win32unix')
            let s:p1 = tolower(s:p1)
            let s:p2 = tolower(s:p2)
        endif
        if s:windows
            let s:p1 = tr(s:p1, '\\', '/')
            let s:p2 = tr(s:p2, '\\', '/')
        endif
        if s:p1 == s:p2
            return 1
        endif
    endfor
    return 0
endfunc

"----------------------------------------------------------------------
" add to cscope database if not connected
"----------------------------------------------------------------------
function! s:GscopeAdd() abort
    let s:dbname = s:get_gtags_file()
    let s:root = get(b:, 'gutentags_root', '')
    if s:dbname ==# '' || s:root ==# ''
        call s:ErrorMsg("no gtags database for this project, check gutentags's documents")
        return 0
    endif
    if !filereadable(s:dbname)
        call s:ErrorMsg('gtags database is not ready yet')
        return 0
    endif
    if s:db_connected(s:dbname)
        return 1
    endif
    let s:value = &cscopeverbose
    let $GTAGSDBPATH = fnamemodify(s:dbname, ':p:h')
    let $GTAGSROOT = s:root
    let s:prg = get(g:, 'gutentags_gtags_cscope_executable', 'gtags-cscope')
    execute 'set cscopeprg=' . fnameescape(s:prg)
    set nocscopeverbose
    silent exec 'cs kill -1'
    exec 'cs add '. fnameescape(s:dbname)
    if s:value != 0
        set cscopeverbose
    endif
    return 1
endfunc

command! -nargs=0 GscopeAdd call s:GscopeAdd()

"----------------------------------------------------------------------
" open quickfix
"----------------------------------------------------------------------
function! s:quickfix_open(size)
    function! s:WindowCheck(mode)
        if &buftype ==# 'quickfix'
            let s:quickfix_open = 1
            return
        endif
        if a:mode == 0
            let w:quickfix_save = winsaveview()
        else
            if exists('w:quickfix_save')
                call winrestview(w:quickfix_save)
                unlet w:quickfix_save
            endif
        endif
    endfunc
    let s:quickfix_open = 0
    let l:winnr = winnr()
    noautocmd windo call s:WindowCheck(0)
    noautocmd silent! exec ''.l:winnr.'wincmd w'
    if s:quickfix_open != 0
        return
    endif
    exec 'botright copen '. ((a:size > 0)? a:size : '')
    noautocmd windo call s:WindowCheck(1)
    noautocmd silent! exec ''.l:winnr.'wincmd w'
endfunc

"----------------------------------------------------------------------
" Find search
"----------------------------------------------------------------------
function! s:GscopeFind(bang, what, ...)
    let s:keyword = (a:0 > 0)? a:1 : ''
    let s:dbname = s:get_gtags_file()
    let s:root = get(b:, 'gutentags_root', '')
    if s:dbname ==# '' || s:root ==# ''
        call s:ErrorMsg("no gtags database for this project, check gutentags's documents")
        return 0
    endif
    if !filereadable(s:dbname)
        call s:ErrorMsg('gtags database is not ready yet')
        return 0
    endif
    if a:0 == 0 || s:keyword ==# ''
        redraw! | echo '' | redraw!
        echohl ErrorMsg
        echom 'E560: Usage: GscopeFind a|c|d|e|f|g|i|s|t name'
        echohl NONE
        return 0
    endif
    call s:GscopeAdd()
    let s:ncol = col('.')
    let s:nrow = line('.')
    let s:nbuf = winbufnr('%')
    let s:text = ''
    if a:what ==# '0' || a:what ==# 's'
        let s:text = 'symbol "'.s:keyword.'"'
    elseif a:what ==# '1' || a:what ==# 'g'
        let s:text = 'definition of "'.s:keyword.'"'
    elseif a:what ==# '2' || a:what ==# 'd'
        let s:text = 'functions called by "'.s:keyword.'"'
    elseif a:what ==# '3' || a:what ==# 'c'
        let s:text = 'functions calling "'.s:keyword.'"'
    elseif a:what ==# '4' || a:what ==# 't'
        let s:text = 'string "'.s:keyword.'"'
    elseif a:what ==# '6' || a:what ==# 'e'
        let s:text = 'egrep "'.s:keyword.'"'
    elseif a:what ==# '7' || a:what ==# 'f'
        let s:text = 'file "'.s:keyword.'"'
    elseif a:what ==# '8' || a:what ==# 'i'
        let s:text = 'files including "'.s:keyword.'"'
    elseif a:what ==# '9' || a:what ==# 'a'
        let s:text = 'assigned "'.s:keyword.'"'
    endif
    silent cexpr "[cscope ".a:what.": ".s:text."]"
    let s:success = 1
    try
        exec 'cs find '.a:what.' '.fnameescape(s:keyword)
        redrawstatus
    catch /^Vim\%((\a\+)\)\=:E259/
        redrawstatus
        echohl ErrorMsg
        echo "E259: not find '".s:keyword."'"
        echohl NONE
        let s:success = 0
    catch /^Vim\%((\a\+)\)\=:E567/
        redrawstatus
        echohl ErrorMsg
        echo 'E567: no cscope connections'
        echohl NONE
        let s:success = 0
    catch /^Vim\%((\a\+)\)\=:E/
        redrawstatus
        echohl ErrorMsg
        echo 'ERROR: cscope error'
        echohl NONE
        let s:success = 0
    endtry
    if winbufnr('%') == s:nbuf
        call cursor(s:nrow, s:ncol)
    endif
    if s:success != 0 && a:bang == 0
        let s:height = get(g:, 'gutentags_plus_height', 6)
        call s:quickfix_open(s:height)
    endif
endfunc

command! -nargs=+ -bang GscopeFind call s:GscopeFind(<bang>0, <f-args>)

"----------------------------------------------------------------------
" Kill all connections
"----------------------------------------------------------------------
function! s:GscopeKill()
    silent cs kill -1
    echo 'All cscope connections have been closed.'
endfunc

command! -nargs=0 GscopeKill call s:GscopeKill()

"----------------------------------------------------------------------
" setup keymaps
"----------------------------------------------------------------------
if get(g:, 'gutentags_plus_nomap', 0) == 0
    noremap <silent> <leader>cs :GscopeFind s <C-R><C-W><cr>
    noremap <silent> <leader>cg :GscopeFind g <C-R><C-W><cr>
    noremap <silent> <leader>cc :GscopeFind c <C-R><C-W><cr>
    noremap <silent> <leader>ct :GscopeFind t <C-R><C-W><cr>
    noremap <silent> <leader>ce :GscopeFind e <C-R><C-W><cr>
    noremap <silent> <leader>cf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>ci :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    noremap <silent> <leader>cd :GscopeFind d <C-R><C-W><cr>
    noremap <silent> <leader>ca :GscopeFind a <C-R><C-W><cr>
    noremap <silent> <leader>ck :GscopeKill<cr>
endif

" vim:set ft=vim ts=4 sw=4:
