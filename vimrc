" Cheat Sheet
" ===========
" <A> Alt
" <S> Shift
" <C> Control
" <D> Command (or apple key on Macs)
" <M> Meta (Windows key)
"
" <CR> Carriage Return (Enter)
" <C-O> switch to normal mode for the following alias command
" <left>, <right>, <up>, <down> arrow keys

call pathogen#infect()

" GENERAL SETUP
" -------------

set nocompatible

set mouse=a
"source $VIMRUNTIME/mswin.vim
"behave mswin

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

" these two cause trouble when i reload my vimrc
" (which i have to do every time i start vim, at the moment, because otherwise
" <D-left> won't jump to the first character of the line) - Rails's 'render',
" e.g., will not be hightlighted anymore.
" syntax highlighting on program start is still fine - maybe this is too late a point to
" call these two?

" commenting out these causes the following error:
"Error detected while processing /usr/local/Cellar/macvim/7.3-62/MacVim.app/Contents/Resources/vim/runtime/menu.vim:
"line  450:
" 'E329': No menu '&Tools'
"line 1205:
" 'E334': Menu not found: Tools.Spelling.To\ Next\ error^I]s
" 'E334': Menu not found: Tools.Spelling.To\ Next\ error^I]sError detected while processing /usr/local/Cellar/macvim/7.3-62/MacVim.app/Contents/Resources/vim/runtime/menu.vim:
" but fixed syntax highlighting problems
syntax enable
filetype plugin indent on

colorscheme molokai
"set background=dark
"colorscheme solarized

set t_Co=256 " enable 256 colors within vim - grey background, proper syntax highlighting etc.
set gfn=Menlo:h13
"set gfn=Inconsolata:h15
set guioptions-=T "remove toolbar

" start fullscreen
set lines=999
set columns=999


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
" Grep.vim
let Grep_Path = '/usr/local/Cellar/grep/2.9/bin/grep'

" Rgrep fails with 'illegal option -- -' even for Grep 2.9
"nnoremap <leader>a :Rgrep 

" Git-Grep.Vim
nnoremap <leader>a :GitGrep 
" Ack
"nnoremap <leader>A :Ack 


" Custom Gimmicks
" ---------------

" shortcut for hash rocket
imap <C-q> <Space>=><Space>
imap <C-w> <C-O>i

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
inoremap <S-up> <C-o>vgk
inoremap <S-down> <C-o>vgj

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
nmap <leader>H :topleft  vnew<CR>
nmap <leader>L :botright vnew<CR>
nmap <leader>K :topleft  new<CR>
nmap <leader>J :botright new<CR>

" buffer
nmap <leader>h :leftabove  vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove  new<CR>
nmap <leader>j :rightbelow new<CR>

" one word forward / back
nnoremap <A-left> b
nnoremap <A-right> w
inoremap <A-left> <C-O>b
inoremap <A-right> <C-O>w
vnoremap <A-left> b
vnoremap <A-right> w
snoremap <A-left> <C-O>b
snoremap <A-right> <C-O>w

nnoremap <S-A-left> vb
nnoremap <S-A-right> vw<S-left>
inoremap <S-A-left> <C-O>vb
inoremap <S-A-right> <C-O>vw<S-left>

" smart home key for indented lines: go to first non-blank character (not start of line) of display line (not numbered line)
nnoremap <D-left> g^
nnoremap <D-right> g$
inoremap <D-left> <C-O>g^
inoremap <D-right> <C-O>g$
"alternatively: vg^ to automatically enter visual mode first
nnoremap <S-D-left> vg^ <S-left>
nnoremap <S-D-right> vg$
inoremap <S-D-left> <C-O>vg^ <S-left>
inoremap <S-D-right> <C-O>vg$
" best solution I could find. adding shift to the shortcut ends visual mode =(
vnoremap <D-left> g^
vnoremap <D-right> g$

" start/end of file
vnoremap <D-up> 1G
vnoremap <D-down> Gg$


" File & Folder Shortcuts
" =======================

" VIMRC
nnoremap <silent> <leader>gV :tabnew $MYVIMRC<CR>
nnoremap <silent> <leader>gv :so $MYVIMRC<CR>

" hack - for saome reason i need to reload these even after my vimrc has
" loaded in order for my command shortcuts to work -  really weird! reloading
" the entire .vimrc breaks Rails.vim syntax highlighting (e.g. 'render' is not green anymore)
nnoremap <silent> <leader>gc :so ~/.vim/command_shortcuts.vim<CR>

"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map ,v and ,e to open files in the same directory as the current file
" source: destroy all software screencasts: vim file navigation
"cnoremap %% <C-R>=expand('%:h').'/'<CR>
cnoremap %% <C-R>=expand('%:h')<CR>
map <leader>e :edit %%
map <leader>v :view %%

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<CR>

"PLUGINS
"=======

" COMMAND T
" ---------
"  defaults to <leader> t
nmap <leader>t :CommandTFlush<CR>\|:CommandT<CR>
nmap <leader>T :CommandTFlush<CR>

" cf. https://wincent.com/issues/1555 and https://wincent.com/issues/1542
set wildignore+=*.o,*.obj,.git,*.jpg,*.gif,*.jpeg,*.png,*.ico
set wildignore+=**/vendor/plugins/**,**/vendor/gems/**,**/temp/**,**/tmp/**


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

" EasyGrep (cf. http://dailyconfig.googlecode.com/svn/trunk/.vimrc)
" --------
let g:EasyGrepRecursive = 1
