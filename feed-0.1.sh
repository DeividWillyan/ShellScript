#!/bin/bash
# Deivid Willyan - https://www.facebook.com/DeividWillyan
# V0.1 - 02/02/2016
# Pegar o titulo de Noticias e exibe.

wget -q "http://rss.tecmundo.com.br/feed"  # Site Exemplo

iconv -f utf-8 -t latin1//TRANSLIT feed > feed-leitura # converte o feed.
rm feed # remove o feed do wget 

echo "" # quebra de Linha

tr '\n' ' ' < feed-leitura        | # troca todas as quebras de linha por espaço. 
   awk 'gsub("<[^/]", "\n&")'     | # coloca antes de cada tag de inicio <..> uma quebra de linha
   egrep '<title>'                | # filtra pela tag titulo
   sed 's/<[^>]*>//               ; # remove todas as tags de incio <..> 
        s/<\/title>//             ; # remove todas as tags titulo finais </..>
        /Novidades do TecMundo/d  ; # remove o titulo do site
        /^$/d                     ' # remove linhas em branco

echo "" # quebra de Linha
rm feed-leitura # remove o feed convertido
