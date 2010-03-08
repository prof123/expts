#! /bin/sh
#This script mounts all the nsl/osl machines.
#Run as root


i=10.105.11.$1
j=10.105.11.$2
range1=`echo $i | cut -f4 -d. `
range2=`echo $j | cut -f4 -d. `

save=`echo $i | cut -f4 -d. --complement `

while [ $range1 -le $range2 ]
do
	ssh "root@$save.$range1" 'ln -s /usr/plt/bin/drscheme /usr/bin/drscheme-new'
	range1=`expr $range1 + 1 `
done


##just testing github