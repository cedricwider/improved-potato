function get -d 'curl get'
  curl -s -H 'Accept: application/json' $argv | jq '.'
end
