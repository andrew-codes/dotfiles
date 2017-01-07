#!/bin/bash
# # Configuration ---------
# # Configure these as needed.
DEV_HOME=$HOME/Developer
REPO_HOME=$DEV_HOME/repositories
DEVTOOLS_HOME=$REPO_HOME/dotfiles
# End configuration -------


DEVTOOLS_BASH_HOME=$DEVTOOLS_HOME/dotfiles/bash
osIs()
{
    local n=0
    if [[ "$1" = "-n" ]]; then n=1;shift; fi

    # echo $OS|grep $1 -i >/dev/null
    uname -s |grep -i "$1" >/dev/null

    return $(( $n ^ $? ))
}
export -f osIs

# # Platform independent
[ -f $DEVTOOLS_BASH_HOME/alias.sh ] && source $DEVTOOLS_BASH_HOME/alias.sh
[ -f $DEVTOOLS_BASH_HOME/git-completion.bash ] && source $DEVTOOLS_BASH_HOME/git-completion.bash
[ -f $DEVTOOLS_BASH_HOME/git-prompt.sh ] && source $DEVTOOLS_BASH_HOME/git-prompt.sh
[ -f $DEVTOOLS_BASH_HOME/git-prompt.sh ] && PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
[ -f $DEVTOOLS_BASH_HOME/git-shortcuts.sh ] && source $DEVTOOLS_BASH_HOME/git-shortcuts.sh
[ -f $DEVTOOLS_BASH_HOME/ssh.sh ] && source $DEVTOOLS_BASH_HOME/ssh.sh
[ -f $DEVTOOLS_BASH_HOME/docker.sh ] && source $DEVTOOLS_BASH_HOME/docker.sh
[ -f $DEVTOOLS_BASH_HOME/nvm.sh ] && source $DEVTOOLS_BASH_HOME/nvm.sh

# # OSX
osIs Darwin && [ -f $DEVTOOLS_BASH_HOME/osx.bashrc.sh ] && source $DEVTOOLS_BASH_HOME/osx.bashrc.sh

# # Windows
osIs Cygwin && [ -f $DEVTOOLS_BASH_HOME/windows.bashrc.sh ] && source $DEVTOOLS_BASH_HOME/windows.bashrc.sh
osIs Cygwin && [ -f $DEVTOOLS_BASH_HOME/v1.windows.bashrc.sh ] && source $DEVTOOLS_BASH_HOME/v1.windows.bashrc.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Start in repository root directory
cd $REPO_HOME
