set nocompatible " Be iMproved
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
let iCanHazNeoBundle=1
let NeoBundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(NeoBundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" Powerful Editing
NeoBundle 'vim-scripts/Auto-Pairs'

" Useful Tool
NeoBundle 'scrooloose/nerdtree'

" For Python
"NeoBundle 'davidhalter/jedi-vim'

let local_Vimrc=expand('~/.vimrc.local')
if filereadable(local_Vimrc)
    source ~/.vimrc.local
endif

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" File Type
autocmd FileType python setlocal et sta sw=4 sts=4 completeopt-=preview

" nerdtree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '-'

" Python header
autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python\<nl>\"|$
autocmd BufNewFile *.py 1put =\"# encoding: utf8\<nl>\"|$
autocmd BufNewFile *.py 2put =\"\<nl>\"|$

" Basic setting
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set number
set showcmd
set ruler
set showmode
syntax on
set t_Co=256
colorscheme wombat256
