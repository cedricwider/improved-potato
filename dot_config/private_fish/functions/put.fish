function put -d 'put json using curl'
  curl -s -X PUT -H 'Accept: application/json' -H 'Content-Type: application/json' -d $argv[2] $argv[1] | jq '.'
end
