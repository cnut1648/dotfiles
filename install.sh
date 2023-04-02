x=(
    ########## cmd line tools
    cmus clementine # music
    neofetch feh
    ranger
    picom # compositor
    xdotool xclip xcape
    youtube-dl
    fasd
    pacui # analyze pacman
    mlocate
    unrar
    ncdu # disk usage in command line, replace du
    speedtest-cli
    wmctrl
    fd # better find
    duf # better df
    ripgrep # replace grep
    tree # plain text tree
    lsd # ls with icon, lsd --tree = tree with icon
    gping # ping with graph
    bat # cat with syntax highlight
    git-delta # git diff with hightlight
    bottom # sys monitoring, use `btm`, better than gtop (no binaries) / glances (not good looking)
    fzf
    jq

    ######### system
    plasma-browser-integration
    xorg-xev xorg-xrandr
    ibus ibus-libpinyin # ibus and chinese input method
    manjaro-pipewire # audio replace PulseAudio

    ######### application
    qbittorrent
    xournalpp # whiteboard
    graphviz
    rofi
    valgrind # c debug and memory leakage
    timeshift
    kitty kitty-terminfo # console
    python-jedi python-pynvim # nvim related
    # global: nvim gtags needed
    # ctags: better gtags in nvim
    global ctags
    flameshot
    pandoc

    ######### programming
    mariadb redis # db
    docker docker-compose
    cmake gdb make boost # c
    nodejs npm yarn # js
    tomcat8 gradle maven # java
    # virtualenv -p /path/to/python venv
    python-virtualenv
    # amm, ipython for scala
    scala sbt ammonite
)

# gurobi: python linear programming
# fava: UI for beancount
y=(
    ########## cmd line tools
    dust # better du
    cmatrix # hacker like
    neovim-git
    xcwd-git # change dir, need for ranger
    # better Ctrl-R
    # after install add in .zshrc
    # eval "$(mcfly init zsh)"
    # then Ctrl-R auto use mcfly
    mcfly

    ########## system
    # i3wm auto tile windows if having many windows at same time
    autotiling
    python-i3-grid # support i3 grid
    ibus-qt # support UI in Qt for ibus

    ########## applications
    typora calibre foliate sioyek-git logseq-desktop-git # ebook & notes
    google-chrome
    # only use free version, has most of features
    masterpdfeditor-free
    inkscape drawio-desktop-bin # drawing
    tor-browser
    autokey-qt # OneQuick in Linux
    chromium
    geeqie # image viewer
    rslsync # sync between devices
    beancount fava # accounting

    ########## programming
    clion webstorm intellij-idea-ultimate-edition datagrip pycharm-professional # Jetbrains IDE
    visual-studio-code-bin # vs code
    mycli # better mysql CLI
    lazygit # better git visualized
    postman-bin
    firebase-tools # firebase CLI
    # node version manager
    # only activate after source /usr/share/nvm/init-nvm.sh
    # if not use system one
    nvm
    ts-node # ts version of node
)

optional=(
    ########## cmd line tools
    adbtuifm # go's adb fm

    ########## application
    obsidian joplin joplin-desktop zotero # note
    activitywatch-bin # monitor screen for daily activity
    wireshark-qt # net check
    doublecmd # dual panel fm
    zathura-pdf-mupdf zathura-djvu # fast pdf reader, use sioyek instead
    emacs

    ########## programming
    jmeter # java request monitor
    gurobi # optimization
    # can't use aur matlab since it needs a license file
    # have to search matlab USC to download zip & ./install
    # manually
    matlab
    apache-spark # spark-submit
    rstudio-desktop-bin # r
    solana # web3
    android-studio android-emulator # android
    # r2cutter: Qt for cutter, reverse engineering
    # r2ghidra: r2cutter's decompiler plugin
    r2cutter r2ghidra
    ida-free # free version only, hard to hack
    qemu # simulator required for xv6
    texlive-most texlive-langchinese texlab # tex support + LSP
    # latex pkg mgmr
    tllocalmgr
    racket # IDE for racket: DrRacket
    arduino arduino-avr-core # IDE & for compile arduino code (can without arduino IDE)
    postgresql postgis # geographic support for postgresql
    redshift # plasma has own night color
)

sudo pacman -Syu;
sudo pacman -S ${x[@]};
yay -Syu ${y[@]}
