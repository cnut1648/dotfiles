"""""""""""""  option
set nu
set relativenumber
set incsearch
set ignorecase
set timeoutlen=500
set shiftround
set shiftwidth=4
set softtabstop=4
set hidden
set tabstop=4
set expandtab
set termguicolors
set cmdheight=2


" whichkey requires mapleader value
let g:mapleader = "\\"
map <Space> <leader>
" disable matchit
let g:loaded_matchit = 1

""""""""""""""" normal


" edit/reload init
nmap <silent> <leader>xv :e ~/.config/nvim/init.vim<CR>
nmap <silent> <leader>xr :w <bar> :so ~/.config/nvim/init.vim<CR>



" consistent with D & C
nnoremap Y y$

" auto indent when paste
nnoremap p p`[v`]=
nnoremap P P`[v`]=


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
" equivalent <C-S-M> create new buffer as vertical
" split and <C-S-N> send it to new tab
nnoremap <M-S-P> <C-W>T



nnoremap <M-S-Q> <C-W>q
nnoremap <M-S-A> <C-W>o

noremap <M-_> <C-W>-
nnoremap <M-+> <C-W>+
nnoremap <M-<> <C-W><
nnoremap <M->> <C-W>>

" use kitty send_text to map ctrl+shift+o to alt+shift+o
" terminal cannot recognize ctrl + shift
" nnoremap <m-s-o> O
" nnoremap <s-o> o
nnoremap oo o
nnoremap OO O

nnoremap <silent> o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" tab management
nnoremap <C-p>     :tabnew<CR>
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

inoremap <C-I> <Esc>lDa
inoremap <C-H> <BS>
inoremap <C-U> <Esc>d0xi
inoremap <C-X><C-S> <Esc>:w<CR>a
inoremap <M-x> <Esc>:


" inoremap <C-j> <Down>
" inoremap <C-l> <Right>
" inoremap <C-k> <Up>
" inoremap <C-a> <C-o>0
" inoremap <C-e> <C-o>$
"""""""""" visual
" using jk slow down visual command
"vnoremap jk <Esc>
" align line remain selected
vnoremap > >gv
vnoremap < <gv
vnoremap = =gv



"""""""""" command
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <BS>
" cnoremap <expr> <TAB> pumvisible ? "\<C-n>" : "\<c-p>"




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
    " reset gui color to make terminal prettier
    autocmd TermOpen * set termguicolors&
    autocmd TermEnter * set termguicolors&
    autocmd TermLeave * set termguicolors
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


" Strip trailing whitespace and newlines on save
fun! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    %s/\($\n\s*\)\+\%$//e
    call cursor(l, c)
endfun

""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
"""""""""  plug
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')




""""""""""""""""""""""""""""""
""""""""""""""""" lsp
""""""""""""""""""""""""""""""



Plug 'neoclide/coc.nvim', {'branch': 'release'}
" beside coc
" coc-tabnine
" :CocInstall coc-tabnine

" coc-snippets
" :CocInstall coc-snippets
" coc-emmet
" :CocInstall coc-emmet
Plug 'honza/vim-snippets'
" coc-python
" :CocInstall coc-python

" coc-calc
" :CocInstall coc-calc

""""""""""""""""""""""""""""""
""""""""""""""""" syntastic check
""""""""""""""""""""""""""""""

Plug 'dense-analysis/ale'




""""""""""""""""""""""""""""""
""""""""""""""""" tags
""""""""""""""""""""""""""""""

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'liuchengxu/vista.vim'



""""""""""""""""""""""""""""""
""""""""""""""""" prettifier
""""""""""""""""""""""""""""""

" colorscheme
Plug 'arcticicestudio/nord-vim'
Plug 'iCyMind/NeoSolarized'
Plug 'morhetz/gruvbox'

" format
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'sbdchd/neoformat'
Plug 'prettier/vim-prettier'
Plug 'ntpeters/vim-better-whitespace'
" coc-highlight
" :CocInstall coc-highlight

""""""""""""""""""""""""""""""
""""""""""""""""" fuzzy search
""""""""""""""""""""""""""""""


Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" coc-lists
" :CocInstall coc-lists



""""""""""""""""""""""""""""""
""""""""""""""""" file explorer
""""""""""""""""""""""""""""""


Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
" coc-explorer, tree-style
" :CocInstall coc-explorer



