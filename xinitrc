source ~/.profile
setxkbmap dvorak se
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
redshift -l 65.5:22.2 &
exec xmonad & urxvt
#exec urxvt
#exec openbox-session
