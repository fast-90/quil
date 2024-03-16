#!/bin/bash

# Loop through servers contabo1 to contabo10
for i in {1..10}; do
    server="contabo$i"
    destination="./$server"
    # Perform scp
    mkdir -p "$destination"
    scp "$server:/root/ceremonyclient/node/.config/config.yml" "$destination"
    scp "$server:/root/ceremonyclient/node/.config/keys.yml" "$destination"
done
