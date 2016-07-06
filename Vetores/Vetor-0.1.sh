#!/bin/bash
# Deivid Willyan
# Exemplos com Array

vetor=( "Deivid" "Willyan" "Rodrigues" "Fabiano")


# remove um index do vetor 
# unset vetor[2]

# adiciona um elemento no fim do vetor
# vetor=(${vetor[@]} "$1")

# percorre todos os elementos de um vetor
# for ((i=0; i < ${#vetor[*]}; i++))
# do
#     echo ${vetor[$i]}
# done


for i in ${vetor[*]}
do
    echo $i
done
