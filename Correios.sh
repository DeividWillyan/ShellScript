#!/bin/bash
# Acompanhar Status Objeto Correios.
# Deivid Willyan 
# https://www.facebook.com/DeividWillyan
# 05/01/2016 Versao 0.1

# Coloque o Codigo de rastreio variavel abaixo.
codeRastreio=PJ311277800BR
siteCorreio="http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=${codeRastreio}"

ls arquivoAntigo &> /dev/null
[ $? != 0 ] && touch arquivoAntigo

wget ${siteCorreio} -O arquivo &>/dev/null

egrep "<tr><td " arquivo |sed 's/<[^>]*>/ /g' > 1.txt
egrep "<tr><td " arquivoAntigo |sed 's/<[^>]*>/ /g' > 2.txt
 
diff -iw 1.txt 2.txt | grep ">" | tr -d ">"
cat arquivo > arquivoAntigo
rm -f 1.txt 2.txt arquivo
