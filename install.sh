x='neovim neofetch xclip doublecmd-qt5  cmus redshift kitty kitty-terminfo plasma-browser-integration ranger xorg-xev xorg-xrandr docker docker-compose fasd manjaro-i3-settings
    andromeda-wallpaper plasma5-themes-andromeda sddm-andromeda-theme andromeda-icon-theme xdotool mariadb youtube-dl ncdu xcape graphviz
    speedtest-cli timeshift cmake gdb zathura-pdf-mupdf zathura-djvu wmctrl flameshot fzf nodejs npm jq python-jedi python-pynvim ripgrep yarn emacs texlive-most tomcat8 gradle maven
    fd clementine boost racket python-virtualenv ibus ibus-libpinyin ctags'

# kite is installer, need ./kite-installer install
y='qtpad-git typora clion webstorm intellij-idea-ultimate-edition pycharm-professional autokey-qt cmatrix rstudio-desktop-bin autotiling geeqie mycli xcwd-git lazygit calibre-git postman-bin arduino arduino-avr-core python-i3-grid kite joplin jmeter zotero joplin-desktop vmware-station ibus-qt'


sudo pacman -Syu;
sudo pacman --needed -S ${x}
