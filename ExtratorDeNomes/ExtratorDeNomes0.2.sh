#!/bin/bash
# 04/01/2016 extrator de nomes do site www.dicionariodenomesproprios.com.br/
# Criador Deivid Willyan / https://www.facebook.com/DeividWillyan
# V0.2 - Otimização 

TEXTO="</a><br"
TEXTO2="</a> <span>"

for i in {1..190}
do
      wget http://www.dicionariodenomesproprios.com.br/nomes-masculinos/${i}/ -O index${i}.html &> /dev/null
   if [ index1.html = index${i}.html  ] ; then
      fgrep -i "${TEXTO2}" index1.html|tr A-Z a-z| sed 's/.*href="\/// ; s/\/".*//' > nomes.txt
   fi
      fgrep -i "${TEXTO}" index${i}.html| tr A-Z a-z | sed 's/.*href="\/// ; s/\/".*//' >> nomes.txt
done

rm -rf index*
ls nomes.txt &> /dev/null
[ $? -eq 0 ] && echo "Lista de nomes masculinos criada com sucesso!"
