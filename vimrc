" General
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
set nocompatible
set wm=2
set history=1000

" Tabs and spacing
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set wrap
set nosmarttab
set textwidth=80

" UI
set number
set t_Co=256

" Visual Cues
set showmatch
set ignorecase
set incsearch
set hlsearch

" Backups
set nobackup
set nowritebackup
set noswapfile
set backupdir=$HOME/.vim/backup
set backupcopy=yes
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swap,~/tmp,.

" Filetypes
autocmd BufRead,BufNewFile /etc/nginx/* set ft=nginx
autocmd BufRead,BufNewFile *.json set filetype=javascript foldmethod=syntax

" Colors
syntax enable
set background=dark
colorscheme solarized

" Mappings
" emacs movement in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0


