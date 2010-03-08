#! /bin/sh

rm faulty_machines_osl


i=10.105.41.70
j=10.105.12.130
range1=`echo $i | cut -f4 -d. `
range2=`echo $j | cut -f4 -d. `

save=`echo $i | cut -f4 -d. --complement `

while [ $range1 -le $range2 ]
do
	if ping -c 1 $save.$range1 | grep "1 received"	#Send only 1 req to avoid flooding.
	then
		echo "$save.$range1 REACHABLE"
	#	echo $save.$range1 >> FAULTY_LIST
	else
		echo "$save.$range1 NOT reachable by Ping"
	fi
	range1=`expr $range1 + 1 `
done


