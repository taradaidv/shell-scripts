#!/bin/sh
clear
echo "Find word in HTML v.1.5 [28.09.2018]"
if [ -z "$1" ] & [ -z "$2" ] & [ -z "$3" ];then
 echo "Введите в качестве дополнительных параметров разделенных пробелом:\n[количество хостов] [IP-адрес без последнего октета] [слово для поиска (регистр учитывается)]\nНапример: $0 254 192.168.0 Drupal"
 exit 1
fi


#net loop
z=0
while (( ++z <= $1 ))
do
     ip="$2.$z"
#net scan
echo "Scan: "$ip
     for port in {80,8080}; do
		content=$(curl --insecure -s -m5 -L 'http://'$ip':'$port)
		(echo >/dev/tcp/$ip/$port) &>/dev/null && ([[ "$content" == *$3* ]] && echo ">>>[$3] = http://$ip:$port")
	done
	
	for port in {443,8433}; do
		content=$(curl --insecure -s -m5 -L 'https://'$ip':'$port)
		(echo >/dev/tcp/$ip/$port) &>/dev/null && ([[ "$content" == *$3* ]] && echo ">>>[$3] = https://$ip:$port")
		
	done
	
#pstr="[====================================================================]"
#i=0
#while [ $i -lt $1 ]; do
#  sleep 0.1 # this is work
#  i=$(( $i + 1 ))
#  pd=$(( $i * 70 / $1 ))
#  printf "\r%3d.%1d%% %.${pd}s" $(( $i * 100 / $1 )) $(( ($i * 1000 / $1) % 10 )) $pstr
#done
#echo "\n"

done
