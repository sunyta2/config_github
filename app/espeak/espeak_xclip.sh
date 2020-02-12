#!/usr/bin/sh
# for rotate_state by 지구본(the Earth-key)
# (shell-command "ln -s ~/config_github/app/xrandr/rotate_screen.sh ~/.bin/rotate_screen")
# symlink make and run by $ ~/.bin/rotate_screen in start command
# xbindkeys -f ~/config_github/app/xbindkeys/xbindkeysrc

xclip_text="$(xclip -o)"
  reading_text="xclip -o is selected start with 'xclip'"

  reading_text="$(zenity --entry --entry-text="$xclip_text" \
  --text="<알림> 선택문장을 읽는 것을 횟수와 속도? 언어,")"
  case $reading_text in
	   xclip*)
	       echo "xclip -o is selected start with 'xclip'"
	       reading_text="$xclip_text"

	       ;;
	   *)
#	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17

  esac
echo "reading text is $reading_text"
################
#reading_text="καὶ διὰ τοῦτο ταῦτα φρονιμώτερα καὶ μαθητικώτερα τῶν μὴ δυναμένων μνημονεύειν ἐστί,"


  language="$(zenity --entry --entry-text="other/grc" \
  --text="English is default $language \ng(reek-other/grc),\nl(atin-other/la)\n new line\nother line.")"
  case $language in
	   g* | G* )
	       language="other/grc"

	       ;;
	   l* | L* )
	     language="other/la"
	       ;;
#	   d* | D* )
#	       ;;
	   * )
	       language="en"
#	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17

  esac
notify-send -t 6000 "READING TEXT is   $reading_text  !!!"

################
  speed="$(zenity --entry --entry-text="99" \
  --text="[espeak -s] (99) 빠르기를 정함 99(약간 느림) 150(빠름) \n s(speed -s 150)\n l(ow_speed -s 99) .")"
  case $speed in
	   s* | S* )
	       echo "-s 100 "
	       speed=150

	       ;;
	   l* | L* )
	       echo "-s 99 "
	       speed=99
	       ;;
#	   d* | D* )
#	       ;;
	   * )
	       speed=99
#	xinput set-prop 'Synaptics TM3053-003' --type=float "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
	# 트랙포인터만 돌리는 것으로 실험함. id=17
            ;;
  esac
  
  if [ $speed -lt 0 ]
  then
      echo "틀린 속도임 아웃함"
      exit 1
  fi
  ################


  ################
  # 횟수를 선택함
  reading_repeat=$(zenity --entry --entry-text="3" \
			  --text="[For반복문실행] 기본 3회 0보다 작으면 아웃함.")

  if [ $reading_repeat -lt 0 ]
  then
      exit 1
  fi



  ################
  # delay를 선택함
  reading_sleep="$(zenity --entry --entry-text="3" \
    			 --text="[For반복문실행] 딜레이 시간을 정함 기초값 \n $ sleep 6 # .")"

  if [ $reading_sleep -lt 0 ]
  then
      exit 1
  fi


### 나중에 저장의 유무를 결정하는 선택을 남길 것. 파일명에 시간을 추가하고 언어의 종류별로 선택하여 분리하게 함.
#파일명은 첫 2단어를 선택하는 것을 할 것. 변경을 고려할 수 있게 할 것.
# 애플의 앱으로 개발할 경우 대박날 가능성이 크다.

# dwm의 단축키나 리눅스의 단축키로 만들어서 자동으로 실행하면 편리할 것이다.
    # bright.sh를 참조해서 단축키를 만들어 볼 것.

#reading_sleep=3


################################################################
#zenity --info --text="reading_text" &>/dev/null &
notify-send -t 18000 "READING TEXT is     $reading_text"
for i in `seq 1 $reading_repeat`
do
    #$reading_text $language $speed
    espeak -v $language -s $speed "$reading_text" &>/dev/null
    sleep $reading_sleep
done
notify-send -t 6000 "READING TEXT is     $reading_text"
