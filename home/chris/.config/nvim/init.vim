set nu
set relativenumber
set incsearch
set ignorecase
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>

inoremap jk <esc>

inoremap <esc> <nop>
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-k> <Up>





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

call plug#end()
