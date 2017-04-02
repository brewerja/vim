#!/bin/bash

current=$(dconf read /org/gnome/desktop/input-sources/xkb-options)
swapped="['caps:swapescape']"
capslock="['caps:capslock']"
echo "Current status: $current"

if [ "$current" == "$swapped" ]
then
  echo "Making caps and escape WORK NORMALLY"
  dconf write /org/gnome/desktop/input-sources/xkb-options $capslock
elif [ "$current" == "$capslock" ]
then
  echo "Swapping caps and escape"
  dconf write /org/gnome/desktop/input-sources/xkb-options $swapped
else
  echo "caps is not swapescaped nor capslock. Doing nothing."
fi
