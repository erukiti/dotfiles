: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOST=$(hostname -s)}

export HISTCONTROL=ignoreboth:erasedups

if [ -d /usr/local/etc/bash_completion.d/ ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
  . /usr/local/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
fi

if [ -d $HOME/.anyenv/bin ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

alias df='df -h'

eval "$(direnv hook bash)"
export GOPATH="$HOME/work/go"
export PATH="$PATH:/Users/erukiti/work/go/bin"

test -s "$HOME/dotfiles/env/$UNAME.sh" && source "$HOME/dotfiles/env/$UNAME.sh"

test -d "$HOME/bin" && export PATH="$HOME/bin:$PATH"

if [ "$LOGNAME" = "root" ]; then
  TITLE="*** $LOGNAME@$HOST ($UNAME) ***"

else
  TITLE="$LOGNAME@$HOST ($UNAME)"
fi

echo -e "\033]2;$TITLE\007"

export PS1='\[\033[1;32m\][\t][\u@\h \W$(__git_ps1 " (%s)")]\$\[\033[0m\] '
export PATH="/usr/local/opt/llvm/bin:$PATH"
