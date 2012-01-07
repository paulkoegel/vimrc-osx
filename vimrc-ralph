"" General settings
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Pathogen
call pathogen#infect()

"" Color scheme
set background=light
colorscheme solarized

"" Line numbering, cursor
set relativenumber                " Show relative line numbers.
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.

"" NERDTree
function! ShowFileInNERDTree()
  if exists("t:NERDTreeBufName")
    NERDTreeFind
  else
    NERDTree
    wincmd l
    NERDTreeFind
  endif
endfunction
map <leader>d :call ShowFileInNERDTree()<CR>

"" Yankring
let g:yankring_history_file = '.yankring_history'

"" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :vsplit<cr>  " Split pane vertically

"" Wild stuff
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=vendor,log,tmp,*.swp,.git,gems,.bundle,Gemfile.lock,.gem,.rvmrc

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

"" Misc shortcuts
nnoremap <leader><space> :nohl<cr> " un-highlight search results
map <F5> :let @* = @%<CR>          " Copy file path to clipboard
map <leader>T :CommandTFlush<cr>\|:CommandT %%<cr> " Open CommandT
