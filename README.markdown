# What you need know to turn you into a power vim user


## Basic editing and moviments

  -  *|* - goto begin line, *b* - begin word, *e* - end word, *w* - next word, *$* - end file
  -  *A* - start insert mode END line
  -  *I* - start insert mode BEGIN of line
  -  *o* - insert new line and change to insert mode
  -  *S* or *cc* - change line
  -  *L* - move to end of view port
  -  *v* - visual, *c* - change
  -  *d* - delete
  -  *y* - yank/copy,  *p* - paste, *yy* - yank line
  -  *i* - inside, *a* - around, *f* - find
  -  *.* - repeat last command or sequence
  -  *f?* - find character **?**
  -  *ctrl + v* - VISUAL block, useful change more one line in same time. try: *ctrl + v* after that *jjj* and choise change mode using *c*, after change type *ESC*
  -  *:{NUMBERLINE}* - goto line, *gg* - begin file, *G* - end file
  -  *:r filename* - insert content of filename starting in cursor

  - lead is \


## move definition, you use this keys when you need moviments too

  -  *h* - left
  -  *j* - bottom
  -  *k* - top
  -  *l* - rigth



## useful combinations and commands

  -  *:.,Xd* - delete from current line to line X
  -  *diw* or *daw* - delete inside/around word
  -  *db* - delete cursor to previous start word, see: d|, d$, de
  -  *dG* - delete cursor to end file, 
  -  *dgg* - delete cursor to begin file
  -  *cis* - change inside sentence
  -  *ci"* - change inside quote, try move cursor to middle word and type *caw* - change around word
  -  *c/foo* - change from cursor to search foo
  -  *ctX* - change from cursor to X
  -  *vap* - visual around paragraph
  -  *dd* - delete line
  -  *C* == *c$*, *D* == *d$*
  -  *df?* - DELETE from cursor to find character ?
  -  *vf?* - SELECT text from cursor to first character ? finded
  -  *ctrl + v* ...select block... + *c* - change text and click esc
... any combination that you can image. Try: *gUaw*, etc...



