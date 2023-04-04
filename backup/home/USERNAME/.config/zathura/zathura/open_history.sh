#! /usr/bin/env zsh

selected=$(\
        cat ~/.local/share/zathura/history | rg "^\[/" \
        | rofi -dmenu -i -markup-rows
        )

# exit if nothing is selected
[[ -z $selected ]] && exit


zathura "${selected[2,-2]}"

exit 0
