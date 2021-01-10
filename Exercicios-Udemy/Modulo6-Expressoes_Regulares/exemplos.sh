#Tudo que começa com "ma"
grep "^ma" /etc/passwd

#termina com h
grep "h$" /etc/passwd

#Começa com "r", tenha qualquer coisa no meio, termina com "h"
grep "^r.*h$" /etc/passwd

#começa com m, segunda palavra é "a" ou "e"
grep "^m[ae]" /etc/passwd

#NEGATIVA , começa com "m" e a segunda letra não seja "a"
grep "^m[^a]" /etc/passwd

#começa com qualquer letra e a segunda seja "a"
grep "^.[a]" /etc/passwd

#Procura por linhas que tenha entre 50 e 60 digitos
egrep "^.{50,60}$" /etc/passwd

#Tenha mais de 70 digitos
egrep "^.{70,}$" /etc/passwd

#OU, Procura linhas com "gabriel" OU "root"
egrep "gabriel|root" /etc/passwd