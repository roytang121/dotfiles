syntax on

background=dark
colorschem evening

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'chrisbra/matchit'
Plug 'preservim/nerdtree'

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

" NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
