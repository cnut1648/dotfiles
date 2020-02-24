"""""""""""""  option
set nu
set relativenumber
set incsearch
set ignorecase
set timeoutlen=500
set shiftround
set shiftwidth=2
set hidden

map <space> <leader>

""""""""""""""" normal


" edit/reload init
nmap <silent> <leader>xv :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>xr :so ~/.config/nvim/init.vim<CR>



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

nnoremap <M-_> <C-W>-
nnoremap <M-+> <C-W>+
nnoremap <M-<> <C-W><
nnoremap <M->> <C-W>>

" use kitty send_text to map ctrl+shift+o to alt+shift+o
" terminal cannot recognize ctrl + shift
" nnoremap <m-s-o> O
" nnoremap <s-o> o

nnoremap <silent> <m-s-o> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <s-o> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>


" tab management
nnoremap <C-t>     :tabnew<CR>
nnoremap <C-h>     :tabprevious<CR>
nnoremap <C-l>     :tabnext<CR>

" buffer/file management
nnoremap <C-j>     :bprevious<CR>
nnoremap <C-k>     :bnext<CR>



"""""""""""""   insert
inoremap <esc> <nop>
inoremap jk <esc>
inoremap <C-Z> <esc>ui

" Emacs mimic
inoremap <C-A> <Home>
inoremap <C-E> <End>

inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <M-f> <Esc>lwi
inoremap <M-b> <Esc>bi
inoremap <M-S-f> <Esc>lWi
inoremap <M-S-b> <Esc>Bi

inoremap <C-P> <Up>
inoremap <C-N> <Down>

inoremap <C-K> <Esc>lDa
inoremap <C-U> <Esc>d0xi
inoremap <C-Y> <Esc>Pa
inoremap <C-X><C-S> <Esc>:w<CR>a
inoremap <C-h> <Left>

inoremap <M-x> <Esc>:


" inoremap <C-j> <Down>
" inoremap <C-l> <Right>
" inoremap <C-k> <Up>
" inoremap <C-a> <C-o>0
" inoremap <C-e> <C-o>$


"""""""""" visual
" using jk slow down visual command
"vnoremap jk <Esc>



"""""""""" command
cnoremap w!! :w suda://%

"""""""""" terminal
" using jk in terminal slow down ranger
" tnoremap jk <C-\><C-N>
augroup vimrc_term
  autocmd!
  autocmd WinEnter term://* nohlsearch
  autocmd WinEnter term://* startinsert

  autocmd TermOpen * tnoremap <buffer> <M-S-h> <C-\><C-n><C-w>h
  autocmd TermOpen * tnoremap <buffer> <M-S-j> <C-\><C-n><C-w>j
  autocmd TermOpen * tnoremap <buffer> <M-S-k> <C-\><C-n><C-w>k
  autocmd TermOpen * tnoremap <buffer> <M-S-l> <C-\><C-n><C-w>l
  autocmd TermOpen * tnoremap <buffer> <M-S-q> <C-\><C-n>
augroup END



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

""""""""""""""""" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" beside coc
" coc-tabnine
" :CocInstall coc-tabnine

" coc-snippets
" :CocInstall coc-snippets

""""""""""""""""" syntastic check
Plug 'dense-analysis/ale'

""""""""""""""""" tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'liuchengxu/vista.vim'

""""""""""""""""" prettifier
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'mhinz/vim-startify'

""""""""""""""""" fuzzy search
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" coc-lists
" :CocInstall coc-lists

""""""""""""""""" file explorer
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" coc-explorer, tree-style
" :CocInstall coc-explorer

""""""""""""""""" misc
" neovim sudo writing
Plug 'lambdalisue/suda.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

""""""""""""""""" git
" coc-git
" :CocInstall coc-git

""""""""""""""""" async run
Plug 'skywind3000/asyncrun.vim'

""""""""""""""""" writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'reedes/vim-pencil'
Plug 'SidOfc/mkdx'

""""""""""""""""" menu
" On-demand lazy load
" load when calling function
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'skywind3000/vim-quickui'

""""""""""""""""" terminal
Plug 'voldikss/vim-floaterm'

call plug#end()


""""""""""""""""" lsp
" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" skip checking to boost startup
let g:python3_host_skip_check=1
let g:python3_host_prog = '/home/chris/miniconda3/bin/python'
let g:airline#extensions#coc#enabled = 1

""""""""""""""""" autocomplete



