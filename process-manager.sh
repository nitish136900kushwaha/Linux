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
		clear
	}

	LOAD_MESSAGE() 						# name loading function
	{
		echo -en "\n\t W" ; SC
		echo -en "\n\t WE" ; SC
		echo -en "\n\t WEL" ; SC
		echo -en "\n\t WELC" ; SC
		echo -en "\n\t WELCO" ; SC
		echo -en "\n\t WELCOM" ; SC
		echo -en "\n\t WELCOME" ; SC
		echo -en "\n\t WELCOME " ; SC
		echo -en "\n\t WELCOME T" ; SC
		echo -en "\n\t WELCOME TO" ; SC
		echo -en "\n\t WELCOME TO " ; SC
		echo -en "\n\t WELCOME TO P" ; SC
		echo -en "\n\t WELCOME TO PR" ; SC
		echo -en "\n\t WELCOME TO PRO" ; SC
		echo -en "\n\t WELCOME TO PROC" ; SC
		echo -en "\n\t WELCOME TO PROCE" ; SC
		echo -en "\n\t WELCOME TO PROCES" ; SC
		echo -en "\n\t WELCOME TO PROCESS" ; SC
		echo -en "\n\t WELCOME TO PROCESS " ; SC
		echo -en "\n\t WELCOME TO PROCESS M" ; SC
		echo -en "\n\t WELCOME TO PROCESS MA" ; SC
		echo -en "\n\t WELCOME TO PROCESS MAN" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANA" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAG" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGE" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER," ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, " ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, B" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY " ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY D" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DE" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEA" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAX" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXP" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXPa" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXPar" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXPara" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXParad" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXParado" ; SC
		echo -en "\n\t WELCOME TO PROCESS MANAGER, BY DEAXParadox" ; SC
		#echo -en "\n\t W" ; SC
		#echo -en "\n\t W" ; SC
		#echo -en "\n\t W" ; SC
		#echo -en "\n\t W" ; SC
	}
	LOAD_MESSAGE
}



clear
PSM_MENU()																		# PROCESS MANAGER MENU FUNCTION
{
echo -ne "\n\t\t\t\tPS MENU"
echo -ne "\n\ta. All processes."
echo -ne "\n\tb. User creator processes"
echo -ne "\n\tc. Root service executing by user Creator"
echo -ne "\n\td. Group creator process"
echo -ne "\n\te. Root group service by group Creator"
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
	./kill-process-tree.sh
}
#
#
PSM_WELCOME																						# CALLING: PSM_WELCOME
#
while [ 1 ]
do
PSM_MENU																								# CALLING: PSM_MENU
echo -en "\n\n\t Enter: "
case $OPTION in
	a)
		ps --deselect --forest | less ;;
	b)
		ps --User creator --forest | less ;;
	c)
		ps --User root --user creator  --forest | less ;;
	d)
		ps --Group creator --forest | less ;;
	e)
		ps --Group root --group creator --forest | less ;;
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
