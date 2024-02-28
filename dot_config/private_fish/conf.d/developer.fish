# NVM Configuration
# set -g NVM_DIR "$HOME/.config/nvm"
# fenv "$NVM_DIR/nvm.sh"


# Add rust stuff to PATH
if [ -f '~/.cargo/env' ]
    source ~/.cargo/env
end

# rbenv setup
if status is-interactive
    source (rbenv init -|psub)
end

# Update path to include snap stuff
set PATH /var/lib/snapd/snap/bin $PATH
set XDG_DATA_DIRS /var/lib/snapd/desktop/:$XDG_DATA_DIRS

# Source fnm (node version manager)
fnm env --use-on-cd --multi --log-level=quiet | source

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
