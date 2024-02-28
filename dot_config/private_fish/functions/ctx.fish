function ctx
  kubectl config get-contexts --no-headers | fzf | awk '{print $1}' | xargs kubectl config use-context
end
