#!bin/bash
# Deivid Willyan Rodrigues Fabiano
# V0.1 - 11/03/2016
# Manipulação e Extração de Dados do Site 
# http://feeds.pciconcursos.com.br/feed/concursos
# V0.2 - 24/03/2016 
# Adicionado Argumentos

#wget -nv "http://feeds.pciconcursos.com.br/feed/concursos" -O Artigo

arquivo=Artigo

metodoExtrator () {
    egrep "(<title>|<pubDate>|<link>)" $arquivo   |
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
            if [ -e $arquivo ] ; then
                metodoExtrator
            else
                echo "ERROR : O arquivo \"$arquivo\" não foi encontrado!"
            fi
        ;;

     *)
        echo "$0 -u - Para atualizar a Lista de Concursos"
            echo "$0 -e - Para Execultar o Script" 
        ;;

esac

