"--------------------------------- VUNDLE --------------------------------------

set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'                     " git interface
Plugin 'vim-airline/vim-airline'                " Status line
call vundle#end()

"------------------------------ CUSTOMIZATION ----------------------------------

filetype plugin indent on                       " enables file type detection
set backspace=indent,eol,start                  " make backspaces more powerful
set noswapfile                                  " I don't like swap files
set number                                      " turn on numbering
set viminfo=                                    " don't use or save .viminfo
set laststatus=2                                " Show status line
set hlsearch                                    " highlight for search
set scrolloff=5                                 " keep 5 lines around the cursor
set splitbelow                                  " Open new split panes to bottom
set splitright                                  " Open new split panes to right

"-------------------------------- CUSTOM KEYBOARD ------------------------------

" unset the last search pattern
nnoremap <F3> :noh<CR>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" F2 before pasting to preserve indentation
set pastetoggle=<F2>

"------------------------------- VISUAL DISPLAY --------------------------------

if &t_Co < 256
  set t_Co=256
endif

set fillchars=                                  " Remove chars in split line
highlight VertSplit
    \ cterm=None
    \ ctermbg=lightblue                         " Change splitline color
highlight LineNr ctermfg=darkgrey               " line number coloring

"------------------------------ INDENT & FORMAT --------------------------------

set expandtab                                   " spaces for indents
set tabstop=8
set softtabstop=2
set shiftwidth=2
set textwidth=80
set fileformat=unix                             " Use UNIX (\n) line endings.
set encoding=utf-8                              " Default file encode UTF-8
set autoindent                                  " Keep indentation level

highlight BadWhitespace
    \ ctermbg=red
    \ guibg=red                                 " Display bad whitespace
match BadWhitespace /^\t\+/                     " Flag tabs at the beginning
match BadWhitespace /\s\+$/                     " Flag trailing whitespace
syntax enable
