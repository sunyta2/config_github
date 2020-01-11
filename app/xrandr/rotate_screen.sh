#!/usr/bin/sh
# for rotate_state by 지구본(the Earth-key)
# (shell-command "ln -s ~/config_github/app/xrandr/rotate_screen.sh ~/.bin/rotate_screen")
# symlink make and run by $ ~/.bin/rotate_screen in start command


# will be upgrade by dwm with other WM in xkeymaps

#which zenity

  rotate_state="normal_testing"

  rotate_state="$(zenity --entry --entry-text="Type" \
  --text="current rotate state is $rotate_state \nl(eft),r(ight),i(nvert)\n new line\nother line.")"
  case $rotate_state in
	   l* | L*)
	       echo "left"
	       echo "left"
#	xinput set-prop 'Synaptics TM3053-003' "Device Enabled" 1 # 트랙패드 가능하게함(0는 사용중지시킴). 원래값:1
	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17
	## 화면돌리기 부터실험함.
	xrandr -o left
	## 마우스 트랙포인터만 돌리기
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#	xinput map-to-output 17 eDP-1 # 17 is TPPS/2 IBM TrackPoint
#	xinput set-prop 'USB Optical Mouse' --type=float "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
#	xinput map-to-output 12 eDP-1 # 12 is USB Optical Mouse

	       ;;
	   r* | R*)
	       echo "right"
	       echo "right"
	     
#	xinput set-prop 'Synaptics TM3053-003' "Device Enabled" 1 # 트랙패드 가능하게함(0는 사용중지시킴). 원래값:1
	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17
	## 화면돌리기 부터실험함.
	xrandr -o right
	## 마우스 트랙포인터만 돌리기
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
#	xinput map-to-output 17 eDP-1 # 17 is TPPS/2 IBM TrackPoint
#	xinput set-prop 'USB Optical Mouse' --type=float "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
#	xinput map-to-output 12 eDP-1 # 12 is USB Optical Mouse

	       ;;
	   i* | I*)
	       echo "inverted"
	       echo "inverted"
	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17
	## 화면돌리기 부터실험함.
	xrandr -o inverted
	## 마우스 트랙포인터만 돌리기
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
#	xinput map-to-output 17 eDP-1 # 17 is TPPS/2 IBM TrackPoint
#	xinput set-prop 'USB Optical Mouse' --type=float "Coordinate Transformation Matrix" -1 0 1 0 -1 1 0 0 1
#	xinput map-to-output 12 eDP-1 # 12 is USB Optical Mouse
	     
	       ;;
#	   d* | D*)
#	       echo "deactivate_keyboard"
#	       echo "deactivate_keyboard"
#	     
#	       ;;
	   *)
	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17
	## 화면돌리기 부터실험함.
	xrandr -o normal
	## 마우스 트랙포인터만 돌리기
	xinput set-prop 'TPPS/2 IBM TrackPoint' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
#	xinput map-to-output 17 eDP-1 # 17 is TPPS/2 IBM TrackPoint
#	xinput set-prop 'USB Optical Mouse' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
#	xinput map-to-output 12 eDP-1 # 12 is USB Optical Mouse

  esac

