set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/badwolf'
Plugin 'ctrlpvim/ctrlp.vim'
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
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

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
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %f
set statusline+=%#warningmsg#
set statusline+=%*

" Nerdtree settings
nnoremap <silent> <Leader>r :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>

" vim-better-whitespace settings
autocmd BufEnter * EnableStripWhitespaceOnSave
