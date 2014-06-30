

"""Plugin Config"""
" repeat
"nnoremap <silent> <Plug>TransposeCharacters xp



"""Start Vundle Config"""
filetype on
filetype off 		" required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarick/Vundle.vim'
"""End Start of Vundle"""

"""Bundles start here
"""Defaults to github

" Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/perl-support.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

Bundle "altercation/vim-colors-solarized"

filetype plugin indent on     " required by Vundle


"""Stop Vundle Config
set nocompatible	" be iMproved

set backspace=2 	" Make backspace work like most other apps

set expandtab           " Set tabs to use spaces
set softtabstop=4       " these 3 should be all the same for proper visual pleasure
set shiftwidth=4
set tabstop=4

set number
set relativenumber

set incsearch		" Highlight as you type
set hlsearch		" Keep highlight througout file
set ignorecase		" Ignore the case of search
set smartcase		" Don't ignore case if pattern includes any capitalized char

syntax enable 		" Default syntax highlighting
set background=dark
colorscheme solarized
highlight SignColumn ctermbg=black

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " use in conjunction with :set list to show all whitespace

"""Custom Mapping"""
let mapleader=","
