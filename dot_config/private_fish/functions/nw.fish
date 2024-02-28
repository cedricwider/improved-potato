function nw --wraps='fzf | xargs npm run test:watch --' --wraps='fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test:watch --' --wraps='fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test --' --description 'alias nw fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test:watch --'
  fzf --preview="bat --style numbers,changes --color=always {} | head -n 500" | xargs npm run test:watch -- $argv
        
end
