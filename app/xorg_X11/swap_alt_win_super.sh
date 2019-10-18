#!/bin/sh

# saved in /etc/X11/xinit/xinitrc.d/swap_alt_win_super.sh _IN Arch xfce saved
#/usr/bin/setxkbmap -option altwin:swap_alt_win # change win and alt in thinkpad when executed.
# 이곳에 실행파일을 넣어두고서 상용으로 폼의 실행을 가능하게 하는 것을 고려해 봄직하다.

# will saved in ~/config_github/app/xorg_X11/xinitrc_d_swap_alt_win_super_sh_in_arch_xfce_etc
# (shell-command "cp /etc/X11/xinit/xinitrc.d/swap_alt_win_super.sh ~/config_github/app/xorg_X11/swap_alt_win_super.sh")

# (shell-command "cp /etc/X11/xinit/xinitrc.d/swap_alt_win_super.sh ~/config_github/app/xorg_X11/swap_alt_win_super.sh")

############################################################
# https://superuser.com/questions/277990/how-do-i-swap-alt-and-windows-keys-with-xmodmap/1190742#answer-622365 >> solution >> https://askubuntu.com/a/29609/6418 # in 해결책을 발견함! < HERE solved >

# setxkbmap -rules "evdev" -model "pc105" -layout "hr,us" -option "terminate:ctrl_alt_bksp,lv3:rwin_switch,grp:shifts_toggle,caps:ctrl_modifier"
# 깔끔하게 해결되었다.
setxkbmap -option "" # sudo in Terminal application
############################################################


# (shell-command "cp ~/config_github/app/xorg_X11/swap_alt_win_super.sh /etc/X11/xinit/xinitrc.d/swap_alt_win_super.sh")
# (find-file "~/config_github/app/xorg_X11/swap_alt_win_super.sh")
# (find-file "/etc/X11/xinit/xinitrc.d/swap_alt_win_super.sh")
