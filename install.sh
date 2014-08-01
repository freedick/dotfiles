#!/bin/bash

files="xinitrc vimrc vim Xresources config/openbox"
rm -r ./backup
mkdir ./backup

for file in $files; do
	mv ~/.$file ./backup 
	ln -s `pwd`/$file ~/.$file
done
