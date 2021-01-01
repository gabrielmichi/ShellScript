#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2}' )
memoria_consumida=$(free | grep -i mem | awk '{ print $3 }' )

#Utilizamos o scale=2 para ter uma precisão maior, com 2 casas decimais.
#awk -F utilizado para pegar antes do ponto
#bc utilizado para realizar o calculo da memoria_consumida/memoria_total
relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total *100" | awk -F . ' { print $1 }')

#entra na condicao caso ultrapasse de 50% memoria consumida
if [ $relacao_memoria_atual_total -gt 50 ]
then
mail -s "Consumo de memoria acima do limite" email@gmail.com << del
O consumo de memoria esta acima do limite que foi especificado. Atualmente o consumo e de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi