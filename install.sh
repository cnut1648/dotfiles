x='neovim neofetch xclip doublecmd-qt5 cmus redshift kitty kitty-terminfo plasma-browser-integration ranger xorg-xev xorg-xrandr
    andromeda-wallpaper plasma5-themes-andromeda sddm-andromeda-theme andromeda-icon-theme xdotool mariadb youtube-dl ncdu xcape
    speedtest-cli timeshift cmake gdb zathura-pdf-mupdf zathura-djvu wmctrl flameshot fzf nodejs npm jq python-jedi python-pynvim ripgrep yarn emacs texlive-most tomcat8'
y='qtpad-git clion webstorm intellij-idea-ultimate-edition pycharm-professional autokey cmatrix rstudio-desktop-bin autotiling geeqie mycli xcwd lazygit vmware-station calibre-python3'
sudo pacman -Syu;
sudo pacman --needed -S ${x}
