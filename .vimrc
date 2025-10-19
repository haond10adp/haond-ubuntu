" Disable compatibility with vi which can cause unexpected issues.
set nocompatible
" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on
" Enable plugins and load plugin for the detected file type.
filetype plugin on
" Load an indent file for the detected file type.
filetype indent on
" Backup file is immediately deleted upon succesfully writing the original file.
set nobackup

" Turn syntax highlighting on.
syntax on

" Line number
set number relativenumber
set numberwidth=5
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Set shift width to 2 spaces.
set shiftwidth=2
" Set tabstop to 2 columns
set tabstop=2
" Use space character instead of tab
set expandtab
" Set autoindent
set autoindent


" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Set the width for text wrap
set textwidth=80
" Wrap lines
set wrap

" Ignore capital letters during search.
set ignorecase
"Override the ignorecase option if searching for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd
" Show the mode you are in on the last line.
set showmode
" Show matching words during a search.
set showmatch
" Use highlight when doing a search.
set hlsearch


" PLUGINS {{{

" Vim-Plug
call plug#begin()
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'christoomey/vim-titlecase'
Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

" }}}


" MAPPINGS {{{

" Set comma as the leader key.
let mapleader = ','

" Press ,, to turn off highlight search
nnoremap <leader>, :noh<CR>

" Center the cursor vertically when moving to the next word during a search
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']


" }}}


" VIMSCRIPT {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" More Vimscripts code goes here.

" }}}


" STATUS LINE {{{

" Clear statusline when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" Colorscheme
colorscheme PaperColor

" Enable key-code timeout settings
set ttimeout

" Reduce the terminal timeout length to 10 milliseconds
" Default is usually 1000ms (1 second), which is too long.
set ttimeoutlen=10

if &term =~ 'xterm\|st' || &term =~ 'vte' || &term =~ 'alacritty'
    " Normal Mode (Block Cursor: steady block)
    let &t_EI = "\<Esc>[2 q"

    " Insert Mode (I-Beam Cursor: steady vertical bar)
    let &t_SI = "\<Esc>[6 q"

    " Replace Mode (Underline Cursor: steady underline)
    let &t_SR = "\<Esc>[4 q"

    " You might also need to set the initial cursor shape on VimEnter
    " This is often not needed, but can help.
    " autocmd VimEnter * silent ! echo -ne "\e[2 q"
endif
