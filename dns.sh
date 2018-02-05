#!/bin/sh
while IFS='' read -r line; do
#host -t txt  _dmarc.$line  >> out.DMARC.txt
#host -t txt default._domainkey.$line  >> out.DKIM.txt
#host -t txt mail._domainkey.$line  >> out.DKIM.txt
#    host -t txt $line >> out.TXT.txt
#    host -t mx $line >> out.MX.txt
done < "$1"
