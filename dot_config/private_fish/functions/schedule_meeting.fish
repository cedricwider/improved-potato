function schedule_meeting
  set -l body "{\"title\":\"$argv[1]\",\"body\":\"$argv[2]\", \"attendees\": \"$argv[3]\"}"

  curl -X POST "https://prod-186.westeurope.logic.azure.com:443/workflows/94acfa49e10647deb5ba61e4ce7d1068/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=_MFWtqp1GHLN8snZCbT8UbvkUg8yOYKPTrGhSW0Phkw" \
       -H 'Content-Type: application/json' \
       -d $body

  echo "✅ Meeting scheduled"
end
