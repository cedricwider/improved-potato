function gro
  set -l BRANCH_NAME (git rev-parse --abbrev-ref HEAD)
  git push --set-upstream origin $BRANCH_NAME
end

