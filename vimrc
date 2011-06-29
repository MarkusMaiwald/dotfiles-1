" General
filetype on         " If you don't do this, vim will exit nonzero
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
set ruler

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
au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufRead,BufNewFile *.json set ft=javascript foldmethod=syntax
au BufRead,BufNewFile *.zsh-theme,zshrc set ft=zsh
au BufRead,BufNewFile Vagrantfile,Gemfile set ft=ruby

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
" Tabs
" map <C-t><up> :tabr<cr>
" map <C-t><down> :tabl<cr>
" map <C-t><left> :tabp<cr>
" map <C-t><right> :tabn<cr>
map <C-w> <C-w>w            " Ctrl-W toggles windows

" Paste
set pastetoggle=<F2>

" GUI
set guicursor=a:blinkon0    " Stop the scourge of blinking cursors
set guifont=Inconsolata:h14
set guioptions=-t           " Hide the macvim toolbar (floppy disks?)
set guioptions-=L
set guioptions-=r

"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

