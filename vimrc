" Initialization for the pathogen plugin
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#incubate()
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

set relativenumber " Turn on line numbers.
" Set F3 to toggle line numbers.
nnoremap <F3> :set norelativenumber!<CR>:set foldcolumn=0<CR> 

" Set F4 to toggle NERDTree view.
nnoremap <F4> :NERDTreeToggle<CR>

" F5 is execute if current file is in Python.

" Set F6 to run PEP8 check.
let g:pep8_map='<F6>'

" Set F7 to toggle source tree.
nnoremap <F7> :TlistToggle<CR>

" Python Stuff
" http://dancingpenguinsoflight.com/2009/02/python-and-vim-make-your-own-ide/
autocmd FileType python set complete+=k~/.vim/syntax/python.vim "isk+=.,( " Python syntax highlighting
" Good advice on ftplugin/python.vim here http://henry.precheur.org/vim/python.html

" http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR> " Shortcut to rapidly toggle `set list`
set listchars=tab:▸\ ,eol:¬ " Use the same symbols as TextMate for tabstops and EOLs

" Don't complain when switching away from a modified buffer
set hidden

" Set mouse on for all modes.
set mouse+=a

" Allow splits to be resized inside Tmux
set ttymouse=xterm2

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

" On window splits, open new buffers to the right and below
set splitright
set splitbelow

" Go formatting
autocmd BufWritePost *.go :silent Fmt

" Powerline Settings
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
set guifont=Liberation\ Mono\ 11

" Ack Settings
noremap <leader>a :Ack! 

" Swap mark triggers
nnoremap ` '
nnoremap ' `

" Ignore .pyc files for CtrlP
set wildignore=*.pyc,*.swp,*.class

" Set the max files
let g:ctrlp_max_files = 10000
"https://gist.github.com/mitchellh/ee14d6ecb9196a07da56


" Use C-h,j,k,l to move between splits to match Tmux setup
" http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits.html
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Reposition the window on jumps to things at the edge.
set scrolloff=10

" Move to the cursor position above, even if on the same line.
nnoremap j gj
nnoremap k gk

nnoremap gj j
nnoremap gk k

"Make :s :%s get all occurences in lines, rather than just the first
set gdefault
