" = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =
"
" 1 - vim configurations
" 2 - plugins
" 3 - functions
" 4 - plugins config
" 5 - maps
" 6 - sources
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
let output = system("~/.powerVim/ctags/indexed.sh ".$ctagTempFile)

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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" plugins
Bundle 'runVimTests'
Bundle 'foo.vim'
Bundle 'tobyS/pdv'
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
Bundle 'vim-airline/vim-airline-themes'
Bundle 'https://github.com/rosenfeld/conque-term'
Bundle 'tpope/vim-commentary'
Bundle 'mattn/emmet-vim'
Bundle 'fatih/vim-go'
Bundle 'syntastic'
Bundle 'supertab'
Bundle 'JulesWang/css.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'airblade/vim-gitgutter'
" Bundle 'joonty/vdebug.git'
Bundle 'Shougo/vimproc.vim'
Bundle 'Shougo/unite.vim'
"Bundle 'm2mdas/phpcomplete-extended'
Bundle 'junegunn/vim-easy-align'
"Bundle 'Shougo/neocomplete.vim'
Bundle 'AutoComplPop'
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-fugitive'
Bundle 'ivalkeen/vim-ctrlp-tjump'
Bundle 'flazz/vim-colorschemes'
Bundle 'prettier/vim-prettier'
Bundle 'reewr/vim-monokai-phoenix'
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'angamaiton/vim-snazzy'


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


if has('autocmd')
  filetype plugin indent on
  autocmd VimEnter * NERDTree
  autocmd VimEnter * if argc() | wincmd p | endif
endif


" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
" g:ctrlp_root_markers
" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 2


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline_theme             = 'molokai'
let g:airline_theme             = 'solarized'
let g:airline#extensions#syntastic#enabled = 1


" NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeWinSize = 20


" Tagbar
"let g:tagbar_ctags_bin='/usr/local/bin/ctags' " Proper Ctags locations
call tagbar#OpenWindow('fj')
let g:tagbar_width=20                          " Default is 40, seems too wide
" let g:tagbar_autoclose=1
noremap <silent> <Leader>y :TagbarToggle



" PHP complete extended
autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

"Neo complete
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#sources#tags#cache_limit_size = 5000000
"let g:neocomplete#enable_smart_case = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()
"function! s:my_cr_function()
"  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
"endfunction
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"let php_sql_query=1
"let php_htmlInStrings=1
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'





"indentLine
let g:indentLine_enabled = 1
let g:indentLine_color_term = 239


" php fixer
" If php-cs-fixer is in $PATH, you don't need to define line below
" let g:php_cs_fixer_path = "~/php-cs-fixer.phar" " define the path to the php-cs-fixer.phar
"let g:php_cs_fixer_level = "symfony"              " which level ?
"let g:php_cs_fixer_config = "default"             " configuration
"let g:php_cs_fixer_php_path = "php"               " Path to PHP
"" If you want to define specific fixers:
""let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
"let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
"let g:php_cs_fixer_dry_run = 1                    " Call command with dry-run option
"let g:php_cs_fixer_verbose = 1                    " Return the output of command if 1, else an inline information.

let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args='--standard=~/.ruleset.xml -n'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1


set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest

" au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1

let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1




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

" enable term in window
map <C-x> :ConqueTerm bash<CR>


" \fi enable folding by indent
map <leader>fi :set foldmethod=indent<CR>


" map <leader>p :ctrlp :pwd<CR>
let g:ctrlp_cmd='CtrlP :pwd'
" ctrlpjump use ctags file to show file list
nnoremap <leader>w :CtrlPtjump<cr>
vnoremap <leader>w :CtrlPtjumpVisual<cr>
" open ctrl+p with word under cursor
nmap <leader>p :CtrlP<CR><C-\>w
" open buffer list
map <leader>b :CtrlPBuffer<CR>


" commentary
map <leader>c :Commentary<CR>
map <leader>. :CtrlPTag<CR>
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
  " source .ctags/vimrc.ctag
" endif


"
" sources = = = = = = = = = = = = = = = = = = = = = = = = = = = = 
"

