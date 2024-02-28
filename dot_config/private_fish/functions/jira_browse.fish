function jira_browse
  for ticket in $argv
    jira browse $ticket
  end
end
