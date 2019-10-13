$PATH=$PATH:/usr/local/bin
export TERMINFO=/opt/local/share/terminfo
xsetroot -solid '#4a525a'
xmodmap -e 'remove Mod2 = Meta_L' -e 'add Mod4 = Meta_L'
exec >>~/.xsession-errors 2>&1
/usr/local/bin/dwm-launch
xrdb ~/.Xresources
