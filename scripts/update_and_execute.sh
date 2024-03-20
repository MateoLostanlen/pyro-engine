#!/bin/bash
#3

# Print current date and time
echo "$(date): Checking for updates"

# Navigate to the repository directory
cd /home/mateo/Desktop/engine/pyro-engine

# Check for updates and pull
git fetch origin
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse origin/main)

if [ "$HEADHASH" != "$UPSTREAMHASH" ]
then
    echo "$(date): New changes detected ! Updating and executing script..."
    git pull origin main
    # Execute the make run command from the Makefile to rebuild and restart Docker containers
    make run
    echo "$(date): Update done !"

else
    echo "$(date): No changes detected"
fi
