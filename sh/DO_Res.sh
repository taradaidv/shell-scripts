#!/bin/sh

curl  -L https://rest.db.ripe.net/search.xml?query-string=91.xx.xx.xx | grep -e 'name="' | sed 's:<attribute name="\(.*\)$:\1:g' | sed 's/" value="/;/' 

#" referenced-type="mntner">
