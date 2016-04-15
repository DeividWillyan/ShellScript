#!/bin/bash
# Deivid Willyan Rodrigues Fabiano
# V0.1 - 11/03/2016
# Manipulação e Extração de Dados do Site 
# http://feeds.pciconcursos.com.br/feed/concursos
# V0.2 - 24/03/2016 
# Adicionado Argumentos
# V0.3 - 25/03/2016
# Melhorias de codigo e logica.

arquivo=Artigo

red=$(echo -e "\033[01;31m")
lcyan=$(echo -e "\033[36m")
yellow=$(echo -e "\033[33m")
green=$(echo -e "\033[32m")
blue=$(echo -e "\033[01;34m")
purple=$(echo -e "\033[35m")
normal=$(echo -e "\033[m")


metodoExtrator () {
    egrep "(<title>|<pubDate>|<link>)" ${arquivo} |
        sed 's/<title>/\nConcurso: /'             |
        sed 's/<pubDate>/Hora: /'                 |
        sed 's/<link>/Site: /'                    |
        sed 's/<[^>]*>//g'
}

case "$1" in

    -u)
        echo "Atualizando Artigo."
            rm -rf Artigo
            wget -nv "http://feeds.pciconcursos.com.br/feed/concursos" -O Artigo
        ;;
    -e)
            [ -e ${arquivo} ] && metodoExtrator ||
            echo "${red} ERROR : O arquivo \"${arquivo}\" não foi encontrado! ${normal}"

        ;;

     *)
        clear
        echo -e "${blue}   [ H E L P ] ${normal} \n"
        echo "${red}$0 -u ${normal} [ Para atualizar a Lista de Concursos ]"
            echo "${red}$0 -e ${normal} [ Para Execultar o Script             ]" 
        ;;

esac
