x='neovim neofetch xclip krusader mc doublecmd-qt5 cmus redshift termite plasma-browser-integration ranger xorg-xev xorg-xrandr
    andromeda-wallpaper plasma5-themes-andromeda sddm-andromeda-theme andromeda-icon-theme xdotool 
    speedtest-cli timeshift cmake gdb zathura-pdf-mupdf wmctrl flameshot r fzf nodejs npm jq'
y='qtpad-git clion webstorm intellij-idea-ultimate-edition pycharm-professional autokey cmatrix rstudio-desktop-bin autotiling'
sudo pacman -Syu;
sudo pacman --needed -S ${x}
