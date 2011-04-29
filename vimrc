filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set expandtab
set tabstop=2
set shiftwidth=2
set number
set incsearch
set hlsearch
set nocompatible
set t_Co=256
set autoindent
set wm=2
set textwidth=80

filetype plugin indent on

"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i

map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,> :s/^/> /<CR> <Esc>:nohlsearch <CR>
map ," :s/^/\"/<CR> <Esc>:nohlsearch <CR>
map ,% :s/^/%/<CR> <Esc>:nohlsearch <CR>
map ,! :s/^/!/<CR> <Esc>:nohlsearch <CR>
map ,; :s/^/;/<CR> <Esc>:nohlsearch <CR>
map ,- :s/^/--/<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch <CR>

autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile *.json set filetype=javascript foldmethod=syntax

" solarized
syntax enable
set background=dark
colorscheme solarized

