function select_jira_ticket
  # sed -e s/://g | fzf -m --preview="jira issue view --plain {1}" --bind=alt-b:execute['jira browse {1}']+abort,alt-c:execute['jira comment {1}'],alt-e:execute['jira edit {1}']+abort,alt-t:execute['jira take {1}']+abort,alt-x:execute['jira close {1}']+abort,enter:execute-multi['jira_browse {1}']+accept
  sed -e s/://g | fzf -m --preview="jira issue view --plain {1}" --bind=alt-b:execute['jira browse {1}']+abort,alt-c:execute['jira comment {1}'],alt-e:execute['jira edit {1}']+abort,alt-t:execute['jira take {1}']+abort,alt-x:execute['jira close {1}']+abort
end

