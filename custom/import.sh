

if test -e /usr/libexec/java_home
then export JAVA_HOME=$(/usr/libexec/java_home -version 1.8)
fi

function java8 {
 export JAVA_HOME=$(/usr/libexec/java_home -version 1.8)
 export PATH=$JAVA_HOME/bin:$PATH
}

function java9 {
 export JAVA_HOME=$(/usr/libexec/java_home -version 9)
 export PATH=$JAVA_HOME/bin:$PATH
}


if test -d ~/.nvm
then source ~/.nvm/nvm.sh
fi

if test -d ~/Library/Python/2.7/bin
then path+=~/Library/Python/2.7/bin
fi

if test -d ~/bin
then path+=~/bin
fi

if test -d ~/go
then path +=~/go/bin
fi

if test -e /ust/local/go
then export GOROOT=/usr/local/go
fi
export GOPATH=~/go


