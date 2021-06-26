vz() {
  f=$ZSH/custom/${1:-misc}.zsh
  vi $f
  source ~/.zshrc 
}

svd() {
   f=${1:?dirname}
   echo "$f=\"$PWD\"" >>$ZSH/custom/namedir.zsh
   source $ZSH/custom/namedir.zsh
   cd ~$f
}

ohgit() {
  pushd ~ZSH
  git commit -m "saved" -a
  git pull origin master
  git push origin master
  popd
}

alias -g NSH="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
# general 

alias a1="awk '{print \$1}'"
alias a2="awk '{print \$2}'"
alias a3="awk '{print \$3}'"
alias a4="awk '{print \$4}'"
alias a5="awk '{print \$5}'"
alias a6="awk '{print \$6}'"
alias a7="awk '{print \$7}'"
alias a8="awk '{print \$8}'"
alias a9="awk '{print \$9}'"

alias dksh="docker run -ti --entrypoint=sh"

alias kc=kubectl
alias ko="kubectl -n openwhisk"
alias kd="kubectl -n default"
alias ks="kubectl -n kube-system"

kpod() { kc get po | awk  "/$1/ { print \"\"\$1}" | tail -1 }

krun() {
 kubectl run ${1/[\/:]/-} -ti --rm --image=$1 --restart=Never --command ${2:-/bin/sh}
}


kns() { 
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
alias eng="say -v Alex"

export ANSIBLE_NOCOWS=1
alias ans=ansible-playbook
anst() { ansible-playbook -t untagged,$1 $argv[2,-1] }
ansc() { ansible -mcommand -a$1 $argv[2,-1] all }


gsnap() {
 if test -z "$1"
 then M="$(date)"
 else M="$@"
 fi
 git commit -m "$M" -a
 git push origin 
}


ginit() {
  git config --global user.name "Michele Sciabarra"
  git config --global user.email michele@sciabarra.com
}


flushdns() { sudo killall -HUP mDNSResponder }

nocors() {
  open -a Chromium --args --disable-web-security --user-data-dir=/tmp
}

podbynode() {
 kubectl $* get po -o json | jq -r '.items[] | "\(.spec.nodeName): \(.metadata.name)"' | sort
}


codiff() {
  while read line
  do code -w -d $line $1/$line
  done
}

omerge() {
  while read line
  do opendiff $line $1/$line -merge $1/$line
  done
}

na() {
  cd "$HOME/Work/Nimbella/main"
  bin/nimadmin "$@"
}
