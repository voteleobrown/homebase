"""""""""""""""""""""""""""""""""""""""""""""""""
"                                               "
"	Present & Correct VIM			"
"						"
"""""""""""""""""""""""""""""""""""""""""""""""""

set nu			"Show line numbers

" Appearance "

set t_Co=256		"256 color
colorscheme openbsd



" Searching "
set hlsearch        "highlight results
set incsearch       "search as characters are typed

" IDE "
syntax enable

:map <c-s> :w <return>

:map <c-d> :setlocal nospell <return>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                          "
" From: https://github.com/VundleVim/Vundle.vim/issues/679 "
"                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
syntax on                       " turn syntax highlighting on by default

filetype off                  " required
" BEGIN VUNDLE

""""""""""""""""""""""""""""""""""""""""""""""""
"					       "
"        Vundle                                "
"                                              "
""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'jceb/vim-orgmode'
"Plugin 'tpope/vim-speeddating'
Plugin 'elixir-editors/vim-elixir'
Plugin 'gabrielelana/vim-markdown'
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" END VUNDLE
