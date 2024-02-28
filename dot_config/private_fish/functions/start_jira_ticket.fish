function start_jira_ticket
  set -l jira_ticket (jira issue list --plain --no-headers -q'project in ("PRO Team", Integrations, "Customer Approval Process") AND Sprint in openSprints()' -s~Closed -ax --columns "Key,Summary" | select_jira_ticket)
  set -l ticket_name (ticketify $jira_ticket)
  set -l branch_name (branchify $jira_ticket)

  git checkout main -q
  git pull -q
  echo \uf00c" master branch is up to date"

  git checkout -qb $branch_name
  # git branch --set-upstream-to $branch_name origin/$branch_name 1>/dev/null 2>&1
  echo \uf00c" feature branch is set up"

  jira issue assing $ticket_name (jira me)
  echo \uf00c" ticket $ticket_name assigned"

  jira issue move $ticket_name 'In Progress'
  echo \uf00c" ticket $ticket_name started"

  echo ""
  echo "🤓 All Done --- Happy Hacking!"
end
