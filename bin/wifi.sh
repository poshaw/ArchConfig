#! /bin/bash

# find config file in /etc/netctl/

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

ip link set dev wlp4s0 down
wifi-menu
