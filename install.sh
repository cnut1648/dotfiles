x=(
    neofetch xclip
    # doublecmd-
    cmus redshift kitty kitty-terminfo plasma-browser-integration ranger
    feh
    xorg-xev xorg-xrandr docker docker-compose fasd
    # manjaro-i3-settings
    xdotool mariadb youtube-dl
    # disk usage in command line, replace du
    ncdu
    qbittorrent
    xcape graphviz
    # c debug
    valgrind
    speedtest-cli timeshift cmake gdb
    # fast pdf reader
    # zathura-pdf-mupdf zathura-djvu
    wmctrl flameshot fzf nodejs npm jq
    # python support for nvim
    python-jedi python-pynvim
    # replace grep
    ripgrep
    # audio replace PulseAudio
    manjaro-pipewire
    yarn emacs tomcat8 gradle maven
    # better find
    fd
    # better df
    duf
    # music player
    clementine
    pandoc
    boost
    # virtualenv -p /path/to/python venv
    python-virtualenv
    # ibus and chinese input method
    ibus ibus-libpinyin
    # analyze pacman
    pacui mlocate cmake unrar
    # global: nvim gtags needed
    # ctags: better gtags in nvim
    global ctags
    # good scientific pdf reader
    sioyek
    # amm, ipython for scala
    scala sbt ammonite
    # plain text tree
    tree
    # ls with icon
    # lsd --tree = tree with icon
    lsd
    # ping with graph
    gping
    # cat with syntax highlight
    bat
    # git diff with hightlight
    git-delta
    # sys monitoring
    # better than gtop (no binaries) / glances (not good looking)
    # `btm`
    bottom
    redis
)

# kite is
# gurobi: python linear programming
# fava: UI for beancount
y=(
    # better ebook
    foliate
    inkscape
    typora
    # better du
    dust
    tor-browser
    drawio-desktop-bin
    # Jetbrains
    clion webstorm intellij-idea-ultimate-edition datagrip pycharm-professional
    # OneQuick in Linux
    autokey-qt
    chromium cmatrix
    # rstudio-desktop-bin
    # i3wm auto tile windows if having many windows at same time
    autotiling
    # image viewer
    geeqie
    # only use free version, has most of features
    masterpdfeditor-free
    # better mysql CLI
    mycli
    # change dir, need for ranger
    xcwd-git
    lazygit calibre postman-bin
    # support i3 grid
    python-i3-grid
    # installer, need ./kite-installer install
    kite
    # joplin joplin-desktop
    # jmeter
    zotero
    # support UI in Qt for ibus
    ibus-qt
    visual-studio-code-bin
    # wireshark-qt gurobi
    # spark-submit
    # apache-spark
    rslsync
    # monitor screen for daily activity
    # activitywatch-bin
    # notes
    logseq-desktop
    # obsidian
    # accounting
    beancount fava
    # firebase CLI
    firebase-tools
    # better Ctrl-R
    # after install add in .zshrc
    # eval "$(mcfly init zsh)"
    # then Ctrl-R auto use mcfly
    mcfly
    # node version manager
    # only activate after source /usr/share/nvm/init-nvm.sh
    # if not use system one
    nvm
    # ts version of node
    ts-node
)

optional=(
    neovim-git
    # solana
    # android
    android-emulator
    android-studio
    # r2cutter: Qt for cutter, reverse engineering
    # r2ghidra: r2cutter's decompiler plugin
    r2cutter r2ghidra
    # simulator required for xv6
    qemu
    # tex support + LSP
    texlive-most texlive-langchinese texlab
    # latex pkg mgmr
    tllocalmgr
    # IDE for racket: DrRacket
    racket
    # arduino: IDE
    # arduino-avr-core: for compile arduino code (can without arduino IDE)
    arduino arduino-avr-core
    # free version only, hard to hack
    ida-free
    # geographic support for postgresql
    postgresql postgis
    # can't use aur matlab since it needs a license file
    # have to search matlab USC to download zip & ./install
    # manually
    matlab
)

others=(
    # go
    adbtuifm
)

sudo pacman -Syu;
# sudo pacman --needed -S ${x}
sudo pacman --needed -Sy ${x}
yay -Syu ${y}
