#A seta atribui um valor para uma variavel
#O = também pode ser usado, mas nao eh o mais recomendado

a <- 10
a

b <- 20
b

b + a -> c
c

d <- c + a
d

e <- 'Davi'
e

#c é uma função que junta as variáveis em um vetor
f <- c(a,b,c,d,e)
f

g <- c(5, 3, 4, 1, 2)
g

g[2]

#Traz alguns dados sobre o vetor que estamos analizando
summary(g)

salario <- 1500
horas <- 160

salario <- 2200
sh <- salario/horas
sh

#printa a variavel arredondada para baixo um float
as.integer(sh)

#printa a variavel arredondada para cima
sh <- round(sh)
sh

opcoes <- c(20, 40, 80, 160, 240)
summary(opcoes)

#transforma em fatores
opcoes <- as.factor(c(20, 40, 80, 160, 240))
summary(opcoes)

#Diz se a varuavel que eu estou trabalhando eh um vetor ou nao
is.vector(opcoes)
#Diz os tipos de dados que estao sendo trabalhados
mode(opcoes)

e <- list("Davi", "Paloma", "8", "Anos", c(0, 8, 16, 24, 32, 40))
e[[5]][4]
