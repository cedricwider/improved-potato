#!/bin/fish
function find_project
  fd -L --exact-depth 2 --type d --type l . "$HOME/Developer/work/" | wofi --dmenu --matching fuzzy
end

set -l project (find_project)
kitty @ --to unix:/tmp/kitty  launch --type=tab --cwd=$project --title=(basename $project) nvim
