#!/bin/bash
# verifica a % do disco /dev e verifica se é maior ou igual a 10
# Faz um ping e verifica se esta Online!
# Desenvolvido por Deivid Willayn / https://www.facebook.com/DeividWillyan

teste=$(df -h | grep "/dev$" | awk '{print $5}' | tr -d '%')
if [ ${teste} -ge 10 ] ;then
   echo "Maior"
else
   echo "menor"	
fi

ping=$(ping 8.8.8.8 -c3)
if [ $? -ne 0 ] ;then
    echo "Erro no ping"
else
    echo "Sucesso no Ping"
fi
