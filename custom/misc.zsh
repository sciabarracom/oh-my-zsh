vz() {
  f=$ZSH/custom/${1:-misc}.zsh
  vi $f
  pushd ~ZSH
  source ~/.zshrc 
  git commit -m $f -a
  git push origin master
}

svd() {
   f=${1:?dirname}
   echo "$f=$PWD" >>$ZSH/custom/namedir.zsh
   source $ZSH/custom/namedir.zsh
   cd ~$f
}


# general 

alias f=find
alias s= source

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

alias kc=kubectl
alias -g NKS="--namespace kube-system"

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
