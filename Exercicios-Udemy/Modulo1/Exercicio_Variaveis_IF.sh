#!/bin/bash

#Validar se o primeiro parâmetro enviado é maior que 10
#Se for maior, mostre uma mensagem na tela com o nome do script e seu respectivo PID de execução
#outra alternativa - [ $1 -gt 10 ] && echo "Nome do Script: $0 | PID de execução: $$"

echo "O Parâmetro informado foi $1"

if [ $1 -lt 10 ]; then
    echo -e "PID do script: $$"
    echo -e "Nome do Script: $0"
fi