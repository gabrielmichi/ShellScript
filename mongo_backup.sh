#!/bin/bash
echo '***************************************************************'
echo "IM/OM.....: @option.REGISTRO@"
echo "Motivo....: @option.MOTIVO@"
echo "Usuário...: @job.username@"

echo "Collection: @option.COLLECTION@"
echo '***************************************************************'
echo ''
TODAY=`date +%Y-%m-%d_%H%M`

function mongodump {
    echo 'INICIANDO O BACKUP DO BANCO'
    /usr/local/bin/mongo42dump -v -h $RD_OPTION_CLUSTER -d $RD_OPTION_BANCO -u usr_rundeck --password $RD_OPTION_AUTH_MONGO --authenticationDatabase=admin -c $RD_OPTION_COLLECTION --gzip -o /mnt/mongodump_storage/$RD_OPTION_BANCO-$RD_OPTION_COLLECTION-$TODAY
    if [ $? -eq 0 ]; then
        echo -e "BACKUP REALIZADO\n"
        echo -e "Arquivo de dump: $RD_OPTION_BANCO-$RD_OPTION_COLLECTION-$TODAY está disponivel no caminho de rede \\\\sede41\\SISDAT\\Digital\\mongodump"
        umountdumpvol
    else
        echo "BACKUP FALHOU"
        exit 1
    fi
}



#manter umount
function umountdumpvol {
    sudo umount /mnt/mongodump_storage
    exit 0
}

#manter mount
function mountdumpvol {
grep -qs '/mnt/mongodump_storage ' /proc/mounts
if [ $? -eq 0 ] ; then
    echo "VOLUME JÁ ESTÁ MONTADO"
    df -h /mnt/mongodump_storage
    mongodump
else
    echo "MONTANDO O VOLUME"
    #sudo mount -t cifs //10.96.166.21/SISDAT/Digital/mongodump/ /mnt/mongodump_storage/ -o username=usr_rundeck,password=$RD_OPTION_USR_RUNDECK,uid=501,gid=501,domain=serasa,vers=2.0
    echo "MONTANDO DESTINO DA EXTRAÇÃO"
    sudo mount -t cifs //10.96.166.21/SISDAT/mongodump /mnt/mongodump_storage -o username=usr_rundeck,password=@option.usr_rundeck@,uid=501,gid=501,domain=serasa,vers=2.0
    if [ $? -eq 0 ]; then
        echo "VOLUME MONTADO"
        df -h /mnt/mongodump_storage
        mongodump
    else
        echo "MONTAR VOLUME FALHOU"
        exit 1
    fi
fi
}

if [ -d "/mnt/mongodump_storage/" ]; then 
    echo 'MONTANDO VOLUME PARA GRAVAR O DUMP DO BANCO'
    mountdumpvol
else
    echo 'CRIANDO VOLUME PARA GRAVAR O DUMP DO BANCO'
    sudo mkdir -pv /mnt/mongodump_storage/
    if [ $? -eq 0 ]; then
        mountdumpvol
    else
        echo "FALHA PARA CRIAR O VOLUME"
        exit 1
    fi
fi

#criar funcao restart
#criar um for para consultar a qtd de container existe no pod
#criar backup /tmp - zip os arquivos e copia para o caminho de backup
#enviar mensagem que os backups estão disponíveis
#apagar os arquivos do /tmp
#realizar um backup por vez (por pod)
#oc delete nomepod -n nomeprojeto
#especificar o tempo de logs --since hh (12 hrs)
#1-2-4-8-12-24 usuário selecionar quantidade de horas

$RD_OPTION_CLUSTER
oc logs --since=${RD_OPTION_QUANTIDADE_HORAS}

>> /tmp/nomeAplicacaoVarData.log

oc logs nomepod nomeprojeto

