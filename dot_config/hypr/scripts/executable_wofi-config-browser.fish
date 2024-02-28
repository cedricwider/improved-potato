#!/bin/fish
function find_project
  fd -L --exact-depth 1 --type d --type l . "$HOME/.config/" | wofi --dmenu --matching fuzzy
end

set -l project (find_project)
kitty @ --to unix:/tmp/kitty launch --type=tab --cwd=$project --title=(basename $project) nvim 
