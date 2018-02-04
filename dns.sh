#!/bin/sh
while IFS='' read -r line; do
#    host -t txt $line >> out.txt.txt
    host -t mx $line >> out.mx.txt
done < "$1"
