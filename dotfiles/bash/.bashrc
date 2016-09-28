#!/bin/bash
source $HOME/env.sh

[ -f $HOME/alias.sh ] && source $HOME/alias.sh
[ -f $HOME/git-completion.bash ] && source $HOME/git-completion.bash
[ -f $HOME/git-prompt.sh ] && source $HOME/git-prompt.sh
[ -f $HOME/git-prompt.sh ] && PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
[ -f $HOME/git-shortcuts.sh ] && source $HOME/git-shortcuts.sh

# Platform specific
[ -f $HOME/osx.bashrc.sh ] && source $HOME/osx.bashrc.sh
[ -f $HOME/windows.bashrc.sh ] && source $HOME/windows.bashrc.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# SSH
SSH_ENV=$HOME/.ssh/environment
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add;
}
if [ -f "${SSH_ENV}" ]; then
    . ${SSH_ENV} > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Docker
eval "$(docker-machine env default)"

# Start in repository root directory
cd $REPO_HOME
