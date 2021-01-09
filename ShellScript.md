$@ = vários parâmetros
* = pode existir qualquer caracter
$1 = pega o primeiro parâmetro passado na linha de comando


# o parâmetro -F (-f) é o campo delimitador
awk -F .
cut -d : -f 1 #iremos coletar os dados antes dos ":"

#pegar apenas o primeiro nome "algoritmos"
ls algoritmos.jpg | awk -F . '{ print $1 }'
ls README.txt | awk -F . '{ print $1 }'

#salvar o resultado do comando em uma variável
$(comando)
imagem_sem_extensao=$(ls $imagem | awk -F . '{ print $1}')
convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png

#verifica se NÃO existe diretório png
if [ ! -d png ]
then
 mkdir png
fi

#? = status de saída
#verifica se status de saída é igual a zero (sucesso)
converte_imagem 2>mensagem_erro.txt
if [ $? -eq 0 ]
 echo "Conversao realizada com sucesso"
else
 echo "Houve uma falha"
fi


Variaveis devem ser declaradas em letras maiúsculas.
Sempre utilizar a variável entre chaves.
Para imprimir o nome do programa sem o "./", devemos utilizar $(basename $0)