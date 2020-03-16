#!/usr/bin/bash
# (async-shell-command "ln -fs ~/config_github/app/qtile/autostart.sh ~/.config/qtile/autostart.sh")
# (dired "~/config_github/app/qtile/")
         # (dired "~/.config/qtile/")

emacs -Q -l ~/config_github/app/emacs/shell_emacs/emacsQ_load.el --eval="(find-file '/home/thinkpad/config_github/app/qtile/autostart.sh')"&>/dev/null &
okular ~/Documents/stumpwm-git.pdf ~/Documents/stumpwm-git.pdf &>/dev/null &
dolphin &>/dev/null &
konsole &>/dev/null &
urxvt
# brave &>/dev/null &")




# wm을 검색해서 나누어 실행하는 것을 두는 것도 좋은 것이다.
