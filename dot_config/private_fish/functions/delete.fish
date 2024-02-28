function delete -d 'curl delete json'
  curl -s -X DELETE -H 'Accept: application/json' $argv | jq '.'
end