""""""""""""""""" syntastic check
" ale


""""""""""""""""" tags
" gutentags
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
"let g:airline_section_x = '%{airline#util#prepend("",0)}%{airline#util#prepend(airline#extensions#vista#currenttag(),0)}%{airline#util#prepend("",0)}%{airline#util#wrap(airline#parts#filetype(),0)}'


" vista.vim
nmap <F8> :Vista!!<CR>
let g:airline#extensions#vista#enabled = 1

""""""""""""""""" prettifier
" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Toggle Relative Number
nnoremap <silent> <leader>nb :set relativenumber! <CR>
nnoremap <silent> <leader>no :set relativenumber! nu!<bar> :IndentLinesToggle <CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

" vim-commentary
nmap <C-_> gcc


""""""""""""""""" fuzzy search
" LeaderF
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_WindowPosition = 'popup'
let g:Lf_CommandMap = {'<C-B>': ['<C-Down>'], '<Esc>': ['<C-C>']}
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--type-add web:*.{html,css,js}*",
        \ "--glob=!git/*",
        \ "--glob=!**/backup/*",
        \ "--glob=!**/application/*",
        \ "--glob=!**/app/*",
        \ "--hidden"
    \ ]
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>


""""""""""""""""" file explorer
" ranger
" disable default key
let g:ranger_map_keys = 0
" open file in new tab
" map <leader>k :RangerNewTab<CR>
map <leader>k :Ranger<CR>
" replace netrw
let g:ranger_replace_netrw = 1
" disable Indentline when entering terminal(ranger)
autocmd TermEnter * IndentLinesDisable

" coc-explorer
nmap <leader>e :CocCommand explorer --width 30<CR>


""""""""""""""""" misc
" suda.vim
" neovim sudo writing
let g:suda_smart_edit = 1
cnoremap w!! :w suda://%



""""""""""""""""" async run
" asyncrun
" height = 6
let g:asyncrun_open = 6
" ring bell after run
let g:asyncrun_bell = 1

nnoremap <F11> :call asyncrun#quickfix_toggle(6)<cr>
" unbuffer python output, so that live printing when output
let PYTHONUNBUFFERED=1

""""""""""""""""" writing
" goyo.vim
let g:goyo_width = 120
" limelight.vim
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
nmap <Leader>l :Goyo<CR>
xmap <Leader>l :Goyo<CR>
"进入goyo模式后自动触发limelight,退出后则关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"markdown-preview
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

""""""""""""""""" menu
" vim-which-key
" backspace going back
" after timeout open whichkey on <leader>
nnoremap <silent> <leader> :<C-u>WhichKey '<leader>'<CR>
" also can link to color used by search
" hi link WhichKeyFloating Search
hi WhichKeyFloating ctermbg=232

" vim-quickui
" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&New File\tCtrl+n", 'echo 0' ],
            \ [ "&Open File\t(F3)", 'echo 1' ],
            \ [ "&Close", 'echo 2' ],
            \ [ "--", '' ],
            \ [ "&Save\tCtrl+s", 'echo 3'],
            \ [ "Save &As", 'echo 4' ],
            \ [ "Save All", 'echo 5' ],
            \ [ "--", '' ],
            \ [ "E&xit\tAlt+x", 'echo 6' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ [ '&Copy', 'echo 1', 'help 1' ],
            \ [ '&Paste', 'echo 2', 'help 2' ],
            \ [ '&Find', 'echo 3', 'help 3' ],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
      \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
      \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
      \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
      \ ])

" register HELP menu with weight 10000
call quickui#menu#install('H&elp', [
      \ ["&Cheatsheet", 'help index', ''],
      \ ['T&ips', 'help tips', ''],
      \ ['--',''],
      \ ["&Tutorial", 'help tutor', ''],
      \ ['&Quick Reference', 'help quickref', ''],
      \ ['&Summary', 'help summary', ''],
      \ ], 10000)
call quickui#menu#install('&Markdown', [
            \ [ '&Focus', 'Goyo', 'use goyo & limelight' ],
            \ [ '&Preview', 'MarkdownPreview' ],
            \ ], '<auto>', 'md,markdown')

" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>


""""""""""""""""" menu

let g:floaterm_keymap_toggle = '<F10>'
function s:floatermSettings()
  hi FloatermNF guibg=black
  hi FloatermBorderNF guibg=gray guifg=blue
endfunction

let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_position = "auto"
"let g:floaterm_winblend = 0.3
autocmd FileType floaterm call s:floatermSettings()
