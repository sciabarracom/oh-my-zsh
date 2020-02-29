export GOPATH=~/go
export ZSH_THEME=jovial
path=(~/bin /usr/local/bin $path)
export PATH

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

GODIRS=(/usr/local/Cellar/go/*/libexec /usr/lib/go-*)
if test -n "${GODIRS[1]}"
then export GOROOT="${GODIRS[1]}"
else echo "No Valid GOROOT"
fi
path=($GOROOT/bin $path)

if test -d ~/.local/bin
then path+=~/.local/bin
fi

if test -d ~/go/bin
then path+=~/go/bin
fi

if test -d ~/.cargo/bin
then path+=~/.cargo/bin
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/google-cloud-sdk/path.zsh.inc' ]; then . '/usr/local/google-cloud-sdk/path.zsh.inc'; fi

if test -f ~/.iterm2_shell_integration.zsh
then source ~/.iterm2_shell_integration.zsh
fi


