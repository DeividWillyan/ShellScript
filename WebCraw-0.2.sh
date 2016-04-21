#!/bin/bash
# Deivid Willyan
# V0.1 - 20/04/2016
# testes de web crawler em sites.
# V0.2 - 21/04/2016
# Adicinados filtros para retirar itens repetidos.
# Outras melhorias de codigos.

[ $1 ] && echo "$1" > urls.txt

for i in $(cat urls.txt)
do
    wget -nv "${i}" -O site.txt
    fgrep -i 'href' site.txt |
    sed 's/.*href="// ; s/".*// ' >> tmp_urls.txt
done

# Filtros remover invalidos
grep ^http tmp_urls.txt > _urls.txt
rm tmp_urls.txt
grep -v .css$ _urls.txt > tmp_urls.txt
rm _urls.txt site.txt
sort tmp_urls.txt | uniq -u  > urls.txt
rm tmp_urls.txt
