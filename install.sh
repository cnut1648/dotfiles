# global: gtags
# postgis: geographic support for postgresql
x='neovim neofetch xclip doublecmd-qt5 cmus redshift kitty kitty-terminfo plasma-browser-integration ranger feh xorg-xev xorg-xrandr docker docker-compose fasd manjaro-i3-settings xdotool mariadb youtube-dl ncdu xcape graphviz valgrind speedtest-cli timeshift cmake gdb zathura-pdf-mupdf zathura-djvu wmctrl flameshot fzf nodejs npm jq python-jedi python-pynvim ripgrep yarn emacs tomcat8 gradle maven fd clementine boost python-virtualenv ibus ibus-libpinyin ctags pacui mlocate cmake unrar global postgresql postgis scala sbt tree ammonite'

# kite is installer, need ./kite-installer install
y='qtpad-git typora clion webstorm intellij-idea-ultimate-edition datagrip pycharm-professional autokey-qt chromium cmatrix rstudio-desktop-bin autotiling geeqie mycli xcwd-git lazygit calibre postman-bin python-i3-grid kite joplin jmeter zotero joplin-desktop ibus-qt visual-studio-code-bin wireshark-qt gurobi apache-spark rslsync activitywatch-bin'


# qemu: simulator required for xv6
# r2cutter: Qt for cutter, reverse engineering
# r2ghidra: r2cutter's decompiler plugin
# racket: IDE for racket: DrRacket
# avr: for compile arduino code (can without arduino IDE)
optional='r2cutter r2ghidra qemu texlive-most racket arduino arduino-avr-core '


sudo pacman -Syu;
# sudo pacman --needed -S ${x}
sudo pacman --needed -Sy ${x}
yay -Syu ${y}
