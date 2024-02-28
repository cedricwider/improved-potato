function nc --wraps='npm run check' --wraps='npm run checks' --description 'alias nc npm run checks'
  npm run checks $argv
        
end
