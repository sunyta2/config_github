#!/bin/sh
# This is for FreeBSD in thinkpadx220
# to connect WiFi
# Run this sudo ~/ip_a.sh
cat /usr/home/thinkpad/ip_a.sh




##### run Stumpwm #####
# pkill twm && stumpwm &

# read Y/N to execute next line
# read a=test || exit


# not  sudo kldload if-iwm
kldload iwm7260fw
sleep 1 ; echo " COMMAND: kldload iwm7260fw \n   ifconfig wlan0 create wlandev iwn0 \n  "
ifconfig wlan0 create wlandev iwn0
sleep 1 ; echo "COMMAND: ifconfig ..."
ifconfig
sleep 1 ; echo "Is wlan0 exist?"
echo "COMMAND:
wpa_supplicant -D bsd -i wlan0 -c /etc/wpa.conf -B Password:
   Successfully initialized wpa_supplicant "
wpa_supplicant -D bsd -i wlan0 -c /etc/wpa.conf -B
 
# dmesg | grep Broad
# pciconf -lbcev | less
# pciconf -lv

# kldstat ; if_iwm_load="YES" ; iwm7260fw_load="YES"
# netstat -r ; arp -an

# pkg upgrade -f ; pkg-static install -f pkg
# /usr/libexec/locate.updatedb ; find / type (d or f) | less

# service netif restart

 echo "

# service netif restart;  
COMMAND: dhclient wlan0


COMMAND: ping -c 3 www.gentoo.com


"

# dhclient wlan0
	dhclient wlan0
	sleep 1
	ping -c 3 www.gentoo.com