""""""""""""""""""""""""""""""
""""""""""""""""" misc
""""""""""""""""""""""""""""""
" function

Plug 'itchyny/calendar.vim'
" neovim sudo :w
Plug 'lambdalisue/suda.vim'
" better exit
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'mtth/scratch.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-peekaboo'
Plug 'simnalamburt/vim-mundo'
Plug 'segeljakt/vim-isotope'
" coc-yank
" :CocInstall coc-yank

" textobj
Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
" swap function arguments
Plug 'machakann/vim-swap'
" coc-pairs
" :CocInstall coc-pairs

" window

" auto-resize window width
Plug 'dm1try/golden_size'
Plug 't9md/vim-choosewin'


" motion
Plug 'tpope/vim-commentary'
Plug 'nelstrom/vim-visual-star-search'
Plug 'justinmk/vim-sneak'
Plug 'unblevable/quick-scope'
Plug 'terryma/vim-multiple-cursors'
Plug 'chaoren/vim-wordmotion'
Plug 'rhysd/accelerated-jk'
Plug 'psliwka/vim-smoothie'
Plug 'haya14busa/vim-edgemotion'



""""""""""""""""""""""""""""""
""""""""""""""""" git
""""""""""""""""""""""""""""""


" coc-git
" :CocInstall coc-git



""""""""""""""""""""""""""""""
""""""""""""""""" async run
""""""""""""""""""""""""""""""


Plug 'skywind3000/asyncrun.vim'



""""""""""""""""""""""""""""""
""""""""""""""""" writing
""""""""""""""""""""""""""""""


Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'reedes/vim-pencil'
Plug 'SidOfc/mkdx'
" check weak word
Plug 'reedes/vim-wordy'
" better spell check
Plug 'reedes/vim-lexical'
" autocorrect based on abbrev
Plug 'reedes/vim-litecorrect'
" highlight overuse word
Plug 'dbmrq/vim-ditto'


""""""""""""""""""""""""""""""
""""""""""""""""" menu
""""""""""""""""""""""""""""""


" On-demand lazy load
" load when calling function
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'skywind3000/vim-quickui'


""""""""""""""""""""""""""""""
""""""""""""""""" terminal
""""""""""""""""""""""""""""""

Plug 'voldikss/vim-floaterm'

call plug#end()


""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""
""""""""""""""""" lsp
""""""""""""""""""""""""""""""


" coc.nvim
" inore:map <silent><expr> <TAB>
"             \ pumvisible() ? "\<C-n>" :
"             \ <SID>check_back_space() ? "\<TAB>" :
"             \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" skip checking to boost startup
let g:python3_host_skip_check=1
let g:python3_host_prog = '/home/chris/miniconda3/bin/python'
let g:airline#extensions#coc#enabled = 1

"coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:coc_snippet_next = '<tab>'

""""""""""""""""""""""""""""""
""""""""""""""""" syntastic check
""""""""""""""""""""""""""""""


" ale


""""""""""""""""""""""""""""""
""""""""""""""""" tags
""""""""""""""""""""""""""""""


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

let g:gutentags_plus_nomap = 1
" symbol
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" symbol def
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" function calls this func under cursor
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" text str
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" egrep pattern
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" file name
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" files that #include filename under cursor
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" functions called by func under cursor
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" places symbol assign
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
" current word in ctags database
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" when in git folder when exit throw error
" thus fixing
au FileType gitcommit,gitrebase let g:gutentags_enabled=0




" vista.vim
nmap <F8> :Vista!!<CR>
let g:airline#extensions#vista#enabled = 1



""""""""""""""""""""""""""""""
""""""""""""""""" prettifier
""""""""""""""""""""""""""""""

" nord colorscheme
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_cursor_line_number_background = 1
let g:nord_bold_vertical_split_line = 1
augroup nord-overrides
  autocmd!
  autocmd ColorScheme nord highlight LineNr ctermfg=none guifg=#D8DEE9
  autocmd ColorScheme nord highlight CursorLineNr ctermfg=none guifg=#D8DEE9
  autocmd ColorScheme nord highlight Comment ctermfg=none guifg=#98971a
augroup end
" config must before colorscheme
colorscheme nord



" indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Toggle Relative Number
nnoremap <silent> <leader>ob :set relativenumber! <CR>
nnoremap <silent> <leader>oo :set relativenumber! nu!<bar> :IndentLinesToggle <CR>

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'
let g:airline_highlighting_cache = 1
" vim-commentary
nmap <C-_> gcc

