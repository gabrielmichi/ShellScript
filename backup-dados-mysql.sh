#!/bin/bash

#alterar /home/nome_usuario
CAMINHO_HOME=/home/gmichi
cd $CAMINHO_HOME

#se nao existir o diretorio backup, sera criado
if [ ! -d backup ]
then
    mkdir backup
fi

mysqldump -u root $1 > $CAMINHO_HOME/backup/$1.sql

#se mysqldump status=0, ocorreu com sucesso
if [ $? -eq 0 ]
then
    echo "Backup foi realizado com sucesso"
else
    echo "Houve um problema no backup"
fi