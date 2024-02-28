function mm
  set -l project_directory (find ~/Developer ~/Developer/work -maxdepth 2 -mindepth 2 -type d | fzf --height 40%)
  set -l session_name (basename $project_directory)
  tmux has-session -t $session_name 2>/dev/null

  if test $status -ne 0
    tmuxinator start --no-attach default -n $session_name workdir=$project_directory
  end

  tmux switch-client -t $session_name
end

