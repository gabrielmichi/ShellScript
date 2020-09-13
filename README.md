# filtrando-resultado-apache.sh
- Parâmetro de entrada: IP
- Realiza um filtro no arquivo apache-log baseado no endereço do IP informado.
```
$ bash filtrando-resultado-apache.sh $IP
```

# Arquivo: filtro-requisicao.sh
- Realiza um filtro no arquivo, considerando os seguintes parâmetros (GET, POST, PUT e DELETE).
- *considera letras maiusculuas e minusculas no parâmetros, valida se parâmetro não foi preenchido.
```
$ bash filtro-requisicao.sh parametro $REQ
```
