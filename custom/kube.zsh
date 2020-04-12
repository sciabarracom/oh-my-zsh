alias ko="kubectl -n openwhisk"
alias kd="kubectl -n default"
alias ks="kubectl -n kube-system"
alias kw="kubectl -n knative-whisk"

function kk {
  if test -z "$KN"
  then echo unset KN=namespace 
  elif test -z "$KC"
  then echo  unset KC=config 
  else kubectl -n $KN --kubeconfig ~/.kube/config.$KC "$@"
  fi
}

alias iwsk="WSK_CONFIG_FILE=$HOME/.wskprops.ibm wsk"


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

