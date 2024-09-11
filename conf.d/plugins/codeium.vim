let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-L> codeium#Accept()
" imap <script><silent><nowait><expr> <C-h> codeium#AcceptNextWord()
" imap <script><silent><nowait><expr> <C-j> codeium#AcceptNextLine()
imap <C-K> <Cmd>call codeium#Clear()<CR>
" imap <C-[> <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-]> <Cmd>call codeium#CycleCompletions(1)<CR>
