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


if test -e /usr/local/go
then export GOROOT=/usr/local/go
fi
if test -e /usr/lib/go-1.10
then export GOROOT=/usr/lib/go-1.10
     path+=/usr/lib/go-1.10/bin
fi
export GOPATH=~/go

