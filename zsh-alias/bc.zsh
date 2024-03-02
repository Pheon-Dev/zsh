#!/bin/bash zsh

function bc {
    br --only-folders --cmd "$1;:cd"
}
