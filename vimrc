" = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"
" 1 - vim configurations
" 2 - plugins
" 3 - functions
" 4 - plugins config
" 5 - maps
" 6 - sources
"
" = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =




" 
" 1- vim configurations = = = = = = = = = = = = = = = = = = = = = = = = 
"
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
set tabstop=2 shiftwidth=2 expandtab
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
highlight ColorColumn ctermbg=DarkGrey
set colorcolumn=80
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" files types like:
au BufNewFile,BufRead *.tag set filetype=javascript " tags is javascript files

"
" vim configurations = = = = = = = = = = = = = = = = = = = = = = = =
"






" 
" 2 - plugins = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"
"vundle plugin manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/perl-support.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'honza/vim-snippets'
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'bling/vim-airline'
Bundle 'https://github.com/rosenfeld/conque-term'
" 
" plugins = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"



"
" 3 - functions = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
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

"colorscheme Monokai
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


if has('autocmd')
  filetype plugin indent on
  autocmd VimEnter * NERDTree
  autocmd VimEnter * if argc() | wincmd p | endif
endif


" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

" NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" Tagbar
"let g:tagbar_ctags_bin='/usr/local/bin/ctags' " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
noremap <silent> <Leader>y :TagbarToggle
let g:nerdtree_tabs_open_on_console_startup=1


"let g:neocomplcache_enable_at_startup = 1

"
" plugins config = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"





"
" 5 - maps = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Find
map <C-f> /
map <Space> :nohlsearch<CR>/

" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

" comment / decomment & normal comment behavior
vmap <C-m> gc

" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S

" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y

" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>

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

map <leader>b :CtrlPBuffer<CR>

" Don't use Ex mode, use Q for formatting
map Q gq
" exit insert mode
inoremap <C-c> <Esc>

nnoremap <Leader>p :set paste<CR>
map ,, :set paste<CR><ESC>i
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>

nnoremap <leader>z :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
noremap <silent> <c-s-u> :call <SID>swap_up()<CR>
noremap <silent> <c-s-d> :call <SID>swap_down()<CR>

if has('conceal')
  set conceallevel=2 concealcursor=i
endif


inoremap  ,  ,<Space>


" autocomplete quotes (visual and select mode)
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>


map <C-x> :ConqueTerm bash<CR>
map <C-a> :blast<CR>
map <leader>fi :set foldmethod=indent<CR>

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

"
" sources = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"


