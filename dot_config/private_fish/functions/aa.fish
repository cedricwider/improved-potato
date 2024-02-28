function aa
  echo $argv
  if count $argv > 0
    tmux -f ~/.config/tmux/tmux.conf a -t $argv[1]
  else
    tmux -f ~/.config/tmux/tmux.conf a -t (basename $PWD)
  end
end
