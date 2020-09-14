# Códigos Shell Script
Repositório com os códigos Shell Script que eu estou desenvolvendo. <br />
A base destes scripts eu realizei nos cursos de Shell script da Alura e Udemy.

### Arquivo: filtrando-resultado-apache.sh
- Pré-requisito: arquivo apache.log
- Parâmetro de entrada: IP
- Realiza um filtro no arquivo apache-log baseado no endereço do IP informado.
```
$ bash filtrando-resultado-apache.sh $IP
```

### Arquivo: filtro-requisicao.sh
- Pré-requisito: arquivo apache.log
- Realiza um filtro no arquivo, considerando os seguintes parâmetros (GET, POST, PUT e DELETE).
- *considera letras maiúsculuas e minúsculas nos parâmetros e valida se o parâmetro não foi preenchido.
```
$ bash filtro-requisicao.sh $REQ
```

### Arquivo: monitoracao-servidor.sh
- Pré-requisito: 
    - sudo apt-get install apache2 curl ssmtp mailutils
    - arquivo /var/www/html/index.html
    - sudo service apache2 start index.html 
    - configurar o arquivo /etc/ssmtp/ssmtp.conf
- Monitorar servidor, caso encontre problemas reinicia o servidor Apache e enviar e-mail
