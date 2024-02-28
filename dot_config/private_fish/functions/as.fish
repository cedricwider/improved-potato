function as
  echo $argv
  if count $argv > 0
    # tmux -f ~/.config/tmux/tmux.conf new-session -s $argv[1]
    tmuxinator start default -n $argv[1]
  else
    # tmux -f ~/.config/tmux/tmux.conf new-session -s (basename $PWD)
    tmuxinator start default -n (basename $PWD)
  end
end
