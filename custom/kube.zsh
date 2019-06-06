alias wo="WSK_CONFIG_FILE=~/.kube/openwhisk.wsk wsk"
alias wn="WSK_CONFIG_FILE=~/.kube/neuronix.wsk wsk"
alias ka="KUBECONFIG=~/.kube/apiaws.config kubectl -n openwhisk"
alias ka2="KUBECONFIG=~/.kube/apiawstest.config kubectl -n openwhisk"
alias kl="KUBECONFIG=~/.kube/local.config kubectl"
alias wl="WSK_CONFIG_FILE=~/.kube/local.wsk wsk"

kfg() {
  if test -z "$1"
  then ls -1 ~/.kube/*.config
  else TGT=~/.kube/${1%%.config}.config
       if test -e $TGT
       then cp $TGT ~/.kube/config
       else echo saved config to $TGT
            cp ~/.kube/config $TGT
       fi
  fi
  kubectl get nodes
}

wfg() {
  if test -z "$1"
  then ls -1 ~/.kube/*.wsk
  else TGT=~/.kube/${1%%.wsk}.wsk
       if test -e $TGT
       then cp $TGT ~/.wskprops
       else echo saved config to $TGT
            cp ~/.wskprops $TGT
       fi
  fi
  wsk property get
}

