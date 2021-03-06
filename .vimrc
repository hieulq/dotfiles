""""""" Plugin management stuff """""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plugin 'easymotion/vim-easymotion'
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Remove extraneous whitespace when edit mode is exited
Plugin 'thirtythreeforty/lessspace.vim'
" LaTeX editing
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Status bar mods
" Plugin 'airblade/vim-gitgutter'
" Tab completion
" Plugin 'ervandew/supertab'
" Code Folding
" Plugin 'tmhedberg/SimpylFold'
" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'
" Syntax Checking/Highlighting
"Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
" File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Git Integration
Plugin 'tpope/vim-fugitive'
" Vim-airline Themes
" Plugin 'vim-airline/vim-airline-themes'
" Tagbar
Plugin 'majutsushi/tagbar'
" Python Mode
" Plugin 'klen/python-mode'
" Vim Markdown
Plugin 'tpope/vim-markdown'
Plugin 'jmcantrell/vim-virtualenv'
" Auto-close bracket...
Plugin 'Raimondi/delimitMate'
" Solarized color
" Plugin 'altercation/vim-colors-solarized'
Plugin 'Solarized'
" Fuzzy search
" Plugin 'junegunn/fzf'
" Vim ansible yaml
Plugin 'chase/vim-ansible-yaml'

" After all plugins...
call vundle#end()
filetype plugin indent on

""""""" General coding stuff """""""
set list
set listchars=tab:>-,trail:-,extends:#,nbsp:-
set modeline
set tw=78
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

" Highlight 80th column
if exists('+colorcolumn')
    set colorcolumn=79
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" Always show status bar
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" let g:airline_powerline_fonts = 1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" If your terminal's background is white (light theme), uncomment the following
" to make EasyMotion's cues much easier to read.
" hi link EasyMotionTarget String
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First String
" hi link EasyMotionTarget2Second Statement


""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

"""" Color Schemes """"""
try
    colorscheme solarized
catch
endtry
set background=light
set t_Co=256

""""""" Keybindings """""""
" Set up leaders
let mapleader=","
let maplocalleader="\\"

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>
"split navigations
" Ctrl-j move to the split below
" Ctrl-k move to the split above
" Ctrl-l move to the split to the right
" Ctrl-h move to the split to the left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

autocmd BufNewFile,BufRead *.tex,*.bib noremap <buffer> <C-b> :w<cr>:new<bar>r !make<cr>:setlocal buftype=nofile<cr>:setlocal bufhidden=hide<cr>:setlocal noswapfile<cr>
autocmd BufNewFile,BufRead *.tex,*.bib imap <buffer> <C-b> <Esc><C-b>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Open NERDTree automatically when nvim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" UTF8 Support
set encoding=utf-8

" Hide .pyc when browsing files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Common settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set encoding=utf8
set ffs=unix,dos,mac
set ai
set si
set wrap
" Highlight current line
set cursorline
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