" better whitespace
let g:better_whitespace_ctermcolor='yellow'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1


" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""
""""""""""""""""" fuzzy search
""""""""""""""""""""""""""""""




" LeaderF
let g:Lf_ShortcutB = "<leader>fb"
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
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
noremap <leader>fF :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>

" coc-list

command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>

function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction

" Keymapping for grep word under cursor with interactive mode
nnoremap <silent> <Leader>cf :exe 'CocList -I --input='.expand('<cword>').' grep'<CR>



""""""""""""""""""""""""""""""
""""""""""""""""" file explorer
""""""""""""""""""""""""""""""


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


""""""""""""""""""""""""""""""
""""""""""""""""" misc
""""""""""""""""""""""""""""""

" function

" suda.vim
" neovim sudo writing
let g:suda_smart_edit = 1
cnoremap w!! :w suda://%

" mundo
set undofile
set undodir=~/.config/nvim/undo
nnoremap <F4> :MundoToggle<CR>
let g:mundo_width = 30
let g:mundo_preview_height = 40
let g:mundo_right = 0


" coc-yank
nnoremap <silent> <leader>cy  :<C-u>CocList -A --normal yank<cr>

" scratch
let g:scratch_no_mappings = 1
" after exit insert hide
let g:scratch_insert_autohide = 1
let g:scratch_filetype = 'markdown'
" save when hide, thus persist after exiting vim
let g:scratch_persistence_file = '~/.config/nvim/scratch.md'

nmap <leader>xs <plug>(scratch-insert-reuse)
xmap <leader>xs <plug>(scratch-selection-reuse)

" textobj

" matchup
" always highlight surrounding
" let g:matchup_matchparen_deferred = 1
" let g:matchup_matchparen_hi_surround_always = 1


" sandwich
" surround settings
runtime macros/sandwich/keymap/surround.vim
" default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" buns: surround textobj
" external: surround not same textobj (eg. \begin \end)
" surround-like add space to ( { [
let g:sandwich#recipes += [
            \   {'buns': ['{ ', ' }'],'nnoremap':1, 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
            \   {'buns': ['[ ', ' ]'],'nnoremap':1, 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
            \   {'buns': ['( ', ' )'],'nnoremap':1,'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
            \   {'buns': ['{\s*', '\s*}'],  'nnoremap':1, 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']},
            \   {'buns': ['\[\s*', '\s*\]'], 'nnoremap':1, 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']},
            \   {'buns': ['(\s*', '\s*)'],  'nnoremap':1, 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']},
            \ ]
xmap id <Plug>(textobj-sandwich-query-i)
xmap ad <Plug>(textobj-sandwich-query-a)
omap id <Plug>(textobj-sandwich-query-i)
omap ad <Plug>(textobj-sandwich-query-a)

xmap idd <Plug>(textobj-sandwich-auto-i)
xmap add <Plug>(textobj-sandwich-auto-a)
omap idd <Plug>(textobj-sandwich-auto-i)
omap add <Plug>(textobj-sandwich-auto-a)

xmap im <Plug>(textobj-sandwich-literal-query-i)
xmap am <Plug>(textobj-sandwich-literal-query-a)
omap im <Plug>(textobj-sandwich-literal-query-i)
omap am <Plug>(textobj-sandwich-literal-query-a)

" window

" vim-choosewin
" s swap with
" [ ] switch between tabs
" 0 $ 1st, 2nd tabs
nmap  -  <plug>(choosewin)
let g:choosewin_overlay_enable = 1

" motion

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" first occurrence
hi QuickScopePrimary guifg='red' gui=underline ctermfg=155 cterm=underline
" second occurrence
hi QuickScopeSecondary guifg='yellow'  gui=underline ctermfg=81 cterm=underline

" edgemotion
nmap <m-j> <Plug>(edgemotion-j)
nmap <m-k> <Plug>(edgemotion-k)

" sneak
let g:sneak#label=1

" wordmotion
nmap dw de
nmap cw ce


" accelerated
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)



""""""""""""""""""""""""""""""
""""""""""""""""" async run
""""""""""""""""""""""""""""""


" asyncrun
" height = 6
let g:asyncrun_open = 6
" ring bell after run
let g:asyncrun_bell = 1

