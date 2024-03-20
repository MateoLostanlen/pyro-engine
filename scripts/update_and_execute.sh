#!/bin/bash
#6

# Print current date and time
echo "$(date): Checking for updates"

export PATH=$PATH:/home/mateo/.local/bin/


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
    mkdir tt
    echo "toto" >> tt/tt.txt
    echo "$(date): Update done !"

else
    echo "$(date): No changes detected"
fi
