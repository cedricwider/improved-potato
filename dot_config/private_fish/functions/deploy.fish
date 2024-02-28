function deploy
  cp -rf . ~/Developer/work/deploy
  pushd ~/Developer/work/deploy
  lcl deploy $argv
  popd
  rm -rf ~/Developer/work/deploy
end
