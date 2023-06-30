#!/bin/sh

declare -a arr=("db01" "db02")

# host
hfrom=127.0.0.1
hto=10.10.10.11

# port
portfrom=3306
portto=3306

# password
pfrom=abc
pto=def

# loop
for i in "${arr[@]}"
do
   echo "----------------------"
   echo "$i"
   mysqldump -h$hfrom -P$portfrom -uroot -p$pfrom "$i" > "$i".sql
   yes | mysqladmin -h$hto -P$portto -uroot -p$pto drop "$i"
   mysqladmin -h$hto -P$portto -uroot -p$pto create "$i"
   mysql -h$hto -P$portto -uroot -p$pto "$i" < "$i".sql
   echo "----------------------"
   echo ""
done