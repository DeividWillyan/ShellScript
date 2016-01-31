#!/bin/bash
# Deivid Willyan - https://www.facebook.com/DeividWillyan
# V0.1 30/01/2016
# Script de backup do diretorio /var/www/html/
# V0.2 30/01/2016
# Efetuar o BKP do MySQL.
# V0.3 31/01/2016
# scp adicionado para fazera copia do BKP.

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
echo -e " [ Diretorio do BKP : ${destinoBKP} ]\n" 

#######################################################################################

# COPIA DO BKP #

# Lembrese que para automatizar por completo esta etapa, deve ser criado a chave publica e privada
# Deve-se colocar no servidor que ira ser enviado o BKP a chave publica .pub
# Utilize o ssh-keygen para criar.
# https://www.debian.org/devel/passwordlessssh.pt.html ; https://www.vivaolinux.com.br/dica/SSH-sem-senha

#ipEnviarBKP="0.0.0.0"
#userEnviaBKP="root"
#localEnviaBKP="/meu_bkp/"

#echo -e " [ Iniciando copia do BKP  ] \n"

#scp -r ${destinoBKP} "${userEnviaBKP}@${ipEnviarBKP}:${localEnviaBKP}"
