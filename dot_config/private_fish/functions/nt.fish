function nt --wraps='fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test --' --description 'alias nt fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test --'
  fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test -- $argv
        
end
