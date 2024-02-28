function j
  if test (count $argv) -eq 0
    jira
    return 0
  end

  set -l command $argv[1]
  switch $command
  case b
    jira browse $argv[2]
  case c
    jira comment $argv[2]
  case e
    jira edit $argv[2]
  case m
    jira mine | select_jira_ticket
  case o
    jira ls -p PRO -S OPEN | select_jira_ticket
  case s
    jira sprint | select_jira_ticket
  case t
    jira take $argv[2]
  case v
    jira view $argv[2]
  case x
    jira close $argv[2]
  case '*'
    jira $argv
  end
end
