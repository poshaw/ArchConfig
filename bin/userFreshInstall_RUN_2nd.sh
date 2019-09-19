#! /bin/bash

mkdir -p ${HOME}/downloads
cd  ${HOME}/downloads
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -sri
install -Dm644 /usr/share/doc/polybar/config ${HOME}/.config/polybar/config
sudo mount /dev/sdb1 /mnt/usb -o uid=${USER},gid=${USER},fmask=113,dmask=002
cd /mnt/usb/arch

echo "alias vi=nvim" >> /home/phil/.bashrc
