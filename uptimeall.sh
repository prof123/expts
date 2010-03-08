#! /bin/sh
#This script mounts all the nsl/osl machines.
#Run as root


i=10.105.12.$1
j=10.105.12.$2
range1=`echo $i | cut -f4 -d. `
range2=`echo $j | cut -f4 -d. `

save=`echo $i | cut -f4 -d. --complement `

while [ $range1 -le $range2 ]
do
	echo "$save.$range1" 
	ssh "$save.$range1" 'uptime'
	range1=`expr $range1 + 1 `
done


