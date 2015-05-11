" http://www.ibm.com/developerworks/views/linux/libraryview.jsp?end_no=100&lcl_sort_order=asc&type_by=Articles&sort_order=desc&show_all=false&start_no=1&sort_by=Title&search_by=scripting+the+vim+editor&topic_by=All+topics+and+related+products&search_flag=true&show_abstract=true
"
set nocompatible


" filetypt off
filetype plugin on


" vundle plugin manager
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()ne
Bundle 'gmarik/vundle'




" plugins
Bundle 'tpope/vim-surround'
Bundle 'gcmt/breeze.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'sheerun/vim-polyglot'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mileszs/ack.vim'
Bundle 'nixon/vim-vmath'
Bundle 'reedes/vim-textobj-quote'
Bundle 'reedes/vim-litecorrect'
Bundle 'reedes/vim-textobj-sentence'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'



" bundles for programers
if executable('ctags')
  Bundle 'majutsushi/tagbar'
endif
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'mattn/webapi-vim'


" Snippers and Autocomplete
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'
Bundle 'kana/vim-gf-user'





" colors and themes
Bundle 'flazz/vim-colorschemes'




" Selecting color Themes
colorscheme Monokai
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256




""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
  au BufNewFile,BufRead *.tag set filetype=javascript
endif




" Configurations

" Use :help 'option' to see the documentation for the given option.
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
set listchars=tab:‚ñí‚ñë,trail:‚ñì
set list
set number
set hlsearch
set ignorecase
set smartcase
" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif
" do not history when leavy buffer
set hidden
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac
set completeopt=menuone,longest,preview







"
" Plugins config
"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" Tabs
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=26                          " Default is 40, seems too wide
let g:neocomplcache_enable_at_startup = 1

let g:nerdtree_tabs_open_on_console_startup=1







" Mappings

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endi

" Don't use Ex mode, use Q for formatting
map Q gq

" FIXME: (broken) ctrl s to save
"noremap  <C-S> :update<CR>
"vnoremap <C-S> <C-C>:update<CR>
"inoremap <C-S> <Esc>:update<CR>

" exit insert mode
inoremap <C-c> <Esc>

" Find
map <C-f> /
map <Space> :nohlsearch<CR>/

map <Leader>b :CtrlPBuffer<CR>

" indend / deindent after selecting the text with (‚áß v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> <Esc><C-w>
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

let mapleader = '\'
nnoremap <Leader>p :set paste<CR>
map ,, :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>

command FormatJson :%!python -m json.tool

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
noremap <silent> <c-s-u> :call <SID>swap_up()<CR>
noremap <silent> <c-s-d> :call <SID>swap_down()<CR>



" Plug-in key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

noremap <silent> <Leader>y :TagbarToggle

map <leader>fi :set foldmethod=indent<CR>


" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
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

nnoremap <leader>hw :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Column color
highlight ColorColumn ctermbg=DarkGrey "set to whatever you like
set colorcolumn=80



" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
