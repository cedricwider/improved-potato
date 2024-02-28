function organize_grooming
  set -l summary (curl -s -u $JIRA_USER:(pass show jira.localsearch.ch/$JIRA_USER) -X GET -H 'Content-Type: application/json' "https://jira.localsearch.ch/rest/api/2/issue/$argv" | jq '.fields.summary' | sed -e 's/"//g')
  set -l watchers (curl -s -u $JIRA_USER:(pass show jira.localsearch.ch/$JIRA_USER) -X GET -H 'Content-Type: application/json' "https://jira.localsearch.ch/rest/api/2/issue/$argv/watchers" | jq '[.watchers[].emailAddress]|join(";")' | sed -e 's/"//g')
  echo (string join " " "...scheduling meeting for" (string upper $argv) "with" $watchers "...")

  set -l title (string join " " "✏️  Groom" (string upper $argv) $summary)
  set -l body (string join " " "Let us groom" (string upper "[$argv]") "https://jira.localsearch.ch/browse/$argv")
  schedule_meeting $title $body $watchers
end
