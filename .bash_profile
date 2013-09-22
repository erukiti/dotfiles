: ${UNAME=$(uname)}
: ${LOGNAME=$(id -un)}
: ${HOST=$(hostname -s)}

test -s ~/.git_complete.bash && source ~/.git_complete.bash

alias df='df -h'

test -s "$HOME/dotfiles/env/$UNAME.sh" && source "$HOME/dotfiles/env/$UNAME.sh"

test -d "$HOME/bin" && export PATH="$HOME/bin:$PATH"

if [ "$LOGNAME" = "root" ]; then
  TITLE="*** $LOGNAME@$HOST ($UNAME) ***"

else
  TITLE="$LOGNAME@$HOST ($UNAME)"
fi

echo -e "\033]2;$TITLE\007"
