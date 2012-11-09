" Initialization for the pathogen plugin
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Minimal .vimrc settings
" http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
set nocompatible " Use Vim settings, rather than Vi settings.
set backspace=indent,eol,start " Make backspace behave in a sane manner.
syntax on " Switch syntax highlighting on.
filetype off " Needed to load ftdetect files from pathogen
filetype plugin indent on " Enable file type detection and do language-dependent indenting.

" Toggle auto-indenting for code paste.
" http://vim.wikia.com/wiki/Toggle_auto-indenting_for_code_paste.
nnoremap <F2> :set invpaste paste?<CR> " Pressing F2 in normal node will invert the 'paste' option
set pastetoggle=<F2> " Press F2 in insert mode toggles 'paste' on and off.  set showmode " Enables displaying whether 'paste' is turned on in insert mode.

set background=dark
colorscheme molokai

set number " Turn on line numbers.
" Set F3 to toggle line numbers.
nnoremap <F3> :set nonumber!<CR>:set foldcolumn=0<CR> 

" Set F4 to toggle NERDTree view.
nnoremap <F4> :NERDTreeToggle<CR>

" F5 is execute if current file is in Python.

" Set F6 to run PEP8 check.
let g:pep8_map='<F6>'

" Set F7 to toggle source tree.
nnoremap <F7> :TlistToggle<CR>

" Python Stuff
" http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,( " Python syntax highlighting
" Good advice on ftplugin/python.vim here http://henry.precheur.org/vim/python.html

" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Don't complain when switching away from a modified buffer
set hidden

" Set mouse on for all modes.
set mouse=a

" Clear last search highlighting with space.
nnoremap <Space> :noh<CR> 

" Turn on incremental and highlighted search
set incsearch hlsearch

set ruler " Show location in the file at all times.
set ignorecase smartcase " Ignore case in searches unless a captial letter is used in query
set noeb vb t_vb= " Turn off bells and beeps.

" Settings for C programming
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd QuickFixCmdPost * :cwindow

" On window splits, open new buffers to the right and below
set splitright
set splitbelow

set lines=50 columns=85

" Go formatting
autocmd BufWritePost *.go :silent Fmt
