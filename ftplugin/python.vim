setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab
set nosmartindent

" Execute file being edited with <F5>
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>

" Highlights anything over 79 chars in red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%80v.\+/

set colorcolumn=80