nnoremap <F11> :call asyncrun#quickfix_toggle(6)<cr>
" unbuffer python output, so that live printing when output
let PYTHONUNBUFFERED=1



""""""""""""""""""""""""""""""
""""""""""""""""" writing
""""""""""""""""""""""""""""""




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
nmap <F5> :Goyo<CR>
xmap <F5> :Goyo<CR>
"进入goyo模式后自动触发limelight,退出后则关闭
autocmd! User GoyoEnter Limelight | set eventignore=FocusGained
autocmd! User GoyoLeave Limelight! | :call QuickThemeChange("") | set eventignore=

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
let g:mkdp_command_for_global = 1

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


" mkdx
" :h mkdx-settings
let g:mkdx#settings = {
            \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
            \ 'fold': { 'enable': 1  },
            \ 'restore_visual':          1,
            \ 'enter':                   { 'enable': 1, 'malformed': 1, 'o': 1,
            \                              'shifto': 1, 'shift': 1 },
            \ 'map':                     { 'prefix': '<leader>', 'enable': 1 },
            \ 'tokens':                  { 'enter': ['-', '*', '>'],
            \                              'bold': '**', 'italic': '*', 'strike': '',
            \                              'list': '-', 'fence': '',
            \                              'header': '#' },
            \ 'checkbox':                { 'toggles': [' ', '-', 'x'],
            \                              'update_tree': 2,
            \                              'initial_state': ' ' },
            \ 'toc':                     { 'text': "TOC", 'list_token': '-',
            \                              'update_on_write': 1,
            \                              'position': 0,
            \                              'details': {
            \                                 'enable': 0,
            \                                 'summary': 'Click to expand {{toc.text}}',
            \                                 'nesting_level': -1,
            \                                 'child_count': 5,
            \                                 'child_summary': 'show {{count}} items'
            \                              }
            \                            },
            \ 'table':                   { 'divider': '|',
            \                              'header_divider': '-',
            \                              'align': {
            \                                 'left':    [],
            \                                 'center':  [],
            \                                 'right':   [],
            \                                 'default': 'center'
            \                              }
            \                            },
            \ 'links':                   { 'external': {
            \                                 'enable': 1, 'timeout': 3, 'host': '', 'relative': 1,
            \                                 'user_agent':  'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.9.1'
            \                              },
            \                              'fragment': {
            \                                 'jumplist': 1,
            \                                 'complete': 1
            \                              }
            \                            },
            \ 'highlight':               { 'enable': 1 },
            \ 'auto_update':             { 'enable': 0 },
            \ }

" pencil&lexico
" disable spell-check by default
" toggle builtin spell check also enable lexical
let g:lexical#spell = 0
let g:lexical#dictionary = ['/usr/share/dict/usa','/usr/share/dict/brtish']
let g:lexical#thesaurus = ['/usr/share/dict/mthesaur.txt']


" stop autoformat when editing md fence
" whitelist override black, thus when black doesn't dominate entire line, thus
" autoformat inline conde/links
let g:pencil#autoformat_config = {
        \   'markdown': {
        \     'black': [
        \       'htmlH[0-9]',
        \       'markdown(Code|H[0-9]|Url|IdDeclaration|Link|Rule|Highlight[A-Za-z0-9]+)',
        \       'markdown(FencedCodeBlock|InlineCode)',
        \       'mkd(Code|Rule|Delimiter|Link|ListItem|IndentCode)',
        \       'mmdTable[A-Za-z0-9]*',
        \     ],
        \     'white': [
        \      'markdown(Code|Link)',
        \     ],
        \   },
        \ }

function s:prose()
    call pencil#init()
    call lexical#init({'spell':1})
    call litecorrect#init()
    " disable coc-pairs
    let b:coc_pairs_disabled = ['`']
    let g:pencil#autoformat = 1
    " manual formatting
    " format hard wrap linebreak to multi-line
    nnoremap <buffer> <silent> Q gqap
    xnoremap <buffer> <silent> Q gq
    nnoremap <buffer> <silent> <leader>Q vapJgqap
    let g:airline_section_x = '%{PencilMode()}'
    " conceal __markup__
    let g:pencil#conceallevel = 3     " 0=disable, 1=one char, 2=hide char, 3=hide all (def)
    let g:pencil#concealcursor = 'c'  " n=normal, v=visual, i=insert, c=command (def)
    let g:pencil#mode_indicators = {'hard': 'Ъ', 'auto': 'ª', 'soft': '⤸', 'off': '',}

    " common punctuation
    iabbrev <buffer> -- –
    iabbrev <buffer> --- —
    iabbrev <buffer> << «
    iabbrev <buffer> >> »

endfunction
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text call s:prose()
augroup END


" wordy
let g:wordy#ring = [
  \ 'weak',
  \ ['being', 'passive-voice', ],
  \ 'business-jargon',
  \ 'weasel',
  \ 'puffery',
  \ ['problematic', 'redundant', ],
  \ ['colloquial', 'idiomatic', 'similies', ],
  \ 'art-jargon',
  \ ['contractions', 'opinion', 'vague-time', 'said-synonyms', ],
  \ 'adjectives',
  \ 'adverbs',
  \ ]




""""""""""""""""""""""""""""""
""""""""""""""""" menu
""""""""""""""""""""""""""""""
" vim-which-key
" backspace going back
" after timeout open whichkey on <leader>

