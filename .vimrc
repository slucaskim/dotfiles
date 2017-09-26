set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/badwolf'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'neomake/neomake'
Plugin 'jaawerth/neomake-local-eslint-first'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'pangloss/vim-javascript.git'
Plugin 'mxw/vim-jsx.git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'airblade/vim-gitgutter'
Plugin 'ntpeters/vim-better-whitespace'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set number
colorscheme badwolf
set cursorline
set showmatch
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
let mapleader='\'

" Map <ctrl-slash> to trigger global search
nnoremap <C-_> :Ggr -i<space>

" Mappings for moving lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" vim-fugitive settings
nnoremap <C-F> :Ggr <cword><CR> | cw | redraw!
autocmd QuickFixCmdPost *grep* cwindow

" nerdcommenter settings
let g:NERDSpaceDelims = 1

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" vim-jsx settings
let g:jsx_ext_required = 0

" status line settings
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%*

" Neomake settings
call neomake#configure#automake('w')
let g:neomake_javascript_enabled_makers = ['eslint']
tnoremap <Esc> <C-\><C-n>

" Nerdtree settings
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>

" vim-better-whitespace settings
autocmd BufEnter * EnableStripWhitespaceOnSave
