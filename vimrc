call pathogen#infect()
" call pathogen#runtime_append_all_bundles() " deprecated?
" call pathogen#helptags() " deprecated?

" GENERAL SETUP
" -------------

set mouse=a
source $VIMRUNTIME/mswin.vim
behave mswin


" UI DESIGN
" =========

colorscheme molokai
set t_Co=256 " enable 256 colors within vim - grey background, proper syntax highlighting etc.
set gfn=Menlo:h15
set guioptions-=T "remove toolbar
set smartindent
set linebreak

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

" USABILITY
" ---------

"command alias for saving
:ca W w


"PLUGINS
"=======

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
