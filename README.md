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

### Arquivo: verificacao-memoria-consumida.sh
- Monitorar consumo de memória do sistema, caso a memória consumida ultrapasse os 50% envia um e-mail para o admin

### Arquivo: backup-dados-mysql.sh
- Pré-requisitos:
    - sudo apt-get install mysql-server -y
    - executar comandos: instalando_mysql.sql
    - executar arquivo: mutillidae.sql
    - executar o script sh como root
- Realizar backup das informações de um usuário e restauras esses dados de backup, caso sejam perdidos.

### Arquivo: backup-amazon.sh
    - Pré-requisitos:
        - Criar bucket "curso-shell-script"
        - Criar IAM -> Users -> Nome (criar_seu_nome_usuario) -> Programmatic Access -> Attach existing policies directly -> s3     (AmazonS3FullAccess)
        - pip install awscli
        - sudo apt install awscli
        - aws configure (configurar: Chave de acesso/key)
        - Permissao: chmod +x backup-amazon.sh
        - sudo crontab -e
        - 14 10 * * * /home/gmichi/Scripts/backup-amazon.sh
    - Realizar backup das tabelas do banco de dados e enviar para um bucket (s3)

### restore_amazon.sh
    - Voltar o restore para banco de dados mysql, pegando de um bucket (s3)
    bash restore_amazon.sh produtos