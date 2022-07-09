#!/usr/bin/env bash

theme="switcher-theme"
dir="$HOME/.config/rofi/window_switcher"

rofi -no-lazy-grab -show window -modi window -theme $dir/"$theme"
