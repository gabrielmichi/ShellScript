#!/bin/bash

converte_imagem(){
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. ' {print $1}' )
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
}


#Funcao varrer_diretorio
varrer_diretorio(){
    $1 #pegar o primeiro parametro
    cd ~/Downloads/imagens-novos-livros
    # faz varredura em todo o conteudo *
    for arquivo in *
    do
        #faz uma busca pela variavel arquivo
        local caminho_arquivo=$(find ~/Downloads/imagens-novos-livros -name $arquivo) 
        if [ -d $caminho_arquivo ]
        then
            varrer_diretorio $caminho_arquivo
        else
            #conversao jpg para png
            #se nao for um diretorio/imagem, invoca imagem
            converte_imagem $caminho_arquivo
        fi
    done
}

varrer_diretorio ~/Downloads/imagens-novos-livros
#pegar status de saída
if [ $? -eq 0]
then
    echo "Conversao realizada com sucesso"
else
    echo "Houve um problema na conversao"
fi
