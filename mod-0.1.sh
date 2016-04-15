#!/bin/bash
# Deivid Willyan Rodrigues Fabiano
# V0.1 - 11/03/2016
# Manipulação e Extração de Dados do Site 
# http://feeds.pciconcursos.com.br/feed/concursos

#wget -nv "http://feeds.pciconcursos.com.br/feed/concursos" -O Artigo

arquivo=Artigo

metodoExtrator () {
    egrep "(<title>|<pubDate>|<link>)" $arquivo   |
        sed 's/<title>/\nConcurso: /'             |
        sed 's/<pubDate>/Hora: /'                 |
        sed 's/<link>/Site: /'                    |
        sed 's/<[^>]*>//g'
}

if [ -e $arquivo ] ; then
    metodoExtrator
else
    echo "ERROR : O arquivo \"$arquivo\" não foi encontrado!"
fi
