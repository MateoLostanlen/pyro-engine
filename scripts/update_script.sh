#!/bin/bash

# This script performs:
# pull origin main
#- if any change:
#    kill container
#    rebuild docker compose
# 
# This script must be run with a crontab, run every day at 3am
# 0 3 * * * bash /home/pi/pyro-engine/scripts/update_script.sh

# Enable debugging
set -x

if git -C /home/pi/pyro-engine pull origin auto_update | grep -q "Already up to date.";
    then
        echo "pyro-engine up to date";
    else

        echo "update" >> /home/pi/log.txt
        date >> /home/pi/log.txt
        cd /home/pi/pyro-engine
        docker-compose down
        docker build . -t pyronear/pyro-engine:latest
	    docker-compose up -d

fi;

date >> /home/pi/log.txt
exec >> /home/pi/log.txt 2>&1

# Disable debugging if needed
set +x
