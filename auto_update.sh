#! /usr/bin/env zsh
sudo pacman -Syu
yay -Syu
BASH_ENV=~/.bashrc
bash -c ". '$BASH_ENV' && conda update --all"
unset BASH_ENV
