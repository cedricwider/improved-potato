abbr -a v nvim

if test -n "$NVIM_LISTEN_ADDRESS"
  set VISUAL "nvr -cc split --remote-wait +'set bufhidden wipe'"
  set EDITOR "nvr -cc split --remote-wait +'set bufhidden wipe'"
  set BUNDLE_EDITOR "nvr -cc split --remote-wait +'set bufhidden wipe'"
else
  set VISUAL 'nvim'
  set EDITOR 'nvim'
  set BUNDLER_EDITOR 'nvim'
end

# neovim as man pager
if test -n "$NVIM_LISTEN_ADDRESS"
  set -x MANPAGER "/usr/local/bin/nvr -c 'Man!' -o -"
end

