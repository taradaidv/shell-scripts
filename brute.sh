#!/bin/bash
i="0"
while [ a=a ]
do		
	
	h=$(md5 -s "$i")

  if [[ $h = 'MD5 ("'$i'") = f899139df5e1059396431415e770c6dd' ]] #EXAMPLE MD5 -s 100 = f899139df5e1059396431415e770c6dd
    then 
    break
  else
  i=$[$i+1]
  fi
done
echo "[FIND] $h"
#echo "[FIND] $h" > ~/FIND.TXT4
