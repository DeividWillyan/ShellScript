#!/bin/bash
# Desenvolvido por Deivid Willayn / https://www.facebook.com/DeividWillyan
# apt-get install curl
# Script test SQL Injection utilizando curl

echo -e "Site para teste: \c"
read site

sqli=$(curl --silent ${site}\' | egrep 'Warning|MySQL|syntax')
[ $? = 0 ] && echo "[V] => Possivelmente Vulneraveil" || echo "[X] => Não Vulneravel"
