#! /bin/sh
# see. http://qiita.com/tukiyo/items/574726ef48693db5cc21

file=$1
dst=$2
BACKUPDIR=$3

if [ -e $dst/$file ]; then
  if [ -L $dst/$file ]; then
    echo "[skip] already $file exists."
    exit
  fi
  if [ ! -e $BACKUPDIR ]; then
    mkdir -p "$BACKUPDIR"
  fi
  mv $dst/$file "$BACKUPDIR"
fi

echo "[install] ln -s `pwd`/$file $dst/$file"
ln -s `pwd`/$file $dst/$file
