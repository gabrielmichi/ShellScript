#!/bin/bash

cd ~/apache-log

:'
Uma opção seria fazer várias condições com if/else
if [ $1 == "GET" ]
then
    cat apache.log | grep GET
fi
'
# -z verifica se parametro esta nulo
# se nao tiver parametro ele entra na condicao
if [ -z $1 ]
then
    while [ -z $requisicao ]
    do
        read -p "Voce esqueceu de colocar o parametro (GET,PUT,POST,DELETE): " requisicao
        letra_maiuscula=$(echo $requisicao | awk '{ print toupper($1) }')
    done
else
    #converte parametro $1 para maiusculo
    letra_maiuscula=$(echo $1 | awk '{ print toupper($1) }')
fi

case $letra_maiuscula in
    GET)
    cat apache.log | grep GET
    ;;

    POST)
    cat apache.log | grep POST
    ;;

    PUT)
    cat apache.log | grep PUT
    ;;

    DELETE)
    cat apache.log | grep DELETE
    ;;

    *)
    echo "O parametro passado nao e valido"
esac
