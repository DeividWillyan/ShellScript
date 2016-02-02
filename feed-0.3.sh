#!/bin/bash
# Deivid Willyan - https://www.facebook.com/DeividWillyan
# V0.1 - 02/02/2016
# Pegar o titulo de Noticias e exibe.
# V0.2 - 02/02/2016
# Melhoria de Codigo.
# Insedio url do noticia.
# V0.3 - 02/02/2016
# Melhoria de Codigo.

wget -q "http://rss.tecmundo.com.br/feed" 

iconv -f utf-8 -t latin1//TRANSLIT feed > feed-leitura
rm feed

echo ""

tr '\n' ' ' < feed-leitura                  | # troca todas as quebras de linha por espaço. 
   awk 'gsub("<[^/]", "\n&")'               | # coloca antes de cada tag de inicio <..> uma quebra de linha
   egrep '(<title>|<link>)' 		    | # filtra pela tag titulo
   sed 's/<[^>]*>// 		  	    ; # remove todas as tags de incio <..>
	s/<\/.*>// 		 	    ; # remove todas as tags titulo finais </..>
	/Novidades do TecMundo/d 	    ; # remove o titulo do site
	/http:\/\/www.tecmundo.com.br\/$/d  ; # remove o link inicial
	/^$/d'                              | # remove linhas em branco
   tr '\n' ' '                              | # ira trocar as quebras de linha por espaco. 
   sed 's/.htm/.htm\n/g			    ' # coloca uma quebra de linha apos o final do .htm

echo ""
rm feed-leitura
