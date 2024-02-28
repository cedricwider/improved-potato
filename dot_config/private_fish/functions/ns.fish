function ns
  kubectl config set-context --current --namespace=(kubectl get namespaces | fzf | awk '{print $1}')
end
