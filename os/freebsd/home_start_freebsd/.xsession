#!/bin/bash
# 이 문서는 원레 없었으나 직접 내가 만든 것이다.


xrdb -merge .Xresources

while true; do
    xsetroot -name "$( date + "%F %I:%M %p" )"
    sleep 20
done &

exec dwm
    
