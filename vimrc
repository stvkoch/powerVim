" = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"
" 1 - vim configurations
" 2 - plugins
" 3 - functions
" 4 - plugins config
" 5 - maps
" 6 - sources
" 7 - claude code integration
"
"
"
" by Steven Koch
"
" = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =




"
" 1- vim configurations = = = = = = = = = = = = = = = = = = = = = = = =
"

let $tempFile = tempname()
let $ctagTempFile = $tempFile
" echo "Indexing ctags to " . $ctagTempFile
" let output = system("~/.powerVim/ctags/indexed.sh ".$ctagTempFile)

set tags=$ctagTempFile

set nocompatible
filetype off
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=50
set incsearch
set laststatus=2
set ruler
set showcmd
set wildmenu
set autoread
set encoding=utf-8
set tabstop=4 shiftwidth=4 expandtab
set listchars=tab:▒░,trail:▓
set list
set number
set hlsearch
set ignorecase
set smartcase
if has('mouse')
  set mouse=a
endif
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview
let mapleader = '\'
"highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=80
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
"set t_Co=256

let &path = getcwd() . '/**'

" files types like:
" au BufNewFile,BufRead *.tag set filetype=javascript " tags is javascript files

"
" vim configurations = = = = = = = = = = = = = = = = = = = = = = = =
"






"
" 2 - plugins = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"
"vundle plugin manager
set rtp+=~/.powerVim/bundle/vundle/
call vundle#begin('~/.powerVim/bundle')
Plugin 'gmarik/vundle'

" -- navigation & files
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'jremmen/vim-ripgrep'

" -- git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'wfxr/minimap.vim'

" -- editing
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'mg979/vim-visual-multi'
Plugin 'junegunn/vim-easy-align'
Plugin 'dhruvasagar/vim-table-mode'

" -- ui & statusline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'flazz/vim-colorschemes'
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'angamaiton/vim-snazzy'
if executable('ctags')
  Plugin 'preservim/tagbar'
endif

" -- linting & formatting
Plugin 'dense-analysis/ale'
Plugin 'prettier/vim-prettier'

" -- language support
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'JulesWang/css.vim'
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'honza/vim-snippets'

call vundle#end()


"
" 3 - functions = = = = = = = = = = = = = = = = = = = = = = = = = 
"
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

command FormatJson :%!python -m json.tool
command FormatPerl :%!perltidy -q<CR>
command ShowSpecialCharacteres :set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif
    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif
    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

"
" functions = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"





"
" 4 - plugins config = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"
" colorscheme monokai-phoenix
" colorscheme molokai_dark
" colorscheme snazzy
" colorscheme southernlights
colorscheme solarized
" colorscheme gotham
" colorscheme flattened_dark
" colorscheme mustang
let g:solarized_termcolors=256
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

let g:ale_linters = {'javascript': ['eslint']}


if has('autocmd')
  filetype plugin indent on
  autocmd VimEnter * NERDTree
  autocmd VimEnter * if argc() | wincmd p | endif
endif


" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/node_modules/*
" g:ctrlp_root_markers
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 2


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline_theme             = 'molokai'
let g:airline_theme             = 'solarized'
" let g:airline#extensions#syntastic#enabled = 1


" NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeWinSize = 20


" Tagbar
"let g:tagbar_ctags_bin='/usr/local/bin/ctags' " Proper Ctags locations
let g:tagbar_width=20                          " Default is 40, seems too wide
" let g:tagbar_autoclose=1
noremap <silent> <Leader>y :TagbarToggle








"indentLine
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239


set omnifunc=syntaxcomplete#Complete
set completeopt=menuone,menu,longest




" plugins config = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"





"
" 5 - maps = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Find
map <C-f> /
map <Space> :nohlsearch<CR>/

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" comment / decomment & normal comment behavior
vmap <C-m> gc

" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y

" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>

