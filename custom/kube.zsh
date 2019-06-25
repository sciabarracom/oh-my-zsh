kfg() {
  if test -z "$1"
  then ls -1 ~/.kube/*.config
       echo "KUBECONFIG=$KUBECONFIG"
  else TGT=~/.kube/${1%%.config}.config
       if test -z "$2"
       then export KUBECONFIG=$TGT
            echo "KUBECONFIG=$KUBECONFIG"
            kubectl get nodes
       else cp ~/.kube/config $TGT
            echo saving kubeconfig to $TGT
            cp ~/.kube/config $TGT
       fi
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
       else cp ~/.wskprops $TGT
            echo saving wskprops to $TGT
            cp ~/.wskprops $TGT
       fi
  fi
}

