#!/bin/bash

CTAG_INDEX=$1

DIR="$( pwd )"

# cd $DIR
# jsctags .
# exec ctags-exuberant -f $DIR/.ctags/cache/index \
#     -V \
#     -h \".php\" -R \
#     --exclude=\"\.git\" \
#     --totals=yes \
#     --tag-relative=yes \
#     --PHP-kinds=+cf \
#     --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
#     --regex-PHP='/interface ([^ ]*)/\1/c/' \
#     --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'



ctags -f $1 -R \
--langmap='javascript:.js.es6.es.jsx' \
--javascript-kinds='-c-f-m-p-v' \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*\[/\1/A,Array,Arrays/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*\[/\1/A,Array,Arrays/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*\[/\1/A,Array,Arrays/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([A-Z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function/\1/C,Class,Classes/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([A-Z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function/\1/C,Class,Classes/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([A-Z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function/\1/C,Class,Classes/b" \
--regex-javascript="/[ \t]*class[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/C,Class,Classes/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\5/E,export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\7/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}function[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\5/E,export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}\({[ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\7/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}function[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)/\1/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\2/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*export[ \t]\{1,\}default[ \t]\{1,\}const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*[^,]\{1,\},[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*,[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\3/E,Export,Exports/b" \
--regex-javascript="/^[ \t]*function[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t(]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*[(]function[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t(]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function[^\*][^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function[^\*][^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function[^\*][^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*([^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*([^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*([^\*]/\1/F,Function,Functions/b" \
--regex-javascript="/^[ \t]*function[ \t]*\*[ \t]*\([A-Za-z0-9_$]\{1,\}\)/\1/G,Generator,Generators/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function\([ \t]*\*\)/\1/G,Generator,Generators/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function\([ \t]*\*\)/\1/G,Generator,Generators/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([a-z][A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*function\([ \t]*\*\)/\1/G,Generator,Generators/b" \
--regex-javascript="/^[ \t]*\(\*[ \t]\)\([A-Za-z0-9_$]\{1,\}\)[ \t]*(.*)[ \t]*[{]/\2/G,Generator,Generators/b" \
--regex-javascript="/^[ \t]*import[ \t]\{1,\}\([{][ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\3/I,Import,Imports/b" \
--regex-javascript="/^[ \t]*import[ \t]\{1,\}\([{][ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\5/I,Import,Imports/b" \
--regex-javascript="/^[ \t]*import[ \t]\{1,\}\([{][ \t]*\)*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)*\([A-Za-z0-9_]\{1,\}\),[ \t]*\([A-Za-z0-9_\*]*[ \t]as[ \t]\)\([A-Za-z0-9_]\{1,\}\)/\7/I,Import,Imports/b" \
--regex-javascript="/^[ \t]*this\.\([A-Za-z0-9_$]\{1,\}\)[ \t]*=.*[{]$/\1/M,Method,Methods/b" \
--regex-javascript="/^[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*[:=][ \t]*[(]*function[ \t]*(/\1/M,Method,Methods/b" \
--regex-javascript="/^[ \t]*\([A-Za-z0-9_$]\{1,\}\)[ \t]*[=][ \t].\{1,\}=>/\1/M,Method,Methods/b" \
--regex-javascript="/^[ \t]*static[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*(/\1/M,Method,Methods/b" \
--regex-javascript="/^[ \t]*\([A-Za-z0-9_$]\{1,\}\)(.*)[ \t]*[{]/\1/M,Method,Methods/b" \
--regex-javascript="/^[ \t]*\(this\.\)*\([A-Za-z0-9_$]\{1,\}\)[ \t]*[:=].*[,;]*[^{]$/\2/P,Property,Properties/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[{]/\1/O,Object,Objects/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[{]/\1/O,Object,Objects/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[{]/\1/O,Object,Objects/b" \
--regex-javascript="/\/\/[ \t]*\(FIXME\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(TODO\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(BUG\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(NOBUG\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(???\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(!!!\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(HACK\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/\/\/[ \t]*\(XXX\)[ \t]*:*\(.*\)/\1/T,Tag,Tags/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[0-9\"'\/]/\1/V,Variable,Variables/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[0-9\"'\/]/\1/V,Variable,Variables/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*[0-9\"'\/]/\1/V,Variable,Variables/b" \
--regex-javascript="/^[ \t]*var[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*new/\1/V,Variable,Variables/b" \
--regex-javascript="/^[ \t]*let[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*new/\1/V,Variable,Variables/b" \
--regex-javascript="/^[ \t]*const[ \t]\{1,\}\([A-Za-z0-9_$]\{1,\}\)[ \t]*=[ \t]*new/\1/V,Variable,Variables/b" \
--langmap='less:.less' \
--regex-less='/^[ \t&]*#([A-Za-z0-9_-]+)/\1/i,id,ids/' \
--regex-less='/^[ \t&]*\.([A-Za-z0-9_-]+)/\1/c,class,classes/' \
--regex-less='/^[ \t]*(([A-Za-z0-9_-]+[ \t\n,]+)+)\{/\1/t,tag,tags/' \
--regex-less='/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/m,media,medias/' \
--regex-less='/^[ \t]*(@[A-Za-z0-9_-]+):/\1/v,variable,variables/' \
--regex-javascript='/\/\/[ \t]*(FIXME|TODO)[ \t]*\:*(.*)/\1/T,Tag,Tags/' \
--langmap='scss:.scss' \
--regex-scss='/^[ \t]*@mixin ([A-Za-z0-9_-]+)/\1/m,mixin,mixins/' \
--regex-scss='/^[ \t]*\$([A-Za-z0-9_-]+)/\1/v,variable,variables/' \
--regex-scss='/^([A-Za-z0-9_-]*)*\.([A-Za-z0-9_-]+) *[,{]/\2/c,class,classes/' \
--regex-scss='/^[ \t&]+\.([A-Za-z0-9_-]+) *[,{]/\1/c,class,classes/' \
--regex-scss='/^(.*)*\#([A-Za-z0-9_-]+) *[,{]/\2/i,id,ids/' \
--regex-scss='/^[ \t&]*#([A-Za-z0-9_-]+)/\1/i,id,ids/' \
--regex-scss='/(^([A-Za-z0-9_-])*([A-Za-z0-9_-]+)) *[,|\{]/\1/t,tag,tags/' \
--regex-scss='/(^([^\/\/])*)[ \t]+([A-Za-z0-9_-]+)) *[,|\{]/\3/t,tag,tags/' \
--regex-scss='/(^(.*, *)([A-Za-z0-9_-]+)) *[,|\{]/\3/t,tag,tags/' \
--regex-scss='/(^[ \t]+([A-Za-z0-9_-]+)) *[,|\{]/\1/t,tag,tags/' \
--regex-scss='/^[ \t]*@media\s+([A-Za-z0-9_-]+)/\1/d,media,media/' \
--regex-javascript='/\/\/[ \t]*(FIXME|TODO)[ \t]*\:*(.*)/\1/T,Tag,Tags/' \
--regex-html='/id="([A-Za-z0-9_-]+)"/\1/i,id,ids/' \
--regex-html='/class="([A-Za-z0-9_-]+)"/\1/c,class,classes/' \
--langmap='markdown:.md' \
--regex-markdown='/^(#+[ \t]+.*)/\1/h,heading,headings/' \
--langmap='vim:+(vimrc)' \
--exclude='.git' \
--exclude='.svn' \
--exclude='.hg' \
--exclude='min' \
--exclude='vendor' \
--exclude='\*.min.\*' \
--exclude='\*.map' \
--exclude='\*.swp' \
--exclude='\*.bak' \
--exclude='\*.pyc' \
--exclude='\*.class' \
--exclude='\*.sln' \
--exclude='\*.Master' \
--exclude='\*.csproj' \
--exclude='\*.csproj.user' \
--exclude='\*.cache' \
--exclude='\*.dll' \
--exclude='\*.pdb' \
--exclude='tags' \
--exclude='cscope.\*' \
--exclude='\*.tar.\*' \
--exclude='node_modules' \
--exclude='bower_components' \
--exclude='dist' \
--exclude='web' \
--exclude='test' \
--exclude='tests' \
--exclude='.tmp' \
--exclude='*bundle.*' \
--sort='no'





