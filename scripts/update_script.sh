#!/bin/bash
# This script performs:
# pull origin main
#- if any change:
#    kill container
#    rebuild docker compose
# 
# This script must be run with a crontab, run every day at 3am
# 0 3 * * * bash /home/pi/pyro-engine/scripts/update_script.sh


if [[ `git -C /home/pi/pyro-engine pull origin auto_update:auto_update | grep -c "up to date."` == 1 ]];
    then
        echo "pyro-engine up to date";
    else
        echo "pyro-engine updated from github";
        docker container stop pyro-engine_pyro-engine_1
        docker build /home/pi/pyro-engine -t pyronear/pyro-engine:latest
        docker-compose -f /home/pi/pyro-engine/docker-compose.yml up -d

fi;
