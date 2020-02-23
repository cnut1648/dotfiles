"""""""""""""  option
set nu
set relativenumber
set incsearch
set ignorecase
set timeoutlen=1000
set shiftround
set shiftwidth=2
set hidden




""""""""""""""" normal

" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber!<CR>
nnoremap <silent> <leader>no :set relativenumber! nu!<CR>

" edit/reload init
nmap <silent> <leader>ev :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>rv :so ~/.config/nvim/init.vim<CR>



" consistent with D & C
nnoremap Y y$



" window management
" use kitty map ctrl+shift to alt+shift
nnoremap <M-S-V> <C-W><C-S>
nnoremap <M-S-G> <C-W><C-V>
" move to new tab
nnoremap <M-S-N> <C-W>T 
" create new window
nnoremap <M-S-M> <C-W>n 

nnoremap <M-S-h> <C-W>h
nnoremap <M-S-j> <C-W>j
nnoremap <M-S-k> <C-W>k
nnoremap <M-S-l> <C-W>l
nnoremap <M-S-P> <C-W>p
nnoremap <M-S-W> <C-W>w
nnoremap <M-S-B> <C-W>b
nnoremap <M-S-T> <C-W>t

nnoremap <M-S-Q> <C-W>q
nnoremap <M-S-A> <C-W>o


" use kitty send_text to map ctrl+shift+o to alt+shift+o
" terminal cannot recognize ctrl + shift
" nnoremap <m-s-o> O
" nnoremap <s-o> o

nnoremap <silent> <m-s-o> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <s-o> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
":map G :<C-U>echo v:count<CR>


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
inoremap <C-Z> <esc>ui

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
vnoremap <M-S-b> <Esc>Bi


" inoremap <C-j> <Down>
" inoremap <C-l> <Right>
" inoremap <C-k> <Up>
" inoremap <C-a> <C-o>0
" inoremap <C-e> <C-o>$


"""""""""" visual
vnoremap jk <Esc>



"""""""""" command
cnoremap w!! :w suda://%

"""""""""" terminal
tnoremap jk <C-\><C-N> 
tnoremap <Esc> <C-\><C-N> 




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


Plug 'lambdalisue/suda.vim'
let g:suda_smart_edit = 1
cnoremap w!! :w suda://%



Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
Plug 'ryanoasis/vim-devicons'



Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline#extensions#syntastic#enabled = 1

Plug 'godlygeek/tabular'

Plug 'tpope/vim-surround'





" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

let g:mapleader = "\<Space>"
let g:maplocalleader = ","

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>


Plug 'tpope/vim-commentary'
nmap <C-_> gcc



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
let g:airline#extensions#gutentags#enabled = 1
" remove unwanted ctags info
let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#prepend(airline#extensions#vista#currenttag(),0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'


Plug 'skywind3000/vim-preview'

Plug 'liuchengxu/vista.vim'
nmap <F8> :Vista!!<CR>
let g:airline#extensions#vista#enabled = 1





Plug 'mhinz/vim-startify'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

call plug#end()
