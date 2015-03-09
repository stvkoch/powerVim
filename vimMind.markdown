# What you need know to turn in a power vim use


## Basic editing and moviments

  *|* - goto begin line, *b* - begin word, *e* - end word, *w* - next word, *$* - end file
  *A* - start insert mode in of END line
  *o* - insert new line and change to insert mode
  *L* - move to end of view port
  *I* - start insert mode BEGIN of line
  *v* - visual, *c* - change
  *d* - delete
  *y* - yank/copy,  *p* - paste, *yy* - yank line
  *i* - inside, *a* - around, *f* - find
  *.* - repeat last command or sequence
  *f?* - find character **?**
  *ctrl + v* - VISUAL block, useful change more one line in same time. try: *ctrl + v* after that *jjj* and choise change mode using *c*, after change type *ESC*
  *:{NUMBERLINE}* - goto line, *gg* - begin file, *G* - end file




## move definition, you use this keys when you need moviments too

  *h* - left
  *j* - bottom
  *k* - top
  *l* - rigth



## useful combinations and commands
  *:.,Xd* - delete from current line to line X
  *diw* or *daw* - delete inside/around word
  *db* - delete cursor to previous start word, see: d|, d$, de
  *dG* - delete cursor to end file, dgg - delete cursor to begin file
  *cis* - change inside sentence
  *ci"* - change inside quote
  *c/foo* - change from cursor to search foo
  *ctX* - change everything from cursor to X and
  *vap* - visual around paragraph
  *S* or *cc* - change line
  *dd* - delete line
  *C* == *c$*, *D* == *d$*
  *df?* - DELETE from cursor to find character ?
  *vf?* - SELECT text from cursor to first character ? finded
  *ctrl + v* ...select block... + *c* - change text and click esc
... any combination that you can image. Try: *gUaw*, etc...



## substituitions ... type help usr_10.txt

  *:%s/findpattern/changefor/* -
    - usefuls flags:
    *%s/../../c* - confirm each sustituitions
    *%s/../../g* - global
    *%s/../../i* - case insensive


## multi-line editing using macros, steps:

  *qa* // start recurding into 'a' register
  *j* // move down
  *$* // move last char on line
  *i* // insert mode
  *odd* //
  *esc* // back to command mode
  *j* // move down
  *4@a* // replay macro 4 times (if there are 8 more lines)


## visual select

  *v+w*, *v+$* - select word or select cursor to end line
  *shift+v* - select line


## turn upper or lower case

  //use visual select and:
  *gU* - turn select text to upper case
  *gu* - turn select text to lower case
  *g~* - InverT case
  // in same cases you can use only ~, U or u to combine when another keys, example: vawU (visual around word uppercase)


## Multiple cursor - exists several plugins that overwrite ctrl+n combination.

  // ctrl+n "select how many words you need" after that click "v" and interage with "i" or "a", etc...
  *Ctrl + n* - select
  *Ctrl + p* - undo select
  *Ctrl - x* - jump select


## Tabs

  *ctrl + t* - new tab
  *gt* - move next tab
  *gT* - move previous tab
  *:tabc* - close current tab
  *ctrl+w c* - close tab or split


## Move lines

  *ctrl + u* - move line up
  *crtl + d* - move line down


## SPLIT BUFFER == file open or new file

  *ctrl + w* - work with buffer
  *ctrl + w* , *n* - NEW horizontal buffer
  *ctrl + w*, *c* - CLOSE current buffer
  *ctrl + w*, *v* - NEW vertical buffer
  *ctrl + w*, *s* - split current buffer
  *ctrl + w*, *p* - move cursor to previous window
  *ctrl + w*, *r* - *ctrl + w > x* - rotate window
  *ctrl + w*, *j* or *k* or *l* or *j* - navigate beetwew window
  *ctrl + w*, *'='* or *'-'* or *'+'* - equal size window, decrease increase size
  *ctrl + w*, *<* or *>* -  decrease or increse vertical split 
  *:ls*  - list all buffers, first column ID buffer
  *:buf* fer #ID - you can edit
  *:bnext*, *:bprevious*, *:bfirst*, *:blast* - navigate between buffers
  *:bdelete #ID* - delete buffer


## navigation and listing files

  *:e* . or *:e ../somewhere/path...*
    *s* - click 's' to change sort of files
    - after find your file:
      *o* - split windows and show file
      *v* - split vertical and show file
      *t* - open file new tab (use tab navigation)
  *R* - rename file directory under cursor
  *D* - delete
  *ctrl + p* - search file
    after search file you can: ctrl+i open with horizontal split and ctrl+s open vertical split

  :e vim use with context the path where vim start running, you can manipulate de current path.
    *:pwd* - show current path
    *:cd* "....." - change current path of current window
    *:lcd* "...." - change current path all windows



## Recording and playback bundle of commands

  *qCHARATERNAMEMACRO* - initialize record type character NAMEMACRO registry, after finish click "q"
  *@CHARATERNAMEMACRO* - run commands previous records



## Tips Plugins and hacks from vimrc

### CTRL+p - find files

  ctrl+x - open selected file in new horizontal split
  ctrl+v - open selected file in new vertical split
  ctrl+t - open selected file in new tab

### copy and paste

  ctrl+c, ctrl+v
  ctrl-z, ctrl+y

  \ map to :


### move line to up and down

  ctrl+u - up
  ctrl+d - down

### format json

  :%!python -m json-tool




