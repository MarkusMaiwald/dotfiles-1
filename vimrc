" Managed by Chef
set expandtab
set tabstop=2
set shiftwidth=2
set number
set incsearch
set hlsearch
set nocompatible
set t_Co=256
set autoindent
filetype plugin indent on

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,> :s/^/> /<CR> <Esc>:nohlsearch <CR>
map ," :s/^/\"/<CR> <Esc>:nohlsearch <CR>
map ,% :s/^/%/<CR> <Esc>:nohlsearch <CR>
map ,! :s/^/!/<CR> <Esc>:nohlsearch <CR>
map ,; :s/^/;/<CR> <Esc>:nohlsearch <CR>
map ,- :s/^/--/<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch <CR>

autocmd BufRead,BufNewFile Gemfile set filetype=Gemfile
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile *.ru set filetype=Rackup

" solarized
syntax enable
set background=dark
colorscheme solarized

