#!/usr/bin/env fish
function find_directory
  fd -L -d 3 -t d -t l . "$HOME" | wofi --dmenu --matching fuzzy
end

set -l directory (find_directory)
kitty launch --type=os-window --cwd=$directory --title=(basename $directory) ranger
