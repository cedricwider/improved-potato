# abbreviations
abbr -a a 'tmux -f ~/.config/tmux/tmux.conf'
abbr -a be 'bundle exec'
abbr -a c 'code'
abbr -a cr 'clear ; reset'
abbr -a du dust
abbr -a g 'git'
abbr -a ga 'git add'
abbr -a h 'hub'
abbr -a k 'kubectl'
abbr -a la lsd -lah
abbr -a lg lazygit
abbr -a ll lsd -lh
abbr -a ls lsd
abbr -a p 'pamac'
abbr -a pu 'pamac update'
abbr -a rc 'be rubocop -a'
abbr -a rr ranger
abbr -a serve 'live-server --port=9090'
abbr -a y 'paru -Ss'
abbr -a yay 'paru'
abbr -a yr 'paru -Rsn'
abbr -a ys 'paru -S'
abbr -a yy 'paru -Syyu'
abbr -a rs 'be rails s'
abbr -a s 'bundle exec rspec'
abbr -a t 'task ready -delegated'
abbr -a tk 'task'
abbr -a tl 'task list'
abbr -a vv 'neovide --wsl'

# alias
alias !!='eval command $history[1]'
alias cat='bat --theme=catppuccin'
alias man='BAT_THEME=catppuccin batman'
alias cb='xclip -i -sel clip'
alias curl='curlie'
alias find='fd'

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
