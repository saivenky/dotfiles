set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" default way to begin Vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/.vim/vundle-plugins/')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" auto-completion
" Plugin 'Valloric/YouCompleteMe'

" fuzzy search files
Plugin 'ctrlpvim/ctrlp.vim'

"status bar at bottom and top
Plugin 'vim-airline/vim-airline'

" git gutter (shows added/deleted/changed lines in the gutter)
Plugin 'airblade/vim-gitgutter'

" preview latex live
" Plugin 'xuhdev/vim-latex-live-preview'

" markdown live preview
" Plugin 'shime/vim-livedown'

" let g:livedown_browser = 'chrome'

" Golang Plugins
" Syntax highlighting, gofmt on save, linting, and more
" Plugin 'fatih/vim-go'
" Works with vim-go, shows gotags of the source code in a sidebar
" Plugin 'majutsushi/tagbar'
" Compiles Go in the background, reports errors to the QuickFix window
" Plugin 'rjohnsondev/vim-compiler-go'
" Adds godef support to vim
" Plugin 'dgryski/vim-godef'

" Map Tagbar for Go to F8
" nmap <F8> :TagbarToggle<CR
" let g:go_fmt_autosave=1
" let g:go_fmt_command = "goimports"


" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" colorscheme for Vim 'Tomorrow-Night'
Plugin 'Ardakilic/vim-tomorrow-night-theme'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" YouCompleteMe config
let g:ycm_server_python_interpreter = '/usr/bin/python'

" CtrlP config
" tells ctrlp-plugin's matcher to only index files under version control
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

"Airline config
" let g:airline#extensions#tabline#enabled = 1

" vdebug config
let g:vdebug_options = {"path_maps" : {"/srv/thumbtack/code/": "/home/sai/Thumbtack/website/"}}

set tags=./tags,tags;$HOME

syntax on
colorscheme Tomorrow-Night

" set lines=35 columns=120
set colorcolumn=80,100
set number
set relativenumber

set hidden
set history=100

filetype indent on
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showmatch
set backspace=indent,eol,start

" diff options
set diffopt+=iwhite

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePost .vimrc :so %

set hlsearch
set splitright
set splitbelow

" set mouse=a

" key mappings
" nnoremap <Space> :noh<Enter>
nnoremap <C-L> :bn<Enter>
nnoremap <C-H> :bp<Enter>
nnoremap <F6> :%s///gn<Enter>
nnoremap <F8> :TagbarToggle<Enter>
map <F2> :mksession! ~/.vim_session<Enter>
map <F3> :source ~/.vim_session<Enter>
nnoremap <F12> :!git diff %<Enter>
nnoremap <C-Up> :!git grep -n "<C-R><C-W>"<Enter>
nnoremap <C-Down> :!grep -n --color=auto   %<Left><Left><Left>
