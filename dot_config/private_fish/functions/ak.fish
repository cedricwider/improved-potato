function ak
  echo $argv
  if count $argv > 0
    tmux kill-session -t $argv[1]
  else
    tmux kill-session -t (basename $PWD)
  end
end
