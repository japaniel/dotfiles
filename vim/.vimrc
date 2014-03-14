set nocompatible	" be iMproved

set backspace=2 	" Make backspace work like most other apps

set expandtab           " Set tabs to use spaces
set softtabstop=2       " these 3 should be all the same for proper visual pleasure
set shiftwidth=2
set tabstop=2

set number
set relativenumber


"""Custom Mapping"""
let mapleader=","


"""Plugin Config"""
" repeat
"nnoremap <silent> <Plug>TransposeCharacters xp



"""Start Vundle Config"""
filetype on
filetype off 		" required for Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarick/vundle'
"""End Start of Vundle"""

"""Bundles start here
"""Defaults to github

Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/perl-support.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

filetype plugin indent on     " required by Vundle
