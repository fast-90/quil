#!/bin/bash

cd ~/ceremonyclient/node/

# Define the local branch you want to check
local_branch="release-cdn"

# Fetch updates from the remote repository
git fetch

# Check if the local branch is up to date with the remote
if git status | grep "Your branch is up to date with 'origin/${local_branch}'" &> /dev/null; then
    :
else
    ~/quil/tmux_miner.sh
fi
