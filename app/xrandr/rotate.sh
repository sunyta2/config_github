#/usr/bin/bash
#돌리기와 밝기를 통합하기 위한 명령 내용임 + zenity list click
#xrandr --output eDP-1 --rotate {left, right, normal, inverted}
output_primary="$(xrandr -q | grep 'connected p'  | awk '{print $1 }')"
# 단축키 만들기 XF86TaskPane XF86RotateWindows
# 단축키 만들기   화면끄기 ,    화면돌리기
#[thinkpad@msata045 ~]$ xrandr --output $output_primary --off # 복구가 잘 앙뇌서 다른 것을 사용할 것.
#if you want switch on that monitor again then you have run this command:
#xrandr --output $output_primary --auto

#[thinkpad@msata045 ~]$ xset -display :0.0 dpms force on 
#[thinkpad@msata045 ~]$ xset -display :0.0 dpms force off # 쉽게 복구됨으로 사용할 것.
# TODO 자동으로 변수명을 획득하는 것을
    # awk/readme.org shell/variable~ 를 이용한 변형을 참고할 것


clear #xdotool key ctrl+l
echo '# rotate command using xrandr in ~/.bin/rotate'
#  state_rotate=1 # <XF86HomePage>
# echo '      1|l) xrandr --output eDP-1 --rotate left ;;'
 echo '      1|l) xrandr --output $output_primary --rotate left ;;'
 echo '      2|r) xrandr --output $output_primary --rotate right ;;'
 echo '      3|i) xrandr --output $output_primary --rotate inverted ;;'

 echo '      *) xrandr --output $output_primary --rotate normal ;;'
 


# state_gui=$(zenity --entry --entry-text="l|r|i|*" --text="select 1 character for --rotate \$state_rotate :")
# $ zenity --width=300 --height=600 --list --column "" --title="돌리기와 밝기 화면끄기기능의 통합!" "normal"  "l"   "r"   "i" "n" "bright/dark" "sleep_screen"
 state_gui=$(zenity --width=300 --height=600 --list --column "" \
             --title="돌리기와 밝기 화면끄기기능의 통합!"\
        	     "Normal-정상으로 몽땅 돌리는 모든 기능"\
		     ""                                 \
	             "Left-  화면을 반시계방향으로 90도 돌림"\
		     ""                                 \
	             "Right- 화면을   시계방향으로 90도 돌림"\
		     ""                                 \
	             "Invert-화면을             180도 돌림"\
		     ""                                 \
	             "Normal-화면방향만 Normal"\
		     ""                                 \
	             "Bright/Dark-밝기를 조절함"\
		     ""                                 \
        	     "Sleep_screen-모니터전원차단")



# read -n 1 -p "select 1 character for --rotate \$state_rotate :" state_rotate
state_rotate=${state_gui:0:1}
echo ""
echo "      \$state_rotate is selected : state_rotate=${state_rotate}"
echo "      ${state_rotate}) \$state_rotate is selected : state_rotate=${state_rotate}"
sleep 1
#  case "${choice}" in
  case $state_rotate in
      1|L)
       echo '      1|l) xrandr --output $output_primary --rotate left ;;'
      xrandr --output $output_primary --rotate left
      xrandr --output LVDS-1 --rotate left
	xinput set-prop 'Virtual core pointer' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	xinput set-prop 'Virtual core XTEST pointer' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	xinput set-prop 'Wacom ISDv4 E6 Finger' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1

	 ;;
      2|R)
       echo '      2|r) xrandr --output $output_primary --rotate right ;;'
      xrandr --output $output_primary --rotate right
      xrandr --output LVDS-1 --rotate right
	xinput set-prop 'Virtual core pointer' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	xinput set-prop 'Virtual core XTEST pointer' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	xinput set-prop 'Wacom ISDv4 E6 Finger' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1

	 ;;
      3|I)
       echo '      3|i) xrandr --output $output_primary --rotate inverted ;;'
      xrandr --output $output_primary --rotate inverted
      xrandr --output LVDS-1 --rotate inverted
	xinput set-prop 'Virtual core pointer' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	xinput set-prop 'Virtual core XTEST pointer' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	xinput set-prop 'Wacom ISDv4 E6 Finger' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1

	 ;;

#"bright/dark" "sleep_screen"
      4|B) /home/thinkpad/.bin/bright.sh
      ;;
      5|S) sleep 3; xset -display :0.0 dpms force off # 쉽게 복구됨으로 사용할 것.
      ;;
      *)
       echo '      *) xrandr --output $output_primary --rotate normal ;;'
      xrandr --output $output_primary --rotate normal
      xrandr --output LVDS-1 --rotate normal
#	xrandr -o normal
	## 마우스 트랙포인터만 돌리기
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	xinput set-prop 'Virtual core pointer' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	xinput set-prop 'Virtual core XTEST pointer' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	xinput set-prop 'Wacom ISDv4 E6 Finger' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1

         ;;
    
  esac


#1. 저장과 편집의 위치 ~/config_github/app/xrandr/rotate.sh
#2. 실행의 위치       ~/.bin/rotate by $ ln -s 
    #+BEGIN_SRC emacs-lisp
      # 소프트링크 만들기 (shell-command "ln -s ~/config_github/app/xrandr/rotate.sh ~/.bin/rotate")
      # 실행가능하게 하기 (shell-command "chmod +x ~/config_github/app/xrandr/rotate.sh")
      # 원본파일 편집하기 (find-file "~/config_github/app/xrandr/rotate.sh")
      # 원본파일 편집하기 (dired-other-window "~/config_github/app/xrandr/")
      # .bin/ 폴더 열람하기 (find-file "~/.bin/")
      # 명령문 만들기 (shell-command "")
      # 추가사항
      # 명령문 만들기 (shell-command "") 단축키로 하는 것을 만들어 둘 것
    #+END_SRC
  # rotate shortcut file
  # (async-shell-command "xbindkeys -f ~/config_github/app/xbindkeys/xbindkeysrc")
  # This file is (find-file "~/config_github/app/xbindkeys/xbindkeysrc")
  


