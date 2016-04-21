#!/bin/bash
# Deivid Willyan
# V0.1 - 20/04/2016
# Script de descobrimento de hosts online na rede,
# com base na resposta de pings.
# Descobre altomaticante seu ip e faz os respectivos testes,
# gerado uma saida chamada lista.txt.

seuip=$(ifconfig | grep Bcast | sed 's/.*addr:// ; s/\ .*//')
ip=$(ifconfig | grep Bcast | sed 's/.*addr:// ; s/\ .*//' | tr "." " " | awk '{print $1; print $2; print $3}' | tr '\n' ".")

touch lista.txt

for i in {0..254}
do
    _ip=${ip}${i}
    clear
    echo -e "\n[#] Iniciando a descoberta de HOST..."
    echo "[#] Seu IP [${seuip}]" 
    echo "[T] Testando [${_ip}]"
    ping -c 1 -n -i 0.2 -W1 ${_ip}  &> /dev/null
    [ $? -eq 0 ] && echo "[Online] ${_ip}" >> lista.txt
done
