set nu
set relativenumber
set incsearch
set ignorecase
set timeoutlen=200

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>
nnoremap <silent> <leader>no :set relativenumber! nu!<CR>



nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" consistent with D & C
nnoremap Y y$




" double tap to insert new line without insert mode
nnoremap oo moo<Esc>`o
nnoremap OO moO<Esc>`o



inoremap <esc> <nop>
inoremap jk <esc>
inoremap JK <esc>

" Emacs mimic
inoremap <C-A> <Home>
inoremap <C-B> <Left>
inoremap <C-E> <End>
inoremap <C-F> <Right>
inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a
inoremap <C-h> <Left>

inoremap <M-x> <Esc>:
inoremap <M-f> <Esc>lwi
inoremap <M-b> <Esc>bi
inoremap <M-S-f> <Esc>lWi
inoremap <M-S-b> <Esc>Bi


" inoremap <C-j> <Down>
" inoremap <C-l> <Right>
" inoremap <C-k> <Up>
" inoremap <C-a> <C-o>0
" inoremap <C-e> <C-o>$



call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug '/usr/bin/fzf'


Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf'

Plug 'deoplete-plugins/deoplete-jedi'
let g:python3_host_prog = '/home/chris/miniconda3/bin/python'


call plug#end()
