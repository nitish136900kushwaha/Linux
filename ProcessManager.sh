#!/usr/bin/bash
#
# This is a process manager script, for managing the processes.
#
# process manage welcome message function
PSM_WELCOME()
{
	SC()			         			# sleep and clear function
	{
		sleep 0.05
	}
	#
	WM="PROCESS MANAGER, by DEAXParadox"
	OIFS=$IFS 
	IFS=$'\n'
	TEMPFILE1=`mktemp tempfile1.XXXXXX`
	#echo "WELCOME TO PROCESS MANAGER, BY DEAXParadox" | sed -e 's/\(.\)/\1\n/g' |tee "$TEMPFILE1"
	echo -en "\n\n\t\t\t"
	for ITEM in `echo "$WM" | sed -e 's/\(.\)/\1\n/g'` ; do 
		echo -en "$ITEM"; SC ; 
	done; echo
	#cat "$TEMPFILE1"
	rm "$TEMPFILE1"
	IFS=$OIFS

}

CLOCK_TIME()
{
	while [ 1 ] ; do
		sleep 
		TIME=`date +%T`
	done
}


clear
PSM_MENU()																		# PROCESS MANAGER MENU FUNCTION
{
	echo -en "\n\t\t\t\t\t\t\t\t\t\t\t\t\t"CLOCK_TIME
	echo -ne "\n\t\t\tPROCESS MANAGER\n"
	echo -ne "\n\ta. All processes."
	echo -ne "\n\tb. User ${USER} processes"
	echo -ne "\n\tc. Root service executing by user ${USER}"
	echo -ne "\n\td. Group creator process"
	echo -ne "\n\te. Root group service by group ${USER}"
	echo -ne "\n\tk. Kill processes "
	echo -ne "\n\tq. exit"
	echo -ne "\n\n\n\t\tEnter the option: "
	read -n 1 OPTION
}
#
KILL()
{
	clear
	cd /home/creator/Documents/script/ps
	./KillProcessTree.sh
}
#
#
PSM_WELCOME							# CALLING: PSM_WELCOME
clear
#
while [ 1 ]
do
PSM_MENU																								# CALLING: PSM_MENU
echo -en "\n\n\t Enter: "
case $OPTION in
	a)
		ps --deselect --forest | less ;;
	b)
		ps --User ${USER} --forest | less ;;
	c)
		ps --User root --user ${USER}  --forest | less ;;
	d)
		ps --Group ${USER} --forest | less ;;
	e)
		ps --Group root --group ${USER} --forest | less ;;
	k)
		#echo -en "Kill process" ;;
		KILL ;;
	q)
		break ;;
	*)
		echo -ne "invalid input";;
esac
#echo -en "\n\t\t\t\t\t\tPres any key to continue"
#read -n 1
clear
done
clear
