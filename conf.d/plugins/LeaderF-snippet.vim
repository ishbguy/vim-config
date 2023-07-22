" Copyright (c) 2023 Herbert Shen <ishbguy@hotmail.com> All Rights Reserved.
" Released under the terms of the MIT License.

" maps
inoremap <c-x><c-x> <c-\><c-o>:Leaderf snippet<cr>

" optional: preview
let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})
let g:Lf_PreviewResult.snippet = 1

" vim:set ft=vim ts=4 sw=4:
