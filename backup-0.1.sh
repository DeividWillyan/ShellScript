#!/bin/bash
# Script de backup do diretorio /var/www/html/
# Deivid Willyan - https://www.facebook.com/DeividWillyan
# V0.1 30/01/2016

# Local onde será salvo o backup.
destinoBKP="/backup/"

# Diretorio que será efetuado o backup.
efetuarBKP="/var/www/html"

# Nome do backup.
nomeBKP="BKP_$(date +%d-%b).tgz.gz"

echo " [ I N I C I A N DO   B K P !!! ] "

# Realiza bkp.
tar -cPzf ${destinoBKP}${nomeBKP} ${efetuarBKP}

[ $? = 0 ] && echo " [ Backup Realizado com Sucesso ]" || " [ Erro no backup!!! ] "
