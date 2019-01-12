path=(~/bin /usr/local/bin $path)

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

if test -d ~/miniconda3
then path+=~/miniconda3/bin
elif test -d ~/Library/Python/2.7/bin
then path+=~/Library/Python/2.7/bin
fi

if test -e /usr/local/Cellar/go/1.11.1
then export GOROOT=/usr/local/Cellar/go/1.11.1/libexec
elif test -e /usr/lib/go-1.10
then export GOROOT=/usr/lib/go-1.10
elif test -e /usr/lib/go-1.11
then export GOROOT=/usr/lib/go-1.11
fi

if test -d ~/.local/bin
then path+=~/.local/bin
fi

if test -d ~/go/bin
then path+=~/go/bin
fi

if test -d ~/.cargo/bin
then path+=~/.cargo/bin
fi

path=($GOROOT/bin $path)
export GOPATH=~/go
export PATH
export ZSH_THEME=jovial


