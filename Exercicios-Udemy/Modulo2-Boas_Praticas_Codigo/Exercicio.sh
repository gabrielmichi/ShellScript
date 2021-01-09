#Aplique o nosso padrão de cabeçalho (pode inventar uma descrição, nome do script, modo de uso, etc...)
#Endente o código abaixo para ficar mais legível
#Separe o código dentro do nosso padrão: Variáveis -> Testes -> Execução
#Preste atenção no nome das variáveis, está ok? Dentro do padrão? Podemos melhorar o nome delas?
#Se você entender o código, faça alguns comentários simples nele!

#!/usr/bin/env bash

COMECA=2 
TERMINA=100;

# Começo maior que o fim? Inválido!
[ $COMECA -ge $TERMINA ] && exit 1

for i in $(seq $COMECA $TERMINA) # Repete 100 vezes
do 
    for j in $(seq $i $TERMINA)  # Repete de N vezes até 100 vezes
    do printf "*";
    done
    printf "\n"
done
