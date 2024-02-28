function prs
  hub pr list -f '%i %pS %sC %t %l (%au✏️ %uD ↗ %ur)%n' $argv
end
