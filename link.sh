#! /bin/sh

ln -vs ${PWD}/i3 ~/.config/i3
ln -vs ${PWD}/networkmanager-dmenu ~/.config/networkmanager-dmenu
ln -vs ${PWD}/polybar ~/.config/polybar
ln -vs ${PWD}/rofi ~/.config/rofi
ln -vs ${PWD}/share ~/.config/share

ln -fnsv ${PWD}/vim/.vimrc ${HOME}/.vimrc
ln -fnsv ${PWD}/vim/.vimrc ${HOME}/.config/nvim/init.vim
