#!/bin/bash
# Deivid Willyan
# Trabalhando com Vetores

# Lista de Vetores
vetor=("Deivid" "Willyan" "Rodrigues" "Fabiano")

# caso seja passado algum parametro é adicionado ao final do vetor
[ $1 ] && vetor=(${vetor[*]} "$1")

shift
# percorre todo o vetor e imprime seus elementos.
for i in ${vetor[*]}
do    
    echo "$i"
done


