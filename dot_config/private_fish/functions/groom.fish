function groom
  echo $argv
  schedule grooming $argv[1]
  jira labels add $argv[1] scheduled
  echo $argv[1] >> ~/work/localsearch/groomed_tickets.txt
end
