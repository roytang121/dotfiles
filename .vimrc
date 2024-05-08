syntax on

set background=dark
" colorscheme evening

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/matchit'

call plug#end()

set hlsearch
set incsearch
set smarttab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set ignorecase
set scrolloff=10
set nu
set rnu
set nocp
set clipboard^=unnamed,unnamedplus
set noswapfile
