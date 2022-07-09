#!/usr/bin/env bash

style="$($HOME/.config/rofi/screenshot/style.sh)"

dir="$HOME/.config/rofi/screenshot/$style"
rofi_command="rofi -theme $dir/screenshot.rasi"
screenshots_dir=/home/ra/Pictures/Screenshots

# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "Please install 'scrot' first."
}

# Options
screen=""
area=""
window=""

# Variable passed to rofi
options="$screen\n$area\n$window"

chosen="$(echo -e "$options" | $rofi_command -p '$option' -dmenu -selected-row 1)"
case $chosen in
    $screen)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot $screenshots_dir/'Screen_%Y-%m-%d-%S_$wx$h.png' -e 'viewnior $f' 
		else
			msg
		fi
        ;;
    $area)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -s $screenshots_dir/'Area_%Y-%m-%d-%S_$wx$h.png' -e 'viewnior $f'
		else
			msg
		fi
        ;;
    $window)
		if [[ -f /usr/bin/scrot ]]; then
			sleep 1; scrot -u $screenshots_dir/'Window_%Y-%m-%d-%S_$wx$h.png' -e 'viewnior $f'
		else
			msg
		fi
        ;;
esac

