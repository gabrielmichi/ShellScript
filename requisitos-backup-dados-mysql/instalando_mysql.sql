$ sudo mysql -u root

create database mutillidae;
use mutillidae
create table produtos(livro VARCHAR(255), autor VARCHAR(255), preco_ebook VARCHAR(255), preco_livro VARCHAR(255));
create table usuarios(nome VARCHAR(255), email VARCHAR(255), telefone VARCHAR(255), cidade VARCHAR(255));

--sair do banco de dados
exit

$ sudo mysql -u root mutillidae < ~/Downloads/mutillidae.sql

$ sudo mysql -u root
use mutillidae
select * from produtos;
select * from usuarios;

--Estaremos restabelecendo os dados presentes no arquivo mutillidae.sql para o banco mutillidae presente no MySQL
$ sudo mysql -u root mutillidae < ~/Downloads/mutillidae.sql

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--Realizando o RESTORE
$ sudo mysql -u root
use mutillidae
delete from produtos;
delete from usuarios;
--Tabelas vazias
select * from usuarios;
select * from produtos;

--restabelecer essas informações no banco
$ sudo mysql -u root mutillidae < ~/backup/mutillidae.sql

--verificar conteudo das tabelas
select * from produtos;
select * from usuarios;