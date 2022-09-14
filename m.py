import os
#from pathlib import Path
# import shutil

scripts = [
        '/usr/bin/bri',
        '/usr/bin/color_show'
        ]

X = [
    '~/.Xresources',
    '~/.xprofile',
    '~/.xinitrc',
    '~/.Xclients',
    '/etc/sddm.conf' # sddm window dpi support hidpi
    ]

ZSH = [
    '~/.zshrc',
    '~/.oh-my-zsh/custom'
    ]

BASH = [
    '~/.bashrc',
    '~/.profile', # not loaded when bash_profile present
    '~/.bash_profile',
    ]

software = [
        # gdb dashbaord
        '~/.gdbinit',
        '~/.gitconfig',
        '~/.config/i3/',
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
        '~/.config/.ripgreprc',
        # Ipython
        '~/.ipython/profile_default/ipython_config.py',
        '~/.jupyter/jupyter_lab_config.py',
         # Plasma desktop widgets
         '~/.config/plasmashellrc',
         # '/home/chris/.local/share/plasma/plasmoids',
         # jetbrains
        '~/.ideavimrc',
        # feh & neofetch
        '~/Pictures/',
        # conda
        '~/.condarc',
        ]

directory = [scripts, X, ZSH, BASH, software]

for d in directory:
    for f in d:
        os.system(f'cp -r --parent {f} .')
