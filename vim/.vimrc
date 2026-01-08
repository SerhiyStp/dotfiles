"VIM-PLUG {{{
set nocompatible
call plug#begin()
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/everforest'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
"Plug 'Konfect/FastFold'
Plug 'itchyny/lightline.vim'
Plug 'tmhedberg/matchit'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()
"}}}
" Vim user interface {{{
syntax enable
filetype plugin indent on
let mapleader=","
nnoremap ; :
inoremap jk <Esc>
set autoread
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
set number
set showmode
set wildmenu
set encoding=utf-8
"}}}
" Colors {{{
colorscheme everforest
set background=dark
"set t_Co=256
set termguicolors
"}}}
" Tab and indent related {{{
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
" }}}
" Fortran {{{
let fortran_free_source=1
let fortran_do_enddo=1
let fortran_have_tabs=1
let fortran_fold=1
let fortran_fold_conditionals=1
autocmd FileType fortran set foldmethod=syntax
" }}}
" NerdTree {{{
nnoremap <C-n> :NERDTreeToggle $HOME <CR>
nnoremap <leader>n :NERDTreeFind <CR>
let g:NERDTreeDirArrows = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeIgnore=['\.aux$', '\.bbl$', '\.blg$', '\.synctex$', '\.fdb_latex$', '\.fls$', '\.asv$', '\~$', '\.pyc$', 'tags', '\.mat$']
" }}}
" Turn off swap files {{{
set noswapfile
set nobackup
set nowb
" }}}
" Status line {{{
set laststatus=2
" }}}
" Folding {{{
nnoremap <space> za
" }}}
" Moving around {{{
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
vnoremap < <gv
vnoremap > >gv
" }}}
" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-l>"
" }}}
" vim:foldmethod=marker:foldlevel=0

