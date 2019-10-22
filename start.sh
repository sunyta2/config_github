echo ~/config_github/start.sh or start CMD in PATH
echo ln % ~/bin/ 을 실행하면 \$ PATH 의 원위치를 추가할 것.
echo use start command and basic man
echo	"							$ uname -mor"
                uname -mor

                [[ $(uname -r) =~ \.*ARCH ]] && echo "         OS is ARCH is detected"
#info_this_kernel_release_uname_r=$(uname -r)
info_this_os=$(uname -r | awk -F '-' '{print $NF}')
#


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


