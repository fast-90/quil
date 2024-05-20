#!/bin/bash

cd ~/ceremonyclient/node/

# Define the local branch you want to check
local_branch="main"

# Fetch updates from the remote repository
git fetch

# Check if the local branch is up to date with the remote
if git status | grep "Your branch is up to date with 'origin/${local_branch}'" &> /dev/null; then
    :
else
    service ceremonyclient stop
    cd ~/ceremonyclient
    git pull
    cd ~/ceremonyclient/node
    GOEXPERIMENT=arenas go clean -v -n -a ./...
    # rm /root/go/bin/node
    ls /root/go/bin
    GOEXPERIMENT=arenas go install  ./...
    ls /root/go/bin
    service ceremonyclient start
    # ~/quil/tmux_miner.sh
fi
