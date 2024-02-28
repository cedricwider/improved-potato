function watchers
  curl -s -u $JIRA_USER:(pass show jira.localsearch.ch/$JIRA_USER) -X GET -H 'Content-Type: application/json' "https://jira.localsearch.ch/rest/api/2/issue/$argv/watchers" | jq ".watchers[].displayName"
end
