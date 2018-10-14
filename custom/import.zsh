path+=~/bin:/usr/local/bin:~/go/bin

function jh {
 export JAVA_HOME=$(/usr/libexec/java_home -version $1)
 path+=$JAVA_HOME/bin
}

if test -e /usr/libexec/java_home
then jh 1.8
fi

if test -d ~/.nvm
then source ~/.nvm/nvm.sh
fi

if test -d ~/Library/Python/2.7/bin
then path+=~/Library/Python/2.7/bin
fi

if test -e /usr/local/opt/go/libexec
then export GOROOT=/usr/local/opt/go/libexec
fi

if test -e /usr/lib/go-1.10
then export GOROOT=/usr/lib/go-1.10
fi

if test -e /usr/lib/go-1.11
then export GOROOT=/usr/lib/go-1.11
fi

path=($GOROOT/bin $path)
export GOPATH=~/go
export PATH
export ZSH_THEME=jovial
