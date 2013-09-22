#! /bin/sh

BACKUPDIR=$HOME/backup/`date +%y%m%d-%H%M%S`

for file in .*
do
  case $file in
  "."|".."|".git"|".gitignore"|".DS_Store")
    continue
    ;;
  esac

  ./install.sh $file $HOME $BACKUPDIR
done

test -s install-`uname`.sh && sh install-`uname`.sh
