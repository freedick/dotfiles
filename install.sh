#!/bin/bash

#Define files
xfiles="xinitrc Xresources config/openbox"
vimfiles="vimrc vim"
otherfiles=""

#Filter out unwanted files
for i; do
  case "$i" in
    --nox  ) xfiles=""
          shift ;;
    --novim  ) vimfiles=""
          shift ;;
    --help  ) echo $helptext; exit ;;
  esac
done

#Remove old backup and back up
rm -r ./backup
mkdir ./backup

files="$vimfiles $xfiles $otherfiles"

#Install dotfiles and backup old files
for file in $files; do
	mv ~/.$file ./backup 
	ln -s `pwd`/$file ~/.$file
done

