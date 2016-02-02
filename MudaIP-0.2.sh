#!/bin/bash
# Detecta Mudança no IP
# Desenvolvido por Deivid Willayn / https://www.facebook.com/DeividWillyanp
# 05-01-2016 Versão 0.1
# 02-02-2016 Versão 0.2
# Otimização de Codigo.

[ ! -e .ipAntigo.txt ] && echo "0.0.0.0" > .ipAntigo.txt

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
