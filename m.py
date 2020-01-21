import os
from pathlib import Path
import shutil

scripts = ['/usr/bin/bri']
X = [
    '~/.Xresources',
    '~/.xprofile',
    '~/.xinitrc',
    '~/.Xclients',
    ]
ZSH = [
    '~/.zshrc'
    ]
BASH = [
    '~/.bashrc',
    '~/.profile', # not loaded when bash_profile present
    '~/.bash_profile',
    ]
I3 = ['~/.config/i3/']

directory = [scripts, X, ZSH, BASH, I3]

for d in directory:
    for f in d:
        os.system(f'cp -r --parent {f} .')