## substituitions ... type :help usr_10.txt

  -  *:%s/findpattern/changefor/* -
  -    *%s/../../c* - confirm each sustituitions
  -    *%s/../../g* - global
  -    *%s/../../i* - case insensive
  -    *%s/../../gic* - case insensive global substituition with ask confirmation


## multi-line editing using macros, steps:

  -  *qa* // start recurding into 'a' register
  -  *j* // move down
  -  *$* // move last char on line
  -  *i* // insert mode
  -  *odd* //
  -  *esc* // back to command mode
  -  *j* // move down
  -  *4@a* // replay macro 4 times (if there are 8 more lines)


## visual select

  -  *v+w*, *v+$* - select word or select cursor to end line
  -  *shift+v* - select line


## turn upper or lower case

  -  *gU* - turn select text to upper case
  -  *gu* - turn select text to lower case
  -  *g~* - InverT case
  -  // in some cases you can use only ~, U or u to combine when another keys, example: vawU (visual around word uppercase)



## folding and unfolding

  - *\fi* - enable indentation folding ! very useful
  - *za* - open/close folding
  - *zR* - open all folding
  -  *zf* - create folding
  -  *zfa}* - create folding around of }
  -  *zc* - close folding
  -  *zo* - open folding
  -  *zd* - delete folding



## Multiple cursor plugin 

  -  // ctrl+n "select how many words you need" after that click "v" and interage with "i" or "a", etc...
  -  *Ctrl + n* - select
  -  *Ctrl + p* - undo select
  -  *Ctrl - x* - jump select


## Tabs

  -  *ctrl + t* - new tab
  -  *gt* - move next tab
  -  *gT* - move previous tab
  -  *:tabc* - close current tab
  -  *ctrl+w c* - close tab or split


## Move lines

  -  *ctrl + u* - move line up
  -  *crtl + d* - move line down


## SPLIT BUFFER == file open or new file

  -  *Ctrl+w* - work with buffer
  -  *Ctrl+w n* - NEW horizontal buffer
  -  *Ctrl+w c* - CLOSE current buffer
  -  *Ctrl+w v* - NEW vertical buffer
  -  *Ctrl+w s* - split current buffer
  -  *Ctrl+w p* - move cursor to previous window
  -  *Ctrl+w j* or *k* or *l* or *j* - navigate beetwew window
  -  *Ctrl+w =* or *'-'* or *'+'* - equal size window, decrease increase size
  -  *ctrl + w* + *<* or *>* -  decrease or increse vertical split 
  -  *:ls*  - list all buffers, first column ID buffer
  -  *:buf* or *:b* #ID - reopen buffer
  -  *:bnext*, *:bprevious*, *:bfirst*, *:blast* - navigate between buffers
  -  *:bdelete #ID* - delete buffer
  -  \b - list buffers
  -  \bn - next buffer
  -  \bp - previous buffer


###Hot tip

  -  *<Ctrl+w r* - *Ctrl+w* - rotate window
  -  *Ctrl+w L* - change position split horizontal to vertical, vertical to horizontal
  - *\b* select buffer and key *Ctrl+o* and choise where you wan open selected buffer


###NerdTree - Hot tip

  - add new file or directory via nerdTree
    - press *m* 
      - choise 'add a childnode' to add file or directory... follow instructions


## navigation and listing files

  -  *:e .* - show list files
  -    - after find your file:
  -      *o* - split windows and show file
  -      *v* - split vertical and show file
  -      *t* - open file new tab (use tab navigation)
  -      *R* - rename file directory under cursor
  -      *D* - delete
  -  *ctrl + p* - search file
  -    after search file you can: 
  -      *ctrl+i* open with horizontal split
  -      *ctrl+s* open vertical split


  -  :e vim commando use a context the path where vim start running, you can manipulate de current path.
  -    *:pwd* - show current path
  -    *:cd "....."* - change current path of current window
  -    *:lcd "...."* - change current path all windows


### Hot tip

  -  *gf* - open file under cursor same window (see .vim.local instrutions for more details)
  -  *Ctrl+w f* - open file under cursor split horizontal
  -  *Ctrl+w f* or *Ctrl+w L* - open file, split horizontal, move split to vertical


## Recording and playback bundle of commands, this is a powerful friend

  -  *qCHARATERNAMEMACRO* - initialize record type character NAMEMACRO registry, after finish click "q"
  -  *@CHARATERNAMEMACRO* - run commands previous records



## Tips Plugins and hacks from vimrc

### CTRL+p - find files

  -  ctrl+v - open selected file in new vertical split
  -  ctrl+t - open selected file in new tab


  -  *\* -  map to *:*
  -  *ctrl+f* - map to */*



### move line to up and down

  -  ctrl+u - up
  -  ctrl+d - down


### format json

  - *:FormatJson* - equal to type  *:%!python -m json-tool*


### format perl

  - *:FormatPerl* - equal to type  *:%!perltidy -q*


### print path current opened file

  - *:echo @%*
  - 

### Usefuls Miscellaneous

  - *,,* - set paste
  - *\z* - highlight word from under cursor
  - *SPACE* - search on file
  - *:Ack ....* - search PATTERN in files from current directory and subdirectories, with possibilite open file


### Open terminal bash on current windows

  - first split your windows *C-w + s* (if you want)
  - next active conqueTerm inside of splited window with *C-x*


# Install

You need three steps to install this configuration:

- clone this repository
- create a .vim links
- install plugins

Do it:


    cd ~/
    git clone https://github.com/stvkoch/powerVim.git .powerVim --recursive
    ln -s ~/.powerVim  ~/.vim
    ln -s ~/.powerVim/vimrc ~/.vimrc
    vim +:PluginInstall +:qa



If you have some personal configuration, you can create ~/.vimrc.local and put there what you need.

In your project you can create ..project-root-folder/.vimrc.local and add some useful stuffs like



    set path=./lib
    set path=./vendor
    set path=./app/controller
    set path=./app/model
    set path=./app/view
    au BufNewFile,BufRead *.tag set filetype=javascript
    au BufNewFile,BufRead *.jsx set filetype=html
    ...



# Troubleshooting


#### Tagbar error:

    - see in .vimrc the path of ctags configurated like 'let g:tagbar_ctag_bin...'

 
#### Vundle not installed:

    - run: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle

