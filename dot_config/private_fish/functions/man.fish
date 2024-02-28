function man --description "wrap the 'man' manual page opener to use color in formatting"
  echo 'using fish man'
  # based on this group of settings and explanation for them:
  # http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
  # converted to Fish shell syntax thanks to this page:
  # http://askubuntu.com/questions/522599/how-to-get-color-man-pages-under-fish-shell/650192

  set -x LESS_TERMCAP_mb (set_color red)
  set -x LESS_TERMCAP_md (set_color red)
  set -x LESS_TERMCAP_me (set_color normal)
  set -x LESS_TERMCAP_se (set_color normal)
  set -x LESS_TERMCAP_so (set_color -b blue yellow)
  set -x LESS_TERMCAP_ue (set_color normal)
  set -x LESS_TERMCAP_us (set_color green)

  command man $argv
end
