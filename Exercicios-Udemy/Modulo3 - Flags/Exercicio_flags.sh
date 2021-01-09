#!/bin/bash
# Exercio_informacoes_coluna.sh - Listar informações da Coluna
#
# Autor:      Gabriel Michi
# Manutenção: Gabriel Michi
#
# ------------------------------------------------------------------------ #
#  O usuário irá informar o número da coluna que quer extrair a informação
#  Planilha exemplo extraída de https://www.atelie.com.br/lista-de-precos-baixar/
#
#  Exemplos:
#      $ ./Exercio_informacoes_coluna.sh 1
#      $ ./Exercio_informacoes_coluna.sh -h
# ------------------------------------------------------------------------ #
# Histórico:
#
#   v1.0 09/01/2020
#     - Primeira versão
# ------------------------------------------------------------------------ #
# Testado em:
#   bash 4.4.19
# ------------------------------------------------------------------------ #

# ------------------------------- VARIÁVEIS ----------------------------------------- #
MENSAGEM_USO="
    $(basename $0) - O arquivo possui 5 colunas, digite o número da coluna desejada. 
    
    [Informações do Programa]
    -h - Menu de Ajuda
    -v - Versão do programa
"
VERSAO="v1.0"

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"
do
    case "$1" in
        -h) echo "$MENSAGEM_USO" && exit 0               ;;
        -v) echo "$VERSAO" && exit 0                     ;;
        [1-5]) cat catalogo-produtos.csv | cut -d ';' -f $1  ;;
        *) echo "Opção inválida, verifique o menu com a opção -h." && exit 1 ;;
    esac 
    shift
done

# ------------------------------------------------------------------------ #