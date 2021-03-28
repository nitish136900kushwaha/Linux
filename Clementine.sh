#!/bin/bash
#
#trap --SIGINT
clear
orders()
{
	echo -ne "\n\t\t\t\t~~~~~~~~~~~~~~~~~~~"
	echo -ne "\n\t\t\t\t| CLEMENTINE MENU |"
	echo -ne "\n\t\t\t\t,,,,,,,,,,,,,,,,,,,"
	echo -ne "\n\t(1) play"
	echo -ne "\t\t\t\t\t(3) pause"
	echo -ne "\n\n\t(4) previous"
	echo -ne "\t\t\t\t\t(6) next"
	echo -ne "\n\n\t(+) volume up"
	echo -ne "\t\t\t\t\t(-) volume down"
	echo -ne "\n\n\t(v) volume"
	echo -ne "\n\n\t(0) exit"
	#echo -ne "\n\t1.pause"
	echo -ne "\n\n\t DO WHAT EVER: "
	read -n 1 select
}
#
#vol()
#{
	#local vol
	#echo -ne "\n\n\tvolume: $vol"
	#clemntine -v $vol
#}
#
while [ 1 ]
do
	orders
	#clear
	case $select in
		1) clementine -p;;
		3) clementine -u;;
		4) clementine -r;;
		6) clementine -f;;
		+) clementine --volume-up;;
		-) clementine --volume-down;;
	#	v) vol;;
		0) break ;;
		*) #echo -ne "Invalid input";;
	esac
	#echo -ne "\n\nPress any key to continue"
	#read -n 1
	clear
done
clear
