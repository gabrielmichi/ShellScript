#!/bin/bash

CAMINHO_IMAGENS=/home/mobaxterm/Desktop/Scripts/imagens-livros/

# convert /home/mobaxterm/Desktop/Scripts/imagens-livros/amazon_aws.jpg /home/mobaxterm/Desktop/Scripts/imagens-livros/amazon_aws.png

for imagem in $@
do
  convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
done

# $@ - engloba todos parametros passados pelo usu�rio sem saber ao certo quantos s�o.