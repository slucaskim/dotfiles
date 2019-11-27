set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'godlygeek/tabular'
Plug 'quentindecock/vim-cucumber-align-pipes'
Plug 'kchmck/vim-coffee-script'
Plug 'ngmy/vim-rubocop'
Plug 'leafgarland/typescript-vim'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
call plug#end()

syntax on
set number
colorscheme badwolf
set cursorline
set cursorcolumn
set showmatch
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
let mapleader='\'
set clipboard=unnamed
set mouse=a
set hidden

" fzf settings
nmap <C-p> :GFiles<CR>
nmap <C-_> :Ag<CR>
nmap <silent> <C-f> :Ag <C-R><C-W><CR>

let g:fzf_layout = { 'down': '~25%' }

nmap <C-o> :History<CR>

" nerdcommenter settings
let g:NERDSpaceDelims = 1

" vim-jsx settings
" let g:jsx_ext_required = 0

" status line settings
set statusline+=\ %{fugitive#statusline()}
set statusline+=\ %f
set statusline+=%#warningmsg#
set statusline+=%*

" Nerdtree settings
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
nnoremap <silent> <Leader>d :NERDTreeFind<CR>
nnoremap <Leader>f :NERDTreeToggle<Enter>

" vim-better-whitespace settings
autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

" rubocop
let g:vimrubocop_config = '~/wave/src/payroll/.rubocop.yml'
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
let g:syntastic_python_checkers = ['python3']
