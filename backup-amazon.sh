#!/bin/bash

: '
    - Criar bucket "curso-shell-script"
    - Criar IAM -> Users -> Nome (criar_seu_nome_usuario) -> Programmatic Access -> Attach existing policies directly -> s3    (AmazonS3FullAccess)
    - pip install awscli
    - sudo apt install awscli
    - aws configure (configurar: Chave de acesso/key)
    - Permissao: chmod +x backup-amazon.sh
    - sudo crontab -e
    - 14 10 * * * /home/gmichi/Scripts/backup-amazon.sh
'

CAMINHO_BACKUP=/home/gmichi/backup_mutillidae_amazon
cd $CAMINHO_BACKUP
data=$(date +%F)
if [ ! -d $data ]
then
	mkdir $data
fi

tabelas=$(mysql -u root mutillidae -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
	mysqldump -u root mutillidae $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

aws s3 sync $CAMINHO_BACKUP s3://curso-shell-script