#!/bin/bash
clear
echo "Find word in HTML v.1.5 [28.09.2018]"
if [ -z "$1" ] & [ -z "$2" ] & [ -z "$3" ];then
 echo "staroe opisanie !!!Введите в качестве дополнительных параметров разделенных пробелом:\n[количество хостов] [IP-адрес без последнего октета] [слово для поиска (регистр учитывается)]\nНапример: $0 254 192.168.0 Drupal"
 echo "./cms_scan.sh 192.168 128 143 1 254 Drupal"
 exit 1
fi


#net loop
y=$2-1
while (( ++y <= $3 ))
do
# x.x.[x].x
z=$4-1
while (( ++z <= $5 ))
do
# x.x.x.[x]
     ip="$1.$y.$z"
#net scan
echo "Scan: $ip"
        for port in {80,8080}; do
                #echo "$port"
                content=$(curl --insecure -s -m1 -L 'http://'$ip':'$port)
                [[ "$content" == *$6* ]] && echo ">>>[$6] = http://$ip:$port"
        done

         for port in {443,8443}; do
                #echo "$port"
                content=$(curl --insecure -s -m1 -L 'https://'$ip':'$port)
                [[ "$content" == *$6* ]] && echo ">>>[$6] = https://$ip:$port"
        done

done
done
