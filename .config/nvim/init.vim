if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plug')

Plug 'itchyny/lightline.vim'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set backspace=indent,eol,start

set tabstop=2
set softtabstop=0
set expandtab
set shiftwidth=2
set smarttab
set autoindent
set copyindent

syntax on
set ruler
set number

nmap <C-R> :StripWhitespace<CR>:w<CR>

let g:lightline = { 'colorscheme': 'wombat' }

colorscheme wal

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

