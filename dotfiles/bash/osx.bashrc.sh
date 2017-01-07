#!/bin/bash

function jsf() {
    pbpaste | highlight --syntax=js -O rtf | pbcopy
}
