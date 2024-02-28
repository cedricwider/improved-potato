function md_preview
  chromium --app=http://localhost:7777 &
  grip $argv localhost:7777
end
