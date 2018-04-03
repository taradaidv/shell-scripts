#!/bin/bash
#DNS toolbox v.2.1 [TDV 03.04.2018]
clear

if [ -z "$1" ];then
 echo -e  "\e[91mвведите имя домена, например: \e[96m$0 ya.ru"
 exit 1
fi

echo -e "\e[96mDOMAIN: $1 \e[0m"
MX=`host -t mx $1`
SPF=`host -t txt $1`
DKIMd=`host -t txt default._domainkey.$1`
DKIMm=`host -t txt mail._domainkey.$1`
DMARC=`host -t txt _dmarc.$1`

if [[ $MX != *"NXDOMAIN"* && $MX != *"no TXT record"* ]]; then
echo -e "\e[91mMX \n\e[32m$MX \e[0m"
else
echo -e "\e[41mMX   \e[49m \e[91mзапись отсутствует\e[39m"
fi

if [[ $SPF != *"NXDOMAIN"* && $SPF != *"no TXT record"* ]]; then
echo -e "\e[91mSPF \n\e[32m$SPF\e[0m"
else
echo -e "\e[41mSPF  \e[49m \e[91mзапись отсутствует\e[39m - $SPF"
fi

if [[ $DMARC != *"NXDOMAIN"* && $DMARC != *"no TXT record"* ]]; then
echo -e "\e[91mDMARC \n\e[32m$DMARC\e[0m"
else
echo -e "\e[41mDMARC\e[49m \e[91mзапись отсутствует\e[39m - $DMARC"
fi

if [[ $DKIMm != *"NXDOMAIN"* && $DKIMm != *"no TXT record"* ]]; then
m=$DKIMm
fi
if [[ $DKIMd != *"NXDOMAIN"* && $DKIMd != *"no TXT record"* ]]; then
d=$DKIMd
fi

if [[ $m && $d != " " ]]; then
echo -e "\e[91mDKIM [mail] \n\e[32m$m"
echo -e "\e[91mDKIM [default] \n\e[32m$d"
else
echo -e "\e[41mDKIM \e[49m \e[91mзапись отсутствует (селекторы: default и mail)\e[39m\n$DKIMm\n$DKIMd "
fi

if [ -z "$2" ];then
exit 1
else
 echo -e "\e[96mДоп. селектор: $2"
 host -t txt $2._domainkey.$1
fi
