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
        '~/.config/termite/config',
         # Plasma desktop widgets
         '~/.config/plasmashellrc',
        '~/.config/plasma-org.kde.plasma.desktop-appletsrc'
        ]

directory = [scripts, X, ZSH, BASH, software]


for d in directory:
    for f in d:
        os.system(f'cp -r --parent {f} .')
