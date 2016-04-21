#!/bin/bash
# Deivid Willyan
# testes de web crawler em sites.
# V0.1 - 20/04/2016


[ $1 ] && echo "$1" > urls.txt

for i in $(cat urls.txt)
do
    wget -nv "${i}" -O site.txt
    fgrep -i 'href' site.txt |
    sed 's/.*href="// ; s/".*// ' >> urls.txt
done

# Filtros remover invalidos
grep ^http urls.txt > urlss.txt
rm urls.txt
grep -v .css$ urlss.txt > urls.txt
rm urlss.txt site.txt
