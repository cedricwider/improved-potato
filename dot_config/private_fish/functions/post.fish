function post -d 'post json using curl'
  curl -s -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d $argv[2] $argv[1] | jq '.'
end
