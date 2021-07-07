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
function dkclean {
  docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi -f
}

alias kc=kubectl
alias ko="kubectl -n openwhisk"
alias kd="kubectl -n default"
alias ks="kubectl -n kube-system"

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


hinst() { helm upgrade --install ${1%/} --namespace ${1%/} ./$1  }

hpurge() { helm delete ${1%/} --purge  }

hdebug() { helm upgrade --install ${1%/} --namespace $1 ./$1 --dry-run --debug  }

alias hls="helm list"


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

crammer() {
  export T=$PWD
  while read "line?cram> " 
  do eval ${line#$}
  done
}

rndtime() { for i in *.* ; do R=$RANDOM ; R=$(expr 1000000 + $R) ; T=$(date -r $R +%M%d%H%M);  touch -t $T $i; done }

alias wi="wsk -i"

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


private() {
  CMD=$(echo -e "U2FsdGVkX1/kHPFtCQtJDFlrVV5+SCVNfrSiR1epkGBscxY8q9pfngjRVDOcU0F3\nfiRt3D40fTJEQO7TIBkI2NEWmGy66tuMRHFPCONg7KCD/gEXx5lqLGj05hk05eee\nj1D4zuSBUbbjKaorpyQkqg==" | openssl enc -aes-256-cbc -d -a)
  echo "$CMD"
  SES=$(bash -c "$CMD")
  echo $SES
  eval $SES
  echo "op configured"
}

flushdns() { sudo killall -HUP mDNSResponder }

export HOMEBREW_GITHUB_API_TOKEN=6d67e5f685518dd83ec656eb1a295dd08bcd84c9

alias s="ag --nogroup"
export NOTES_CLI_HOME=~/.oh-my-zsh/notes-cli

export LN0=192.168.0
alias p3=python3
alias blender=/Applications/Blender.app/Contents/MacOS/Blender

PATH=$PATH:~/Work/Nimbella/openwhisk-utilities/scancode:~/Work/PagoPA/io-sdk

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

#alias sec="source ~/.ssh/secret.sh"
if test -d $HOME/.ssh/secret.sh
then source ~/.ssh/secret.sh
fi

export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin" 
