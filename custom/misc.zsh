vz() {
  f=$ZSH/custom/${1:-misc}.zsh
  vi $f
  yes | cp -f $f ~/Dropbox/Work/Common/Zsh 2>/dev/null >/dev/null
  source ~/.zshrc 
}

svd() {
   f=${1:?dirname}
   echo "$f=$PWD" >>$ZSH/custom/namedir.zsh
   source $ZSH/custom/namedir.zsh
   cd ~$f
}


# general 

alias f=find
alias l=ls

alias u="cd .. ; ls"
alias uu="cd ../.. ; ls"
alias g=grep
alias ll="ls -l"

alias a1="awk '{print \$1}'"
alias a2="awk '{print \$2}'"
alias a3="awk '{print \$3}'"
alias a4="awk '{print \$4}'"
alias a5="awk '{print \$5}'"
alias a6="awk '{print \$6}'"
alias a7="awk '{print \$7}'"
alias a8="awk '{print \$8}'"
alias a9="awk '{print \$9}'"

function c {
 cd $(ls -d * ~/* | grep $1 | head -1)
 echo ">>>"$(pwd)"<<<"
 ls -l
 echo ">>>"$(pwd)"<<<"
}


# docker 
alias dk=docker
alias dki="docker images"

function dke {
  x=$(docker ps | grep $1 | awk '{ print $1 }')
  docker exec -ti $x /bin/sh
}

function dksh {
  x=$(docker images | grep $1 | head -1 | awk '{ print $3 }')
  echo $x
  shift
  docker run -ti -u=0 "$@" --entrypoint=/bin/sh $x
}

function dkclean {
  docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f
}


# searches
alias ags="ag --scala"
alias agj="ag --java"
alias agk="ag --kotlin"
alias agg="ag --go"

# git
function gca {
 git commit -m "$*" -a
}
alias gst="git status"
alias gad="git add"
alias gpo="git push origin"
alias gbr="git branch -a"


alias svi="sudo vi"
alias kc=kubectl

alias alex="say -v Alex"
alias eng="say -v Alex"

export ANSIBLE_NOCOWS=1


alias ans=ansible-playbook


function crammer {
  export T=$PWD
  while read -p "cram> " line
  do eval ${line#$}
  done
}


