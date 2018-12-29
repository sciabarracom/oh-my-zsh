alias wkac="wsk action create"
alias wkal="wsk action list"
alias wka="wsk action "
alias wkv="wsk activation "
alias wkad="wsk action delete"
alias wkau="wsk action update"
alias wkal="wsk action list"
alias wkai="wsk action invoke"
alias wkag="wsk action get"
alias wkvl="wsk activation logs "
alias wkvr="wsk activation result "
alias wkv0="wsk activation list --limit 10"
alias wkv1="wsk activation list --limit 1 | tail -1 | awk '{print \$1}'"

function wkrun { 
	ACTION=$1
	echo ">>>$ACTION"
	shift
	ID=$(wkai $ACTION "$@" | awk '{print $6}')
	sleep 1
	wkvl $ID
	wkvr $ID
}

function wkclean {
  wsk action list | grep $1 | awk '{print $1}' | while read a
  do echo wsk action delete $a
  done
}

wklast() { wkvl $(wkv1) }

myip() { ifconfig | grep "inet " | grep -v "127.0.0.1" | awk '{ print $2 }' | head -1 }

wsk_local() { 
  unalias wsk
  wsk property set --apihost localhost:31001 
  wsk property set --auth 23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP 
  export WSK="wsk -i"
  alias wsk="wsk -i"
}

OGA=https://github.com/apache/incubator-openwhisk
OGS=https://github.com/sciabarracom/incubator-openwhisk
OGSA=actionloop-golang-v1.11
OGAP=actionloop-python

wskloc() { 
  unalias wsk
  wsk property set --apihost 127.0.0.1:31001 -i 
  wsk property set --auth 23bc46b1-71f6-4ed5-8c54-816aa4f8c502:123zO3xZCLrMN6v2BKK1dXYFpXlPkccOFqm12CdAsMgRU4VrNZ9lyGVCGuMDGIwP --namespace guest
  export WSK="wsk -i"
  alias wsk="wsk -i"
}
