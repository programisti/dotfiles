#!/bin/bash
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
feh --bg-scale Pictures/andromeda.jpg
exec i3

