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
	ACTION=${WKRUN:-}$1
	echo ">>>$ACTION WKRUN=$WKRUN"
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