hi WhichKeyFloating ctermbg=232 guibg=#171f4a guifg=68
hi WhichKeySeperator guifg=#aaff96 guibg=#171f4a
hi WhichKeyDesc ctermfg=68 guifg='green'
hi WhichKey guifg=#ee03ff guibg=#171f4a
let g:which_key_use_floating_win=1
let g:which_key_exit = ["\<C-C>", "\<Esc>", "\<C-D>"]
" uppercase key
let g:which_key_display_names = {
      \ ' '         : '□'      ,
      \ '<CR>'      : '↵'      ,
      \ '<BS>'      : '⌫'      ,
      \ '<TAB>'     : '⇆'      ,
      \ '<C-SPACE>' : 'Ctrl-□' ,
      \ 'B' : '฿' ,
      \ 'C' : '₵' ,
      \ 'E' : 'Ꮛ' ,
      \ 'F' : 'Ϝ' ,
      \ 'K' : '₭' ,
      \ 'O' : 'ට' ,
      \ 'P' : '₱' ,
      \ 'G' : 'Ꮆ' ,
      \ 'X' : 'Ж' ,
      \ }



" use native command like gg when keymap not found
let g:which_key_fallback_to_native_key=1
nmap <silent> g :<C-u>WhichKey 'g'<CR>

autocmd! FileType which_key
autocmd FileType which_key :call QuickThemeChange("")

let g:which_key_map =  {}

let g:which_key_map['name'] = '*****Root*****'
let g:which_key_map['*'] = 'which_key_ignore'
let g:which_key_map['g'] = {
            \'name' : '+gutentags',
            \'s' : 'symbol',
            \'g' : 'symbol def',
            \'c' : 'function calls this func under cursor',
            \'t' : 'text str',
            \'e' : 'egrep pattern',
            \'f' : 'file name',
            \'i' : 'files that #include filename under cursor',
            \'d' : 'functions called by func under cursor',
            \'a' : 'places symbol assign',
            \'z' : 'current word in ctags database',
            \}
let g:which_key_map['b'] = {'name':'+buffer'}
let g:which_key_map['c'] = {
            \'name':'+coc',
            \}
let g:which_key_map['f'] = {
            \'name':'+leaderf',
            \'f':'file',
            \'b':'buffer',
            \'l':'line',
            \'m':'recent file',
            \'F':'function',
            \'t':'tag',
            \}
let g:which_key_map['o'] = {'name':'+option'}
let g:which_key_map['x'] = {'name':'+files'}

" which_key translate leader to value of mapleader, that is, \
" lazy load thus register callable only when into this vim-which-key event
autocmd! User vim-which-key call which_key#register('\', "g:which_key_map")

nmap <silent> <leader> :<C-u>WhichKey '<leader>'<CR>




" vim-quickui
" clear all the menus
call quickui#menu#reset()

" install a 'File' menu, use [text, command] to represent an item.
call quickui#menu#install('&File', [
            \ [ "&Open File", 'tabe' ],
            \ [ "&Close\t(:bd)", 'Bclose' ],
            \ [ "&Save\t(:w)", 'write'],
            \ [ "--", '' ],
            \ [ "LeaderF &File", 'Leaderf file', 'Open file with leaderf'],
            \ [ "LeaderF &Mru", 'Leaderf mru --regexMode', 'Open recently accessed files'],
            \ [ "LeaderF &Buffer", 'Leaderf buffer', 'List current buffers in leaderf'],
            \ [ "--", '' ],
            \ [ "E&xit\t(:qa)", 'qa' ],
            \ ])

