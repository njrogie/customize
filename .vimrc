syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
colorscheme elflord
set number

" GOLANG-SPECIFIC
filetype plugin indent on

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

au filetype go inoremap <buffer> . .<C-x><C-p>
