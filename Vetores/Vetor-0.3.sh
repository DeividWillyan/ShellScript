#!/bin/bash
# Deivid Willyan
# 06052016 V03


case "$1" in
    
    new)
           vetor=("")
   
    ;;
    
    add)
            vetor=(${vetor[*]} "$2")
    ;;
    
    show)
            for i in ${vetor[*]}
            do
                echo "$i"
            done
    ;;

esac
