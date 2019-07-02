alias ko="kubectl -n openwhisk"
alias kd="kubectl -n default"
alias ks="kubectl -n kube-system"
alias kw="kubectl -n knative-whisk"

kfg() {
  if test -z "$1"
  then ls -1 ~/.kube/*.config
       echo "KUBECONFIG=$KUBECONFIG"
  else TGT=~/.kube/${1%%.config}.config
       if test -n "$2"
       then echo saving kubeconfig to $TGT
            cp ~/.kube/config $TGT
       fi
       export KUBECONFIG=$TGT
       echo "KUBECONFIG=$KUBECONFIG"
       kubectl get nodes
  fi
}

wfg() {
  if test -z "$1"
  then ls -1 ~/.kube/*.wsk
       echo "WSK_CONFIG_FILE=$WSK_CONFIG_FILE"
       wsk property get
  else TGT=~/.kube/${1%%.wsk}.wsk
       if test -z "$2"
       then export WSK_CONFIG_FILE=$TGT
            echo "WSK_CONFIG_FILE=$WSK_CONFIG_FILE"
            wsk property get
       else echo saving wskprops to $TGT
            cp ~/.wskprops $TGT
       fi
  fi
}

