"""""""""""""  option
set nu
set relativenumber
set incsearch
set ignorecase
set timeoutlen=250



""""""""""""""" normal

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>
nnoremap <silent> <leader>no :set relativenumber! nu!<CR>



" consistent with D & C
nnoremap Y y$

" window management
nnoremap <C-w>g <C-W><C-V>
nnoremap <C-w>v <C-W><C-S>
nnoremap <C-w>m <C-W>T
nnoremap = <C-W>+
nnoremap - <C-W>-

" double tap to insert new line without insert mode
nnoremap oo moo<Esc>`o
nnoremap OO moO<Esc>`o


" tab management
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-j>     :tabprevious<CR>
nnoremap <C-k>     :tabnext<CR>

" file management
nnoremap <C-h>     :bprevious<CR>
nnoremap <C-l>     :bnext<CR>



"""""""""""""   insert

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



"""""""""" command



"""""""""" custom function
" Z - cd to recent / frequent directories
command! -nargs=* Z :call Z(<f-args>)
function! Z(...)
  let cmd = 'fasd -d -e printf'
  for arg in a:000
    let cmd = cmd . ' ' . arg
  endfor
  let path = system(cmd)
  if isdirectory(path)
    echo path
    exec 'cd' fnameescape(path)
  endif
endfunction



"""""""""  plug

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:python3_host_prog = '/home/chris/miniconda3/bin/python'



Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" disable default key
let g:ranger_map_keys = 0
" open file in new tab
map <leader>k :RangerNewTab<CR>
" replace netrw
let g:ranger_replace_netrw = 1 



Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
Plug 'ryanoasis/vim-devicons'



Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plug 'godlygeek/tabular'

Plug 'tpope/vim-surround'





" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

let g:mapleader = "\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>


Plug 'tpope/vim-commentary'


Plug 'skywind3000/quickmenu.vim'
noremap <silent><F12> :call quickmenu#toggle(0)<cr>
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "HL"


Plug 'skywind3000/asyncrun.vim'
let g:asyncrun_open = 6
" unbuffer python output, so that live printing when output
let PYTHONUNBUFFERED=1

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

" enable gtags module
let g:gutentags_modules = ['ctags', 'gtags_cscope']

" config project root markers.
let g:gutentags_project_root = ['.root']

" generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_cache_dir = expand('~/.cache/tags')

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1




Plug 'skywind3000/vim-preview'

Plug 'liuchengxu/vista.vim'
nmap <F8> :Vista!!<CR>

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

"set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

Plug 'mhinz/vim-startify'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()
