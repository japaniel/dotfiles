"""Start Vundle Config"""
set nocompatible
filetype off        " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
"""End Start of Vundle"""

"""Plugins start here
"""Defaults to github

Plugin 'ervandew/supertab'
Plugin 'tpope/vim-rails.git'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'thoughtbot/vim-rspec'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'fatih/vim-go'
Plugin 'TheMue/vim-gode'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on     " required by Vundle
"""End Vundle Config

set nocompatible	" be iMproved

set backspace=2 	" Make backspace work like most other apps
"""open split windows to the right
set splitright

"set expandtab           " Set tabs to use spaces
set softtabstop=2       " these 3 should be all the same for proper visual pleasure
set shiftwidth=2
set tabstop=2

"set number
"set relativenumber

set incsearch		" Highlight as you type
set hlsearch		" Keep highlight througout file
set ignorecase		" Ignore the case of search
set smartcase		" Don't ignore case if pattern includes any capitalized char

syntax enable 		" Default syntax highlighting
set background=dark
colorscheme solarized

au Filetype python,markdown set colorcolumn=80
hi ColorColumn ctermbg=darkgrey

" set list listchars=tab:\.\ ,trail:·,extends:>,precedes:< " use in conjunction with :set list to show all whitespace
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<


"""Directory traversing (netrw)
set autochdir


"""Custom Mapping"""
let mapleader=","

"""RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>



"""Go
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