" items containing tips, tips will display in the cmdline
call quickui#menu#install('&Edit', [
            \ ['Copyright &Header', 'call feedkeys("\<esc> ec")', 'Insert copyright information at the beginning'],
            \ ['&Trailing Space', 'call StripTrailingWhitespace()', ''],
            \ ['Update &ModTime', 'call UpdateLastModified()', ''],
            \ ['&Paste Mode Line', 'PasteVimModeLine', ''],
            \ ['Format J&son', '%!python -m json.tool', ''],
            \ ['--'],
            \ ['&Align Table', 'Tabularize /|', ''],
            \ ['Align &Cheatsheet', 'MyCheatSheetAlign', ''],
            \ ])

call quickui#menu#install('&Symbol',[
            \["&GrepWord\t(InProject)",'callMenuHelp_GrepCode()','Grepkeywordincurrentproject'],
            \["--",],
            \["Find&Definition\t(GNUGlobal)",'callMenuHelp_Gscope("g")','GNUGlobalsearchg'],
            \["Find&Symbol\t(GNUGlobal)",'callMenuHelp_Gscope("s")','GNUGloalsearchs'],
            \["Find&Calledby\t(GNUGlobal)",'callMenuHelp_Gscope("d")','GNUGlobalsearchd'],
            \["FindC&alling\t(GNUGlobal)",'callMenuHelp_Gscope("c")','GNUGlobalsearchc'],
            \["Find&FromCtags\t(GNUGlobal)",'callMenuHelp_Gscope("z")','GNUGlobalsearchc'],
            \["--",],
            \["GotoD&efinition\t(YCM)",''],
            \["Goto&References\t(YCM)",''],
            \["GetD&oc\t(YCM)",'',],
            \["Get&Type\t(YCM)",''],
            \])


call quickui#menu#install('&Move', [
            \ ["Quickfix &First\t:cfirst", 'cfirst', 'quickfix cursor rewind'],
            \ ["Quickfix L&ast\t:clast", 'clast', 'quickfix cursor to the end'],
            \ ["Quickfix &Next\t:cnext", 'cnext', 'cursor next'],
            \ ["Quickfix &Previous\t:cprev", 'cprev', 'quickfix cursor previous'],
            \ ])

call quickui#menu#install("&Build", [
            \ ["File &Execute\tF5", 'AsyncTask file-run'],
            \ ["File &Compile\tF9", 'AsyncTask file-build'],
            \ ["File E&make\tF7", 'AsyncTask emake'],
            \ ["File &Start\tF8", 'AsyncTask emake-exe'],
            \ ['--', ''],
            \ ["&Project Build\tShift+F9", 'AsyncTask project-build'],
            \ ["Project &Run\tShift+F5", 'AsyncTask project-run'],
            \ ["Project &Test\tShift+F6", 'AsyncTask project-test'],
            \ ["Project &Init\tShift+F7", 'AsyncTask project-init'],
            \ ['--', ''],
            \ ['E&dit Task', 'AsyncTask -e'],
            \ ['Edit &Global Task', 'AsyncTask -E'],
            \ ['&Stop Building', 'AsyncStop'],
            \ ])

call quickui#menu#install("&Git", [
            \ ['&View Diff', 'call svnhelp#svn_diff("%")'],
            \ ['&Show Log', 'call svnhelp#svn_log("%")'],
            \ ['File &Add', 'call svnhelp#svn_add("%")'],
            \ ])

