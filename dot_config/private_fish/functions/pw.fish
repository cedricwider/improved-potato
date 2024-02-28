function pw
  set -l pass_id (lpass ls | fzf | awk '{print $3}' | sed -e 's/]//')
  lpass show --quiet --clip --password $pass_id
end
