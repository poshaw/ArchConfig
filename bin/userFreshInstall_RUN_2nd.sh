#! /bin/bash


# Make downloads folder
mkdir -p ${HOME}/downloads
cd  ${HOME}/downloads

# Set up git
git config --global user.name "Phil Shaw"
git config --global user.email "poadshaw@gmail.com"

# Install polybar
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -sri
# install -Dm644 /usr/share/doc/polybar/config ${HOME}/.config/polybar/config
curl -fLo ~/.config/polybar/config https://raw.githubusercontent.com/poshaw/archconfig/master/.config/polybar/config

# Install plug for vim:
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

python -m pip install --user pynvim


sudo mount /dev/sdb1 /mnt/usb -o uid=${USER},gid=${USER},fmask=113,dmask=002
cd /mnt/usb/arch
