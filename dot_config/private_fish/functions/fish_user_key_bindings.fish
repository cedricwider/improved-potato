function fish_user_key_bindings
  fish_default_key_bindings -M insert
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end
  fish_vi_key_bindings insert
  fzf_key_bindings

  # todoist
  bind -M insert \eti fzf_todoist_item
  bind -M insert \etp fzf_todoist_project
  bind -M insert \etl fzf_todoist_labels
  bind -M insert \etc fzf_todoist_close
  bind -M insert \etd fzf_todoist_delete
  bind -M insert \eto fzf_todoist_open
  bind -M insert \ett fzf_todoist_date
  bind -M insert \etq fzf_todoist_quick_add
end
