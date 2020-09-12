#!/bin/bash

cd ~/apache-log

cat apache.log | grep $1

#expressao regular
# [0-9] aceita números de 0 à 9
# {1,3} no mínimo 1 número e no máximo 3
# \b  delimitador (Adicionando esse delimitador nas extremidades da expressão, não será reconhecido nenhum algarismo que ultrapasse a quantidade de 3 por intervalo.
regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
if [[ $1 =~ $regex ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
    then
        echo "O endereço IP procurado não está presente no arquivo"
    fi
else
    echo "Formato nao é valido"
fi