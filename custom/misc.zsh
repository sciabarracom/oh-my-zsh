vz() {
  f=$ZSH/custom/${1:-misc}.zsh
  vi $f
  source ~/.zshrc 
}

svd() {
   f=${1:?dirname}
   echo "$f=$PWD" >>$ZSH/custom/namedir.zsh
   source $ZSH/custom/namedir.zsh
   cd ~$f
}

here() {
}

ohgit() {
  pushd ~ZSH
  git commit -m "saved" -a
  git pull origin master
  git push origin master
  popd
}

alias -g NHK="-o StrictHostKeyChecking=no"
# general 

alias f=find
alias s=source
alias m=make


alias a1="awk '{print \$1}'"
alias a2="awk '{print \$2}'"
alias a3="awk '{print \$3}'"
alias a4="awk '{print \$4}'"
alias a5="awk '{print \$5}'"
alias a6="awk '{print \$6}'"
alias a7="awk '{print \$7}'"
alias a8="awk '{print \$8}'"
alias a9="awk '{print \$9}'"

# docker 
alias dk=docker
alias dki="docker images"
alias dkr="docker run -ti"
alias dkc=docker-compose

alias kc=kubectl
alias ks="kubectl --namespace kube-system"
alias kg="kubectl get"
kpo() { kc get po | awk  "/$1/ { print \"\"\$1}" | tail -1 }

krun() {
 kubectl run ${1/[\/:]/-} -ti --rm --image=$1 --restart=Never --command ${2:-/bin/sh}
}


kcns() { 
if test -z "$1"
then  kubectl config get-contexts  
      kubectl get ns
else kubectl config set-context $(kubectl config current-context)  --namespace=$1 
fi
}

kpo() {
 N=${2:-0}
 if test -z "$1"
 then kubectl get po --show-labels | {awk '{print $1 " : " $6}'}
 else kubectl get po -o jsonpath="{.items[$N].metadata.name}" -l "$1"
 fi
}

kproxy() {
 echo "===== Token ===="
 cat ~/.kube/admin.token
 echo "==== URL ===="
 echo "http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login"
 kubectl proxy
}

hinst() { helm upgrade --install ${1%/} --namespace ${1%/} ./$1  }

hpurge() { helm delete ${1%/} --purge  }

hdebug() { helm upgrade --install ${1%/} --namespace $1 ./$1 --dry-run --debug  }

alias hls="helm list"

function dkclean {
  docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f
}


# searches
alias ags="ag --scala"
alias agj="ag --java"
alias agk="ag --kotlin"
alias agg="ag --go"

alias svi="sudo vi"
alias alex="say -v Alex"
alias eng="say -v Alex"

export ANSIBLE_NOCOWS=1
alias ans=ansible-playbook
anst() { ansible-playbook -t untagged,$1 $argv[2,-1] }
ansc() { ansible -mcommand -a$1 $argv[2,-1] all }

crammer() {
  export T=$PWD
  while read "line?cram> " 
  do eval ${line#$}
  done
}

kfg() {
 export KUBECONFIG=$HOME/.kube/$1.fpprod.corp.config
 kubectl get nodes
 export PATH=$HOME/.kube/bin:$PATH
}

rndtime() { for i in *.* ; do R=$RANDOM ; R=$(expr 1000000 + $R) ; T=$(date -r $R +%M%d%H%M);  touch -t $T $i; done }

alias wi="wsk -i"

gsnap() {
 M=${1:-$(date)}
 git commit -m "$M" -a
 git push origin 
}
