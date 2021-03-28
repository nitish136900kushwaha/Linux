#!/usr/bin/bash

KILL_PROCESS()
{
	while [ 1 ]
	do
    # clear
    # create  a Temp file
    # input the proces name
    # the process information to the temp file
    # extract process tree PID, from the temp file
    # make a for loop for killing process tree
    echo
    echo 
    read -p "Enter the process: " PROCESS 					# ENTER THE PROCESS NAME
    #
    if [ -z $PROCESS ]
    then
      break
    else
      TEMP_FILEa=$(mktemp KILL.XXXXXX)                                  # TEMP_FILEa
      ps --User ${USER} --User ${USER} | grep $PROCESS | sed 's/\|/ /'| \
       awk '{print $1}' > $TEMP_FILEa
      #

      #
      #KL=$(ps --User creator | grep tuxcut | sed 's/\|/ /' | awk '{print $1}')
      #
      for n in $(cat $TEMP_FILEa)
      do
        echo -en "\n\tKilling the following PID: $n"
        kill -SIGKILL $n
        echo -en " "
      done
    fi
    #
    rm "$TEMP_FILEa"
	done
}

KILL_PROCESS
