#!/bin/bash
#DNS toolbox v.2 [TDV 03.04.2018]
clear

if [ -z "$1" ];then
 echo -e  "\e[91mвведите имя домена, например: \e[96m$0 ya.ru"  # Need quotes to escape #
 exit 1
fi

echo -e "\e[96mDOMAIN: $1 \e[0m"
MX=`host -t mx $1`
SPF=`host -t txt $1`
DKIMd=`host -t txt default._domainkey.$1`
DKIMm=`host -t txt mail._domainkey.$1`
DMARC=`host -t txt _dmarc.$1`

if [[ $MX != *"NXDOMAIN"* ]]; then
echo -e "\e[91mMX \n\e[32m$MX"
else
echo -e "\e[41mMX   \e[49m \e[91mзапись отсутствует\e[39m"
fi

if [[ $SPF != *"NXDOMAIN"* ]]; then
echo -e "\e[91mSPF \n\e[32m$SPF"
else
echo -e "\e[41mSPF  \e[49m \e[91mзапись отсутствует\e[39m"
fi

if [[ $DMARC != *"NXDOMAIN"* ]]; then
echo -e "\e[91mDMARC \n\e[32m$DMARC"
else
echo -e "\e[41mDMARC\e[49m \e[91mзапись отсутствует\e[39m"
fi

if [[ $DKIMm != *"NXDOMAIN"* ]]; then
m=$DKIMm
fi
if [[ $DKIMd != *"NXDOMAIN"* ]]; then
d=$DKIMd
fi

if [[ $m && $d != " " ]]; then
echo -e "\e[91mDKIM [mail] \n\e[32m$m"
echo -e "\e[91mDKIM [default] \n\e[32m$d"
else
echo -e "\e[41mDKIM \e[49m \e[91mзапись отсутствует (селекторы: default и mail)\e[39m"
fi
