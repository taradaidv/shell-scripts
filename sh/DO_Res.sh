#!/bin/bash
#clear
#curl -G -H "X-API-Token: 31cd5b22ca684670891721512ce78b9d" "https://2ip.ru/api/v1.0/geo/195.218.200.155"
curl --insecure -s -G -L https://rest.db.ripe.net/search.xml?query-string=$1 | grep  -e '"org-name"' \
-e '"descr"' \
-e 'name="route"' \
-e 'name="inetnum"' \
-e 'name="netname"' \
-e 'name="mnt-by"' \
-e 'name="country"' \
| uniq \
| sed 's/        <attribute name="\(.*\)" value="//' \
| sed 's/"\/>//' \
| sed 's/" referenced-type="mntner">//' | paste -d, -s \
|sed 's/^/'$1',/'
#| sed 's/\;/_/' \
#| sed 's/ /_/'
#| sed 's:<attribute name="\(.*\)$:\1:g' \
