#!/bin/sh

# install necessary binaries
# fedora
echo "+---------------------+"
echo "| Installing packages |"
echo "+---------------------+"
sudo dnf install -y picom polybar rofi alacritty feh

mkdir -p ~/.config/picom
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/i3



cp -rv alacritty ${HOME}/.config
cp -rv picom ${HOME}/.config
cp -rv rofi ${HOME}/.config

cp -rv i3 ${HOME}/.config

# cp -v zshrc ${HOME}/.zshrc
# cp -v vimrc ${HOME}/.vimrc

cd ${HOME}/.config/i3

chmod u+x setup-font-polybar.sh
./setup-font-polybar.sh


# echo "+---------------------+"
# echo "| Installing Lunarvim |"
# echo "+---------------------+"
# cd ${HOME}
# LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

# cp -rv lvim/config.lua ${HOME}/.config/lvim/config.lua

echo "Done ✅"
