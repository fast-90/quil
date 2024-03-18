#!/bin/bash
tmux kill-session -t node
tmux new -As node -d -n node
tmux select-window -t node
tmux send-keys -t node "sudo journalctl -u ceremonyclient.service -f --no-hostname -o cat" Enter
