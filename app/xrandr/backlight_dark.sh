#!/usr/bin/bash

echo password | sudo -S  echo 4793 > /sys/class/backlight/intel_backlight/brightness

# gksudo를 활용하는 것도 있지만 출력된 메시지를 읽고 본질을 파악하는 것이 중요함.

# 더욱 간단한 것은 매우 다양한 해법 중에서 본질을 파악하고 개성을 구현하는 것이다.


[root@msata045 thinkpad]#  echo 50 > /sys/class/backlight/intel_backlight/brightness
[root@msata045 thinkpad]#  echo 10 > /sys/class/backlight/intel_backlight/brightness
[root@msata045 thinkpad]#  echo 5 > /sys/class/backlight/intel_backlight/brightness
[root@msata045 thinkpad]# .bin/backlight_dark.sh 
bash: line 1: ava: command not found
[root@msata045 thinkpad]# .bin/backlight_bright.sh 
bash: line 1: ava: command not found
[root@msata045 thinkpad]# exit
exit
[thinkpad@msata045 ~]$ gksudo .bin/backlight_dark.sh 
[thinkpad@msata045 ~]$ gksudo .bin/backlight_bright.sh 
[thinkpad@msata045 ~]$ gksudo su
[thinkpad@msata045 ~]$ gksudo sudo su
[thinkpad@msata045 ~]$  man gksudo
[thinkpad@msata045 ~]$ gksudo -W echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ gksudo -S echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$  man gksudo
[thinkpad@msata045 ~]$ gksudo -w echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ gksudo -S -w echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ gksudo -S -w echo 5
5
[thinkpad@msata045 ~]$ gksudo -S -w echo "$(echo 5 > /sys/class/backlight/intel_backlight/brightness)"
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
'
[thinkpad@msata045 ~]$ gksudo -u su -S -w echo "$(echo 5 > /sys/class/backlight/intel_backlight/brightness)"
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ gksudo -u thinkpad -S -w echo "$(echo 5 > /sys/class/backlight/intel_backlight/brightness)"
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied

[thinkpad@msata045 ~]$ gksudo -u thinkpad -S -w echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ ls -la /sys/class/backlight/intel_backlight/brightness
-rw-r--r-- 1 root root 4096 Jan  7 07:25 /sys/class/backlight/intel_backlight/brightness
[thinkpad@msata045 ~]$ gksudo -u root -S -w echo 5 > /sys/class/backlight/intel_backlight/brightness
bash: /sys/class/backlight/intel_backlight/brightness: Permission denied
[thinkpad@msata045 ~]$ sudo chmod 777 /sys/class/backlight/intel_backlight/brightness
[sudo] password for thinkpad: 
[thinkpad@msata045 ~]$ echo 5 > /sys/class/backlight/intel_backlight/brightness
[thinkpad@msata045 ~]$ ls -la /sys/class/backlight/intel_backlight/brightness
-rwxrwxrwx 1 root root 4096 Jan  7 07:39 /sys/class/backlight/intel_backlight/brightness
[thinkpad@msata045 ~]$ 



