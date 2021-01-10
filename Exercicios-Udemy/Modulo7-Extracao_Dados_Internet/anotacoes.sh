#Instalar pacote
sudo apt-get install lynx -y

#ver codigo html da pagina
lynx -source http://globo.com

#extrair titulos da pagina
lynx -source http://lxer.com | grep blurb > titulos.txt

#Pegar trecho do html que começa com "div" e vai até "line"
#remover o trecho do "span" para frente
tail -n 1 titulos.txt | sed 's/<div.*line">//' | sed 's/<\/span.*//'
tail -n 1 titulos.txt | sed 's/<div.*line">//;s/<\/span.*//'