nnoremap <C-h>  :tabprevious<CR>
inoremap <C-h>  <Esc>:tabprevious<CR>i
nnoremap <C-l>  :tabnext<CR>
inoremap <C-l>  <Esc>:tabnext<CR>i
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t>  <Esc>:tabnew<CR>i
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i
" lazy ':'
map , :


" Don't use Ex mode, use Q for formatting
map Q gq
" exit insert mode
inoremap <C-c> <Esc>

map ,, :set paste<CR><ESC>i
nnoremap <Leader>o :set nopaste<CR>

" highlight word under cursor
nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" move lines
noremap <silent> <c-s-u> :call <SID>swap_up()<CR>
noremap <silent> <c-s-d> :call <SID>swap_down()<CR>

if has('conceal')
  set conceallevel=2 concealcursor=i
endif



" autocomplete quotes (visual and select mode)
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>

" open terminal in split
map <C-x> :below terminal<CR>


" \fi enable folding by indent
map <leader>fi :set foldmethod=indent<CR>


" map <leader>p :ctrlp :pwd<CR>
let g:ctrlp_cmd='CtrlP :pwd'
" jump to tag under cursor
nnoremap <leader>w :tag <C-r><C-w><CR>
vnoremap <leader>w :tag <C-r><C-w><CR>
" open ctrl+p with word under cursor
nmap <leader>p :CtrlP<CR><C-\>w
" open buffer list
map <leader>b :CtrlPBuffer<CR>


" commentary
map <leader>c :Commentary<CR>
map <leader>. :CtrlPTag<CR>

" git changemap sidebar
nnoremap <leader>gm :ChangeMapToggle<CR>

" minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_git_colors = 1
nnoremap <leader>mm :MinimapToggle<CR>
"
" maps = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"


"
" 6 - sources = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

if filereadable('.vimrc.local')
  source .vimrc.local
endif

" 7 -- ctags --- config
" if filereadable('.ctags/vimrc.ctag')
"   source .ctags/vimrc.ctag
" endif


"
" sources = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"



"
" 7 - claude code integration = = = = = = = = = = = = = = = = = = = = =
"

" open claude code in a terminal split
function! ClaudeOpen()
  below terminal ++close claude
endfunction

" send visual selection to claude with a prompt
function! ClaudeAsk(prompt) range
  let l:lines = getline(a:firstline, a:lastline)
  let l:text = join(l:lines, "\n")
  let l:tmpfile = tempname()
  call writefile(split(l:text, "\n"), l:tmpfile)
  let l:file = expand('%:t')
  let l:ft = &filetype
  execute 'below terminal ++close claude -p "' . a:prompt . ' (from ' . l:file . ', ' . l:ft . '):\n$(cat ' . l:tmpfile . ')"'
endfunction

" send current file to claude for review
function! ClaudeReview()
  let l:file = expand('%:p')
  execute 'below terminal ++close claude -p "Review this file for bugs, security issues, and improvements: ' . l:file . '"'
endfunction

" ask claude a question in a terminal split
function! ClaudeQuestion()
  call inputsave()
  let l:question = input('Ask Claude: ')
  call inputrestore()
  if l:question != ''
    execute 'below terminal ++close claude -p "' . l:question . '"'
  endif
endfunction

" \cc  - open claude code interactive session
nnoremap <Leader>cc :call ClaudeOpen()<CR>
" \cr  - review current file
nnoremap <Leader>cr :call ClaudeReview()<CR>
" \cq  - ask claude a question
nnoremap <Leader>cq :call ClaudeQuestion()<CR>
" \ca  - ask claude about selected code (visual mode)
vnoremap <Leader>ca :call ClaudeAsk("Explain this code")<CR>
" \cf  - ask claude to fix selected code (visual mode)
vnoremap <Leader>cf :call ClaudeAsk("Find bugs and suggest fixes for this code")<CR>
" \ct  - ask claude to write tests for selected code (visual mode)
vnoremap <Leader>ct :call ClaudeAsk("Write tests for this code")<CR>

"
" claude code = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"

