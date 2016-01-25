#!/bin/bash
# Detecta Mudança no IP
# Desenvolvido por Deivid Willayn / https://www.facebook.com/DeividWillyan

ls .ipAntigo.txt &> /dev/null
[ $? != 0 ] && echo "0.0.0.0" > .ipAntigo.txt

wget "http://www.meuip.com.br/" &> /dev/null

IP=$(grep "<\/div> <\/b>" index.html | sed 's/.*-> // ; s/<.*//')
IPAntigo=$(cat .ipAntigo.txt)

if [ ${IP} != ${IPAntigo} ] ; then
 echo "IP Alterado ${IP}" 
 echo "${IP}" > .ipAntigo.txt
else
 echo "IP Continua o Mesmo"
fi

rm -f index.html
