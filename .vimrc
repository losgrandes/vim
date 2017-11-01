syntax on                           " Syntax highlighting
set foldmethod=syntax               " Folding code - can sometimes freeze VIM
let perl_fold = 1                   " Enable perl folding
let python_highlight_all=1
set hlsearch                        " Highlight searches
set incsearch                       " show search matches as you type
set tabstop=4                       " Use 4 spaces for TAB
set expandtab                       " Always use spaces instead of TAB
set autoindent                      " always set autoindenting on
set nowrap                          " don't wrap lines
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set copyindent                      " copy the previous indentation on autoindenting
set number                          " always show line numbers
set shiftwidth=4                    " number of spaces to use for autoindenting
set shiftround                      " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch                       " set show matching parenthesis
"set smartcase                      " ignore case if search pattern is all lowercase,
                                    " case-sensitive otherwise
set smarttab                        " insert tabs on the start of a line according to
                                    " shiftwidth, not tabstop
set history=100                     " remember more commands and search history
set undolevels=200                  " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                           " change the terminal's title
set visualbell                      " don't beep
set noerrorbells                    " don't beep
set laststatus=2                    " enable status line
set nocompatible                    " be iMproved
set colorcolumn=100

"***************************
" Vundle configuration START
"***************************
filetype off                        " required!
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
filetype plugin indent on

" bundles
Bundle 'ctrlp.vim'
Bundle 'molokai'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
" Syntax checking
Bundle 'w0rp/ale'
"*************************
" Vundle configuration END
"*************************

" mappings
map <F2> :TlistToggle<CR>
set pastetoggle=<F3>
autocmd FileType python nnoremap <F10> :0,$!yapf<CR>

set tags=tags;/                     " Look for tags file from current dir up to root
"let g:ctags_statusline=1            " Looks like not needed
let Tlist_Process_File_Always = 1   " Process tags in file while opening

" The one and the only...status line!
set statusline=%f%m%r%h%w\ [%n:%{&ff}/%Y]%=[0x\%04.4B][%03v]%p%%\ line\ %l\ of\ %L[\%{Tlist_Get_Tagname_By_Line()}]

