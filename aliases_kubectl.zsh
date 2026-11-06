# Core shorthand
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias ka='kubectl apply -f'
alias ke='kubectl edit'
alias kex='kubectl exec -it'
alias kl='kubectl logs'
alias klf='kubectl logs -f'

# Context/namespace switching
alias kctx='kubectl config use-context'
alias kns='kubectl config set-context --current --namespace'
alias kgctx='kubectl config get-contexts'

# Common gets
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgn='kubectl get nodes'
alias kgi='kubectl get ingress'
alias kgcm='kubectl get configmap'
alias kgsec='kubectl get secret'

# Useful one-liners
alias kgpw='kubectl get pods -w'
alias kgpa='kubectl get pods -A -o wide'
alias ktn='kubectl top nodes'
alias ktp='kubectl top pods'

# Exec into a pod by partial name match
ksh() {
  kubectl exec -it $(kubectl get pod -l "$1" -o jsonpath='{.items[0].metadata.name}') -- /bin/sh
}

# Tail logs from all pods matching a label
klabel() {
  kubectl logs -f -l "$1" --all-containers --max-log-requests 10
}
