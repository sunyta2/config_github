echo ~/config_github/start.sh or start CMD in PATH
echo ln % ~/bin/ 을 실행하면 \$ PATH 의 원위치를 추가할 것.
echo use start command and basic man
	uname_1="$(uname -a | awk '{print $1}')"
	# 1:
	uname_2="$(uname -a | awk '{print $2}')"
	# 2:
	uname_3="$(uname -a | awk '{print $3}')"
	# 3:	Linux_msata045_5.3.7-arch1-1-ARCH #

	# uname_4 샵이 포함된 형태라서 일단 배제함.

uname_123="${uname_1}_${uname_2}_${uname_3}" # 구체적인 OS의 구분문으로 사용할 것!
# _123 또는 _storage를 사용해서 case문을 활용한다.
uname_storage=$uname_2 # 간단한 저장파일명으로 이용할 것!


###############################################
case $uname_123 in
    Linux_msata045_5.3.7-arch1-1-ARCH) echo "this is Linux_msata045_5.3.7-arch1-1-ARCH";;
    Linux_msata827_5.3.1-arch1-1-ARCH) echo "this is Linux_msata827_5.3.1-arch1-1-ARCH";;
    FreeBSD_freebsd_32gb_12.0-RELEASE) echo "this is FreeBSD_freebsd_32gb_12.0-RELEASE";;
    y | Y | yes | Yes) echo -n "y is selected!";;
    n | no ) echo -n "n is selected";;
    *) echo -n "nothing is selected";;
esac
###############################################










echo	"							$ uname -mor
                uname -mor

                [[ $(uname -r) =~ \.*ARCH ]] && echo "         OS is ARCH is detected"
#info_this_kernel_release_uname_r=$(uname -r)
info_this_os=$(uname -r | awk -F '-' '{print $NF}')
#
read -n 1 -p "
선택의 실행을 이것으로 출력을 삼는다.


작동하는 것은 KDE에서 확인함.
" good ; echo -e "\n정확히 출력된다.\n\n"


command_a="echo hi 알맞은 명령을 전달하는 법으로 선택적으로 보낸다. " ; eval "$command_a"


# 대선택자-실천선택자-선택의 대상.
## ~/config_github/start.sh #대분류자-기본방향설정자
### ~/config_github/os/arch/starter_arch_setxkbmap_in_dwm.sh 다음구체적선택자
			   ## IN that file 다음구체적선택자의 선택사항
                           ## ~/config_github/app/dwm/starter_arch_setxkbmap_in_dwm.sh # 구체적 선택을 받은 app
			   ##
			   ##

### operation by (shell-command "kudo ; ln -s /usr/bin/start.sh ~/config_github/start.sh") (message "일단 수퍼유저의 명령을 기다릴 것-FreeBSD의 실행도")

# uname ## discover system file structure. =>
# USE export info_this_os info_this_user info_this_file_system

case $ANIMAL in
    horse | dog | cat) echo -n "four";;
    man | kangaroo ) echo -n "two";;
    *) echo -n "an unknown number of";;
esac




case $info_this_os in
    ARCH) echo -n "OS is ARCH is detected.";;

    FREEBSD) echo -n "OS is FreeBSD is detected.";;


    *) echo -n "Run common comment - DO BEST CHOICE!";;
esac

#### case
#####




echo '###########   알림 TODO and REVIEW  ############'
echo '###############################################'


echo 'sudo ip link set wlp3s0 down && sudo wifi-menu ## WiFi Free 가능해짐 arco'
# dunst install in arco
# kudo to runin emacs method discover needed.


