#!/bin/bash
fd -L -d 3 -t d -t l . "$HOME" | wofi --dmenu | xargs /usr/bin/kitty -e ranger 
