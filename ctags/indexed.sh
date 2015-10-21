#!/bin/bash


DIR="$( pwd )"

cd $DIR
exec ctags-exuberant -f $DIR/.ctags/cache/index \
    -V \
    -h \".php\" -R \
    --exclude=\"\.git\" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'

