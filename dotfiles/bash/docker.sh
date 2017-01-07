#!/bin/bash

alias docstop='docker kill $(docker ps -q)'

function docenv() {
    if ! [ -z "$1" ]; then
        eval "$(docker-machin env $1)"
    else
        eval "$(docker-machine env default)"
    fi
}
