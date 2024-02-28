function update -d 'curl patch'
  curl -s -X PATCH -H 'Accept: application/json' -H 'Content-Type: application/json' -d $argv[2] $argv[1] | jq '.'
end
