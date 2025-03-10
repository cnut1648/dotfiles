import os
import subprocess
from pathlib import Path
import shutil

home = Path("~").expanduser()
pwd = Path(__file__).parent
# remove backup folder if exists
if os.path.exists(pwd / "backup"):
    shutil.rmtree(pwd / "backup")

# custom scripts
scripts = [
    '/usr/bin/color_show',
    home / "remove_newline_when_select.sh"
]
# related to X11
X = [
    # home / ".Xresources",
    home / ".xprofile",
    home / ".xinitrc",
    home / ".Xclients",
]

SHELLS = [
    home / ".zshrc", # zsh
    # bash
    home / ".bashrc",
    home / ".profile", # not loaded when bash_profile present
    home / ".bash_profile",
    ]

software = [
    home / ".ssh/config", # ssh key and config
    home / ".gdbinit", # gdb dashbaord
    home / ".gitconfig",
    home / ".config/i3/",
    home / ".config/i3status/",
    home / ".config/kitty/",
    home / ".config/ranger/",
    # vs code
    home / ".config/Code/User/settings.json",
    home / ".config/Code/User/keybindings.json",
    home / ".config/Cursor/User/settings.json",
    home / ".config/Cursor/User/keybindings.json",
    home / ".config/rofi",
    home / ".local/share/rofi", # themes
    home / ".emacs.d/init.el",
    home / ".config/autokey/data/",
    home / ".config/zathura/",
    home / ".config/cmus/",
    home / ".config/sioyek",
    home / ".config/neofetch",
    home / ".config/doublecmd",
    home / ".config/.ripgreprc",
    # Ipython
    home / ".ipython/profile_default/ipython_config.py",
    home / ".jupyter/jupyter_lab_config.py",
    # jetbrains
    home / ".ideavimrc",
    # conda
    home / ".condarc",
    # wallpaper
    home / "Pictures"
]

directory = [scripts, X, SHELLS, software]

for d in directory:
    for f in d:
        if os.path.exists(f):
            src = str(f).replace(str(home), "home/USERNAME")
            if src.startswith("/"):
                src = src[1:]
            dst = pwd / "backup" / src
            Path(dst).parent.mkdir(parents=True, exist_ok=True)
            cmd = [
                "cp", "-r", f, dst
            ]
            print(f, cmd)
            subprocess.run(
                cmd,
            )
