#!/bin/bash

alias push='git push'
alias mt='git mergetool'
alias dt='git difftool'
alias fa='git fetch --all'
alias st='git status'
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias rb='git rebase'
alias rbo='git rebase --onto'
alias rbc='git rebase --continue'
alias rbs='git rebase --skip'
alias rba='git rebase --abort'
osIs Darwin && alias gui='gitx'
osIs Cywgin && alias gui='git gui'

function rh() {
    if ! [ -z "$1" -o -z "$2" ]; then
        git reset --hard $1/$2
    else
        git reset --hard
    fi
    git clean -fd
}

function stash() {
	if ! [ -z "$1" ]; then
		git stash $1
	else
		git stash
	fi
}

function cm() {
    if ! [ -z "$1" ]; then
        git commit -m "$1"
    else
        echo "You did not specific a commit message. Try: commit 'My message'"
    fi
}

function pull() {
  if ! [ -z "$1" -a -z "$2" ]; then
      origin=$1
      remoteBranch=$2
  elif ! [ -z "$1"]; then
      origin='origin'
      remoteBranch=$1
  else
      origin='origin'
      remoteBranch=`git rev-parse --abbrev-ref HEAD`
  fi
  git pull --rebase $origin $remoteBranch
}

function lb {
    if ! [ -z "$1" ]; then
        git branch -a | grep "$1"
    else
        git branch -a
    fi
}

function sb() {
    if ! [ -z "$1" -a -z "$2" ]; then
        remote=$1
        localBranch=$2
    elif ! [ -z "$1"]; then
        remote='origin'
        localBranch=$1
    else
        remote='origin'
        localBranch=`git rev-parse --abbrev-ref HEAD`
    fi
    git branch --set-upstream-to=$remote/$localBranch
}

function nf() {
    if ! [ -z "$1" -o -z "$2" ]; then
        upstream=$1
        newFeatureName=$2
    elif ! [ -z "$1" ]; then
        upstream='master'
        newFeatureName=$1
    else
        echo 'You must provide at least a new feature name. Try: nf my-feature-name'
        return
    fi
    stash
    git checkout $upstream
    pull
    git checkout -b $newFeatureName
    push origin $newFeatureName
    sb
}

function dbr() {
    if ! [ -z "$1" -a -z "$2" ]; then
        git push $1 --delete $2
    fi
    git branch -D $1
}
