#!/usr/bin/bash

# redirecting all output to a file
#exec 3>tuxcut_start.log
exec 3>> tuxcut.log
exec 2>> tuxcut.log																						 						# LOGFILE

LIVE_LOGFILE() {
	cd /home/nitish/Documents/script/tuxcut/
	gnome-terminal -e "tail -f tuxcut.log"
}
LIVE_LOGFILE


echo -en "\n\n-----------------------------------------------------------------------" >&3
echo >&3
#echo -en "Log data time" >&3
#echo >&3
echo -en "$(date +%A-%d-%B-%Y-%R:%S)   LOGFILE_TIME" >&3
echo >&3

MAIN()																															# MAIN FUNCTION
{
	START_TUXCUT()																						# START_TUXCUT FUNCTION
	{
		# check if tuxcut daemon in running or not
		# user recognization
		# starting the tuxcutd.service daemon
		# checking if daemon started to not
		# if the daemon started then start the tuxcut
		# else have a admin lookup

		DAEMON_CHECK=$(systemctl status tuxcutd.service | grep --only-matching --word-regexp 'active' | uniq)
		#
		if [ $DAEMON_CHECK = "active" ]
		then
			echo -en "\n\nTuxcutd daemon is running,"
			echo -en "\nStarting the tuxcut."
			nohup tuxcut & >&3
			echo
		else
			if [ $(echo $USER) = "root" ]
			then
				echo
				systemctl start tuxcutd.service
			else
				echo
				sudo systemctl start tuxcutd.service
			fi
			#
			MESSAGE="Starting tuxcutd daemon"
			cd /home/nitish/Documents/script/loading-function >&3
			pwd >&3
			./loading-dot.sh "$MESSAGE"
			cd - >&3
			#
			SERVICE=$(systemctl status tuxcutd.service | grep --only-matching --word-regexp 'active' | uniq)
			if [ $SERVICE = "active" ]
			then
				MESSAGE="Starting tuxcut"
				cd /home/nitish/Documents/script/loading-function >&3
				pwd >&3
				./loading-percentage.sh "$MESSAGE"
				cd - >&3
				#
				echo -en "\nStarting the tuxcut."
				nohup tuxcut & >&3
				echo
			else
				echo -en "\n\n\t\t\tUnable to start the tuxcutd.service daemon"
				echo -en "Please have admin look into the system."
			fi
		fi
	}

	#START_TUXCUT() 																		# START TUXCUT : LOADING FUNCTION
	#{
	#}

	START_TUXCUT
}
MAIN
