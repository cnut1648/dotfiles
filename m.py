import os
#from pathlib import Path
# import shutil

scripts = ['/usr/bin/bri',
        '/usr/bin/color_show']
X = [
    '~/.Xresources',
    '~/.xprofile',
    '~/.xinitrc',
    '~/.Xclients',
    '/etc/sddm.conf' # sddm window dpi support hidpi
    ]
ZSH = [
    '~/.zshrc',
    '~/.oh-my-zsh'
    ]
BASH = [
    '~/.bashrc',
    '~/.profile', # not loaded when bash_profile present
    '~/.bash_profile',
    ]
software = ['~/.config/i3/',
        '~/.config/i3status/',
        '~/.config/kitty/',
        '~/.config/ranger/',
        '~/.config/rofi',
        '~/.emacs.d/init.el',
        '~/.config/autokey/data/My',
        '~/.config/zathura/',
        '~/.config/cmus/',
        '~/.config/neofetch',
        '~/.config/nvim/init.vim',
        '~/.config/doublecmd',
        "~/.mozilla/firefox/h1c7m981.default-release/ghacks-user.js/user.js",
        "~/.mozilla/firefox/h1c7m981.default-release/ghacks-user.js/user-overrides.js",
        "~/.mozilla/firefox/h1c7m981.default-release/chrome/userChrome.css",
         # Plasma desktop widgets
         '~/.config/plasmashellrc',
         # jetbrains
        '~/.PyCharm2019.3/config',
        '~/.IntelliJIdea2019.3/config',
        '~/.WebStorm2019.3/config',
        '~/.CLion2019.3/config',
        '~/.DataGrip2019.3/config',
        '~/.ideavimrc',
        # feh & neofetch
        '~/Pictures/'
        ]

directory = [scripts, X, ZSH, BASH, software]

for d in directory:
    for f in d:
        os.system(f'cp -r --parent {f} .')
