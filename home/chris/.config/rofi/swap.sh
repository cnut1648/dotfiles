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
	else
		echo "enter numeric"
		echo "!!You are now in $A"
	fi
else
	echo "!!You are now in $A"
fi
