function branch
  if test -d .git;
    echo " "(git rev-parse --abbrev-ref HEAD)
  else
    echo "*"
  end
end
