#!/bin/bash

#verificar se o diretório "log" não existir, será criado
if [ ! -d log ]
then
    mkdir log
fi

#Programa que imprime top 10 processos com memória alocada
#os dez processos que estão com uma quantidade maior de memória alocada
processos_memoria(){
processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
for pid in $processos
do
    nome_processo=$(ps -p $pid -o comm=)
    #F = Data completa AAAA-MM-DD
    #Podemos concatenar a data com Horas/Minutos/Segundos ",%H:%M:%S"
    echo -n $(date +%F,%H:%M:%S,) >> $nome_processo.log
    tamanho_processo=$(ps -p $pid -o size | grep [0-9])
    #realiza o cálculo de divisão
    #scale=2 é a quantidade de casas decimais depois da vírgula
    echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> $nome_processo.log
done
}

processos_memoria
if [ $? -eq 0]
then
    echo "Os arquivos foram salvos com sucesso!"
else
    echo "Houve um problema na hora de salvar os arquivos!"
fi