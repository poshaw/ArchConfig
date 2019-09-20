#! /bin/bash

# update all packages
sudo pacman -Syu

# Set up git
cd  ${HOME}
git config --global user.name "Phil Shaw"
git config --global user.email "poadshaw@gmail.com"
git remote set-url origin git@github.com:poshaw/archconfig.git

# Make folders if then do not already exist
[ ! -d "%{HOME}/downloads"  ] && mkdir -p ${HOME}/downloads
[ ! -d "/mnt/usb"  ] && sudo mkdir -p /mnt/usb

# Install polybar
cd  ${HOME}/downloads
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -sri
# install -Dm644 /usr/share/doc/polybar/config ${HOME}/.config/polybar/config
curl -fLo ~/.config/polybar/config https://raw.githubusercontent.com/poshaw/archconfig/master/.config/polybar/config

# Install plug for vim:
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Python extensions
cd  ${HOME}
python -m pip install --user --upgrade pynvim


# sudo mount /dev/sdb1 /mnt/usb -o uid=${USER},gid=${USER},fmask=113,dmask=002
# cd /mnt/usb/arch