call quickui#menu#install('&Tools', [
            \ ['Compare &History', 'call svnhelp#compare_ask_file()', ''],
            \ ['&Compare Buffer', 'call svnhelp#compare_ask_buffer()', ''],
            \ ['--',''],
            \ ['List &Buffer', 'call quickui#tools#list_buffer("FileSwitch tabe")', ],
            \ ['List &Function', 'call quickui#tools#list_function()', ],
            \ ['Display &Messages', 'call quickui#tools#display_messages()', ],
            \ ['--',''],
            \ ["&DelimitMate %{get(b:, 'delimitMate_enabled', 0)? 'Disable':'Enable'}", 'DelimitMateSwitch'],
            \ ['Read &URL', 'call menu#ReadUrl()', 'load content from url into current buffer'],
            \ ['&Spell %{&spell? "Disable":"Enable"}', 'set spell!', 'Toggle spell check %{&spell? "off" : "on"}'],
            \ ['&Profile Start', 'call MonitorInit()', ''],
            \ ['Profile S&top', 'call MonitorExit()', ''],
            \ ["Relati&ve number %{&relativenumber? 'OFF':'ON'}", 'set relativenumber!'],
            \ ["Proxy &Enable", 'call MenuHelp_Proxy(1)', 'setup http_proxy/https_proxy/all_proxy'],
            \ ["Proxy D&isable", 'call MenuHelp_Proxy(0)', 'clear http_proxy/https_proxy/all_proxy'],
            \ ])

call quickui#menu#install('&Plugin', [
            \ ["&Ranger\t<leader>k", 'Ranger', 'toggle Ranger'],
            \ ["&CoC-explorer\t<leader>e", 'CocCommand explorer', 'toggle explorer'],
            \ ["-"],
            \ ["&Browse in github\trhubarb", "Gbrowse", "using tpope's rhubarb to open browse and view the file"],
            \ ["&Startify", "Startify", "using tpope's rhubarb to open browse and view the file"],
            \ ["&Gist", "Gist", "open gist with mattn/gist-vim"],
            \ ["&Edit Note", "Note", "edit note with vim-notes"],
            \ ["&Display Calendar", "Calendar", "display a calender"],
            \ ["Toggle &Floaterm\t(F10)", 'FloatermToggle', 'floatting term'],
            \ ["Toggle &Vista\t(F8)", 'Vista!!', 'explore tags'],
            \ ["Toggle &Mundo Tree\t(F4)", 'MundoToggle', 'undo tree'],
            \ ["-"],
            \ ["Plugin &List", "PlugStatus", "Update list"],
            \ ["Plugin &Update", "PlugUpdate", "Update plugin"],
            \ ])

" script inside %{...} will be evaluated and expanded in the string
call quickui#menu#install("&Option", [
            \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
            \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
            \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
            \ ["-"],
            \ ['Set &GUI %{&termguicolors? "Off":"On"}', 'set termguicolors!'],
            \ ])


" register HELP menu with weight 10000
call quickui#menu#install('Help (&?)', [
            \ ["&Index", 'tab help index', ''],
            \ ['Ti&ps', 'tab help tips', ''],
            \ ['--',''],
            \ ["&Tutorial", 'tab help tutor', ''],
            \ ['&Quick Reference', 'tab help quickref', ''],
            \ ['&Summary', 'tab help summary', ''],
            \ ['--',''],
            \ ['&Vim Script', 'tab help eval', ''],
            \ ['&Function List', 'tab help function-list', ''],
            \ ['&Dash Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
            \ ], 10000)


let g:context_menu_k = [
            \ ["&Peek Definition\tAlt+;", 'call quickui#tools#preview_tag("")'],
            \ ["S&earch in Project\t\\cx", 'exec "silent! GrepCode! " . expand("<cword>")'],
            \ [ "--", ],
            \ [ "Find &Definition\t\\cg", 'call MenuHelp_Fscope("g")', 'GNU Global search g'],
            \ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
            \ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
            \ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
            \ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
            \ [ "--", ],
            \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
            \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
            \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
            \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
            \ [ "--", ],
            \ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
            \ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
            \ ]

call quickui#menu#install('&Writing', [
            \ [ "&Focus\t(F5)", 'Goyo', 'use goyo & limelight' ],
            \ [ '&Preview', 'MarkdownPreview' ],
            \ [ "--", ],
            \ ['&Next Wordy', 'NextWordy'],
            \ ['No &Wordy', 'NoWordy'],
            \ [ "--", ],
            \ ['&Ditto', 'Ditto'],
            \ ], '<auto>', 'text,md,markdown')


" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" hit space twice to open menu
noremap <silent> <space><space> :call quickui#menu#open()<cr>

nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

""""""""""""""""""""""""""""""
""""""""""""""""" terminal
""""""""""""""""""""""""""""""

let g:floaterm_keymap_toggle = '<F10>'
function s:floatermSettings()
    hi FloatermNF guibg=black
    hi FloatermBorderNF guibg=gray guifg=blue
endfunction
autocmd FileType floaterm call s:floatermSettings()
