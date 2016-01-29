#!/bin/bash

# Deivid Willyan
# V0.1 - 29/01/2016
# Exemplo da leitura de um arquivo txt e um contador.

# Variavel lista está execultando o comando dentro do $()
lista=$(cat lista.txt)

# Define uma variavel chamada cont com o valor 0.
cont = 0

# o loop vai rodar enquanto tiver conteudo na variavel $lista que foi alimentada a cima.
# a cada interaçao da loop o i recebera o proximo conteudo da lista e assim será até o fim.
for i in $lista
do

# neste momento a variavel cont é incrementada, recebendo seu valor anterior + 1, a cada loop o valor aumenta.
   ((cont=$cont+1))

# aqui imprime na tela a varivel cont e a variavel da i da lista.
   echo " | $cont | $i |" 
   echo " |----------------------------------------------------|"

# Fim do loop.
done
