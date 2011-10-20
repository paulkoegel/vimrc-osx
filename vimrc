call pathogen#infect()

" GENERAL SETUP
" -------------

set mouse=a
source $VIMRUNTIME/mswin.vim
behave mswin

set nocompatible
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set enc=utf-8
set fileencodings=utf-8,latin2,latin2
set ignorecase
set backspace=indent,eol,start
set number
set smartindent
set linebreak


" UI DESIGN
" =========

colorscheme molokai
set t_Co=256 " enable 256 colors within vim - grey background, proper syntax highlighting etc.
set gfn=Menlo:h13
set guioptions-=T "remove toolbar

" start fullscreen
set lines=999
set columns=999

syntax on
filetype plugin indent on


" FILETYPES
" =========
" RABL support
autocmd BufRead,BufNewFile *.rabl setf ruby
autocmd BufRead,BufNewFile *.pde setf javascript

" BACKUPS
" =======

" put all temporary and swap files into a single folder; '//' makes sure swap
" filenames start with the files' full pathname, this prevents duplicate swap
" files for files with the same name in different locations
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//

" KEYS
" ====

let mapleader = ","

nnoremap <leader><space> :noh<cr>


" SEARCH
" ------
set hlsearch " highlight search terms
set incsearch " start hihglighting (partial) matches as soon as you start typing letters after '/'

" search through files' contents
nnoremap <leader>a :Grep 


" Custom Gimmicks
" ---------------

" shortcut for hash rocket
imap <C-q> <Space>=><Space>

" TABS
" ----
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>
map <C-t><z> :tabnew<cr>
nmap <C-Delete> :tabclose<CR>


" USABILITY
" ---------

nnoremap <C-^> :q<CR>

"command alias for saving
:ca W w

" move by display lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <S-Down> vgj
nnoremap <S-Up> vgk
vnoremap <S-Down> gj
vnoremap <S-Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" CTRL-A is Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" SPLITS
" ======
" window
nmap <leader>H  :topleft  vnew<CR>
nmap <leader>L  :botright vnew<CR>
nmap <leader>K  :topleft  new<CR>
nmap <leader>J  :botright new<CR>

" buffer
nmap <leader>h  :leftabove  vnew<CR>
nmap <leader>l  :rightbelow vnew<CR>
nmap <leader>k  :leftabove  new<CR>
nmap <leader>j  :rightbelow new<CR>

" smart home key for indented lines: go to first non-blank character (not start of line) of display line (not
" numbered line)
nmap <D-left> g^
nmap <D-right> g$
vmap <D-left> g^
vmap <D-right> g$
imap <D-left> <C-O>g^
imap <D-right> <C-O>g$

"alternatively: vg^ to automatically enter visual mode first
nmap <S-D-left> vg^ <S-left>
nmap <S-D-right> vg$
imap <S-D-left> <C-O><S-D-left>
imap <S-D-right> <C-O><S-D-right>

" best solution I could find. adding shift to the shortcut ends visual mode =(
vmap <D-left> g^
vmap <D-right> g$
vmap <S-D-left> h
vmap <S-D-right> l


" File & Folder Shortcuts
" =======================

nnoremap <leader>v :tabnew $MYVIMRC<CR>
nnoremap <leader>V :source $MYVIMRC<CR>


"PLUGINS
"=======

" COMMAND T
" ---------
nmap <leader>T :CommandTFlush<CR>


" NERDTree
" --------
let NERDTreeWinSize=30
let NERDTreeWinPos='right'
" let NERDTreeShowHidden = 1

" map <F7> to toggle NERDTree window
inoremap <silent> <F7> <C-O>:NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>


" NERDTreeToggle
" --------------
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
" Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names = 1

" Close current tab if there is only one window in it and it's NERDTree
let g:nerdtree_tabs_autoclose = 1

" Synchronize view of all NERDTree windows (scroll and cursor position)
let g:nerdtree_tabs_synchronize_view = 1
