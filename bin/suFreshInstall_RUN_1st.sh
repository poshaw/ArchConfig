#! /bin/bash

# on new system:
# $ sudo pacman -Sy git
# $ rm .bash*
# $ git init .
# $ remote add origin https://github.com/poshaw/archconfig.git
# $ git pull origin master

# make sure to run script as root {{{
if [ $EUID -ne 0 ]; then
	echo "This script must be run as root" 1>&2
	exit 87 # exit error for non-root error is 87
fi # }}}

# handle argument options {{{
verbose='false'
tests='false'
files=''
while getopts 'f:tv' flags; do
	case "${flag}" in
		f) files="${OPTARG}" ;;
		t) tests='true' ;;
		v) verbose='true' ;;
		*)
			"Unexpected option ${flag}"
			exit 1 # exit on error
		;;
	esac	
done # }}}

# run tests {{{
function run_tests {
	if $verbose; then
		echo "running $0 BIT"
	fi
	# insert test cases here

	if $verbose; then
		echo "BIT complete"
	fi
	exit 0
} # }}}

# check argument options {{{
if $verbose; then
	echo "running $0"
fi
if $tests; then
	run_tests
fi # }}}

# main program here

#systemctl restart dhcpcd.service
pacman -Syu
pacman -S --noconfirm accountsservice alsa-utils base-devel compton dmenu dos2unix feh firefox git i3-gaps i3status jsoncpp kitty lightdm lightdm-gtk-greeter neovim openssh pv python python-pip ranger rsync scrot tree unzip wget xdotool xorg-xrandr xorg-server xorg-xinit zathura-pdf-poppler zip
#mkdir /mnt/usb
#chmod 755 /mnt/usb
#groupadd -r autologin
sed -i 's/twm \&/exec i3 \&/' /etc/X11/xinit/xinitrc
systemctl start lightdm.service
systemctl enable lightdm.service
