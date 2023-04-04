#! /usr/bin/env zsh
function current_workspace(){
	i3-msg -t get_workspaces \
	| jq '.[] | select(.focused==true).name' \
	| cut -d "\"" -f 2
}
A=$(current_workspace)
if ! [[ -z "$@" ]] then
	if [[ $1 =~ '[0-9]+' ]] then
		echo "swap workspace $1 and $A"
		i3-msg -q "rename workspace $1 to tmp; rename workspace $A to $1; rename workspace tmp to $A"
	elif [[ $1 =~ 'poweroff' ]] then
		systemctl poweroff
	elif [[ $1 =~ 'logout' ]] then
		loginctl kill-session 1
	elif [[ $1 =~ 'reboot' ]] then
		systemctl reboot
	elif [[ $1 =~ 'lock' ]] then
		echo $1
		loginctl lock-session 1
	elif [[ $1 =~ 'screenshot' ]] then echo "not done"
	else
		echo "enter numeric"
		echo "!!You are now in $A"
	fi
else
	echo "!!You are now in $A"
	echo "-- screenshot"
	echo "-- logout"
	echo "-- lock"
	echo "-- reboot"
	echo "-- poweroff"
fi
