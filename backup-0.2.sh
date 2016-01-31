#!/bin/bash
# Script de backup do diretorio /var/www/html/
# Deivid Willyan - https://www.facebook.com/DeividWillyan
# V0.1 30/01/2016
# Efetuar o BKP do MySQL e Testa se o Arquivo de BKP Foi Criado com Sucesso.
# V0.2 30/01/2016

########################################################################################

user="root"
pass="SENHA"
destinoBKP="/backup/"
efetuarBKP="/var/www/html"
nomeBKP="$(date +%d-%b).SITE.tgz.gz"
databases=$(mysql -u ${user} -p${pass} -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)


echo -e "\n [ I N I C I A N D O   B K P !! ] \n"

for db in ${databases} ; do

dumpSQL="$(date +%d-%b).${db}.sql"
nomeSQL="$(date +%d-%b).${db}.sql.tgz.gz"

    if [[ "${db}" != "information_schema" ]] && [[ "${db}" != "performance_schema" ]] && [[ "${db}" != "mysql" ]] && [[ "${db}" != _* ]] ; then
        echo " [ Dumping database: ${db} ] "
        mysqldump -u ${user} -p${pass} --databases ${db} > "${destinoBKP}${dumpSQL}"
	tar -cPzf ${destinoBKP}${nomeSQL} ${destinoBKP}${dumpSQL}
	rm ${destinoBKP}${dumpSQL}
    fi
done

tar -cPzf ${destinoBKP}${nomeBKP} ${efetuarBKP}

echo " [ Backup Realizado com Sucesso ] "
[ -e ${destinoBKP}${nomeBKP} ] && echo -e " [ Diretorio do BKP : ${destinoBKP} ]\n " || echo -e " BKP Inexistente\n"
