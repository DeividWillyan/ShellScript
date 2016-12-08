#!/bin/bash
# 04/01/2016 extrator de nomes do site www.dicionariodenomesproprios.com.br/
# Criador Deivid Willyan / https://www.facebook.com/DeividWillyan

TEXTO="</a><br"
TEXTO2="</a> <span>"

for i in {1..190}
do
   wget http://www.dicionariodenomesproprios.com.br/nomes-masculinos/${i}/ -O index${i}.html &> /dev/null
done

fgrep -i "${TEXTO2}" index1.html|tr A-Z a-z| sed 's/.*href="\/// ; s/\/".*//' > nomes.txt

for index in index{1..190}.html
do
   fgrep -i "${TEXTO}" ${index}| tr A-Z a-z | sed 's/.*href="\/// ; s/\/".*//' >> nomes.txt
done

rm -rf index*
ls nomes.txt &> /dev/null
[ $? -eq 0 ] && echo "Lista de nomes masculinos criada com sucesso!"
