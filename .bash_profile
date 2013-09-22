: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOST=$(hostname -s)}

if [ -d /opt/boxen/homebrew/etc/bash_completion.d/ ];then
  source /opt/boxen/homebrew/etc/bash_completion.d/git-completion.bash
  source /opt/boxen/homebrew/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
elif [ -d /usr/local/etc/bash_completion.d/ ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
  source /usr/local/etc/bash_completion.d/git-prompt.sh
  GIT_PS1_SHOWDIRTYSTATE=true
else
  test -s ~/.git_complete.bash && source ~/.git_complete.bash
fi

alias df='df -h'

test -s "$HOME/dotfiles/env/$UNAME.sh" && source "$HOME/dotfiles/env/$UNAME.sh"

test -d "$HOME/bin" && export PATH="$HOME/bin:$PATH"

if [ "$LOGNAME" = "root" ]; then
  TITLE="*** $LOGNAME@$HOST ($UNAME) ***"

else
  TITLE="$LOGNAME@$HOST ($UNAME)"
fi

echo -e "\033]2;$TITLE\007"

export PS1='\[\033[1;32m\][\t][\u@\h \W$(__git_ps1 " (%s)")]\$\[\033[0m\] '