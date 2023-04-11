" Options
set background=dark
"set clipboard=unnamed " Standard-Register (yy, dd, etc) IMMER in

"Zwischenablage kopieren
set completeopt=noinsert,menuone,noselect
set hidden
set inccommand=split
"set mouse=a
"set number
"set relativenumber
set splitbelow splitright
set title
set ttimeoutlen=0
set wildmenu
set showmode
set ignorecase " Suche nicht Case-Sensitiv

filetype plugin indent on
filetype plugin on
syntax on

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set list listchars=tab:>\ ,trail:-,eol:$
set lcs+=space:·

" Tabs size
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2

" Interner Filemanager (Explore, VExplore, SExplore) optimieren
let g:netrw_banner = 0 " Banner abschalten
let g:netrw_browse_split = 4 " im gleichen Fenster öffnen
let g:netrw_altv = 1 " Split rechts öffnen
let g:netrw_liststyle = 3 " Tree View
let g:netrw_winsize = 25 " Fenster schmälter machen
let g:netrw_list_hide = netrw_gitignore#Hide() " Gits ausblenden
let g:netrw_list_hide.=',(^|\s\s)\zs.\S+' " Dotfiles ausblenden

"augroup ProjectDrawer
"autocmd!
"autocmd VimEnter * :Vexplore
"augroup END

set updatetime=300 " Schellere Darstellung / Refresh
"set cc=80 " Markierung 80 Zeilen-Rand
set laststatus=2 " Statuszeile immer anzeigen
set cmdheight=2 " Mehr Platz für Statusmeldungen
set shortmess+=c " Don't pass messages to |ins-completion-menu|
set nowrap " Wrap standardmäßig abschalten. Mit Leader w an-/abschalten

"set hlsearch " highlight search
"set incsearch " incremental search
"set wildmode=longest,list " get bash-like tab completions
"set mouse=a " enable mouse click
"set clipboard=unnamedplus " using system clipboard
set ttyfast " Speed up scrolling in Vim
" set noswapfile " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.