setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal smarttab
setlocal expandtab
set nosmartindent

" Execute file being edited with <Shift> + e:
map <buffer> <F5> :w<CR>:!/usr/bin/env python % <CR>
