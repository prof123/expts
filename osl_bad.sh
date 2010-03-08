#! /bin/sh
#[1]run as 'sh faulty_machines.sh'
#[2]script will save the ip addresses of faulty machines in 'faulty_machines' file.
#[3]NOTE THAT THIS DOES NOT MAIL THE STATUS TO OTHERS, YOU WILL HAVE TO RUN
#ANOTHER SCRIPT TO DO THIS
#[4]This script also checks whether home directories are mounted or not.
#[5]So a machine is faulty means, 
#1. either ping does not work 
#2. or ping works but home directories not mounted
#[6]run this script as normal user NOT ROOT.



i=10.105.11.$1
j=10.105.11.$2
range1=`echo $i | cut -f4 -d. `
range2=`echo $j | cut -f4 -d. `

save=`echo $i | cut -f4 -d. --complement `

while [ $range1 -le $range2 ]
do
	if ssh $save.$range1 'pwd' | grep $LOGNAME
	then
		echo "$save.$range1 works"
	else
		echo $save.$range1  >> faulty_machines_nsl
	fi
	range1=`expr $range1 + 1 `
done


