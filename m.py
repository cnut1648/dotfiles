import os
#from pathlib import Path
#import shutil

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
    '~/.zshrc'
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
        '~/.config/autokey/data/My',
        '~/.config/cmus/',
        '~/.config/neofetch',
        '~/.config/nvim/init.vim',
        '~/.config/doublecmd'
         # Plasma desktop widgets
         '~/.config/plasmashellrc',
         # jetbrains
        '~/.PyCharm2019.3/config',
        '~/.IntelliJIdea2019.3/config',
        '~/.WebStorm2019.3/config',
        '~/.CLion2019.3/config',
        '~/.DataGrip2019.3/config',
        # feh & neofetch
        '~/Pictures/'
        ]

directory = [scripts, X, ZSH, BASH, software]

for d in directory:
    for f in d:
        os.system(f'cp -r --parent {f} .')
