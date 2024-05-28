#!/bin/bash
tmux kill-session -t node
tmux new -As node -d -n node
tmux select-window -t node
tmux send-keys -t node "cd ~/ceremonyclient/node" Enter
tmux send-keys -t node "./release_autorun.sh" Enter
