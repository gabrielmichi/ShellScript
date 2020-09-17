#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

: '
if [ $resposta_http -eq 200 ]
then
    echo "Tudo esta ok com o servidor"
else
    echo "Houve um problema no servidor. Tentando reinicializar"
    systemctl restart apache2
    echo "...Servidor Reinicializado"
fi
'

#Mudanca de logica, se não for = 200
if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" #email<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web.
del
    systemctl restart apache2
fi

: '
Configurar para realizar o monitoramento diario (crontab -e)
Exemplo:
*/2 * * * * /home/gmichi/Scripts/monitoracao-servidor.sh
'