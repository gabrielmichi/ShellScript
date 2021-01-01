#!/bin/bash

#Um laço que conte de 0 a 10
#A cada iteração, verifique se o número é divisível por 2
#Se ele for divisível por 2, escreva uma mensagem na tela confirmando isso

for i in $(seq 10)
do
    DIVISAO=$(($i%2))
    #echo "Divisão: $DIVISAO e $i"
    if [ $DIVISAO -eq 0 ]; then
        echo -e "O Número $i é divisível por 2."
    fi
done

##OUTRA FORMA DE FAZER
#for i in $(seq 0 10)
#do
    #[ $(($i % 2)) -eq 0 ] && echo "Número $i é divisível por 2"
#done