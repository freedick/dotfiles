#!/bin/bash

#Define files
xfiles="xinitrc Xresources config/openbox"
vimfiles="vimrc vim"
otherfiles="zshrc"

#Filter out unwanted files
for i; do
  case "$i" in
    --nox  ) xfiles=""
          shift ;;
    --novim  ) vimfiles=""
          shift ;;
    --noother ) otherfiles=""
          shift ;;
    --help  ) echo $helptext; exit ;;
  esac
done

#Remove old backup and back up
if [ -e ./backup ]; then
	rm -r ./backup/*
else
	mkdir ./backup
fi

files="$vimfiles $xfiles $otherfiles"

#Install dotfiles and backup old files
for file in $files; do
	if [ -e ~/.$file ]; then
		mv ~/.$file ./backup 
	fi
	ln -s `pwd`/$file ~/.$file
done

