#!/bin/bash
# This script performs:
# pull origin main
#- if any change:
#    kill container
#    rebuild docker compose
# 
# This script must be run with a crontab, run every day at 3am
# 0 3 * * * bash /home/pi/pyro-engine/scripts/update_script.sh


if [[ `git -C /home/pi/pyro-engine pull origin auto_update | grep -c "up to date."` == 1 ]];
    then
        echo "pyro-engine up to date";
    else

        echo "update" >> /home/pi/log.txt
        date >> /home/pi/log.txt
        make -C /home/pi/pyro-engine run
        # echo "pyro-engine updated from github";
        # echo "stop" >> /home/pi/log.txt
        # date >> /home/pi/log.txt
        # docker container stop pyro-engine_pyro-engine_1;
        # echo "build" >> /home/pi/log.txt
        # date >> /home/pi/log.txt
        # docker build /home/pi/pyro-engine -t pyronear/pyro-engine:latest;
        # echo "run" >> /home/pi/log.txt
        # date >> /home/pi/log.txt
        # docker-compose -f /home/pi/pyro-engine/docker-compose.yml up -d;
        # echo "done" >> /home/pi/log.txt
        # date >> /home/pi/log.txt

fi;
