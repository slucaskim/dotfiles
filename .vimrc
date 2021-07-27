" Dependencies
" vim-plug https://github.com/junegunn/vim-plug
" fzf https://github.com/junegunn/fzf
" ag https://github.com/ggreer/the_silver_searcher

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-liquid'
Plug 'plasticboy/vim-markdown'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'quentindecock/vim-cucumber-align-pipes'
Plug 'kchmck/vim-coffee-script'
Plug 'ngmy/vim-rubocop'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'jparise/vim-graphql'
Plug 'ianks/vim-tsx'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'Shopify/vim-sorbet'
call plug#end()

syntax on
set number
colorscheme badwolf
set termguicolors
set cursorline
set cursorcolumn
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
let mapleader='\'
set clipboard=unnamed
set mouse=a
set hidden

xnoremap . :normal . <Enter>

" fzf
" git ls-files ignore rbi extensions
nmap <C-p> :GFiles -- ':!:*.rbi'<CR>
nmap <C-_> :Ag<CR>
nmap <silent> <C-f> :Ag <C-R><C-W><CR>
nmap <C-o> :History<CR>

" Copy file path to clipboard
command P execute('let @+ = expand("%")')

" status line
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %f
set statusline+=%#warningmsg#
set statusline+=%*

" Nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
nnoremap <silent> <Leader>d :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Nerdcommenter
let g:NERDSpaceDelims = 1

" vim-better-whitespace
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

" rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
nmap <Leader>ra :RuboCop -a<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" reload initvm key binding
nnoremap <leader>sv :source $MYVIMRC<CR>
