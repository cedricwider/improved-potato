function binstub
  direnv allow
  touch .envrc
  echo "export PATH=$PWD/bin:"'$PATH' >> .envrc
  direnv allow
end
