###### Introdução ao Software R #########################

# NÃo usar palavras reservadas:
# break, else, for, function, IF, in, next, repeat, while, FALSE, Inf, NA, NaN, NULL,TRUE ...
# diferença entre letras maiasculas e minusculas 

print ("olá mundo")

m <- 4 * 15
print(m)

5 * 15
m = 5 * 15
m

a <- 2
b <- 4
c <- a * b
d <- a**b
e <- b / a
f <- (b - a) * 50
a;b;c;d;e;f

# TIPOS DE OBJETOS 

# numeric: numerico
# integer: inteiro
# character (string): caracteres
# logical (boolean): logicos (True e False)
# factor: categorias bem definidas. ex: genero (masculino e feminino)
#                                    
y = 2
class(y)

y <- as.integer(y)
class(y)

x = 7.5
class(x)
x <- as.integer(x)
class(x)
x

#  Os objetos da classe character são representados como texto.

caractere <- "palavra"
class(caractere)

logica <- "TRUE"
class(logica)

logica <- TRUE
class(logica)

genero <- c("masculino","feminino")
genero
class(genero)

# Os objetos da classe factor são representados como números inteiros. 
# Usados para representar variáveis categóricas.

genero <- as.factor(genero)
class(genero)

###   ESTRUTURA DOS DADOS - VETORES   ###

vetorx <- c(1, 2, 3, 4, 5, 6, 7)
class(vetorx)
vetorx

dias <- c("segunda", "terça", "quarta", "quinta", "sexta", "sabado", "domingo")
class(dias)
dias

juntando <- c(vetorx, dias)
juntando
class(juntando)

gastos_dia <- c(400, 300, 100, 500, 150, 430, 70)
class(gastos_dia)
length(gastos_dia)

ordem_crescente <- sort(gastos_dia)
ordem_crescente
total <- sum(gastos_dia)  ; total
minimo <- min(gastos_dia) ; minimo
maximo <- max(gastos_dia) ; maximo
media <- mean(gastos_dia) ; media

# ----------- mostrando os resultados na mesma linha -------------

cat ( "Soma dos Gastos =", total," e Média = ", mean(gastos_dia))

cat (total, minimo)

intervalo <- (3:8)
intervalo

passo <- seq(2,42, by = 5)
passo

repeticao <- rep(2,8)
repeticao

repeticao_multipla <- rep(c(3,5),c(4,6))
repeticao_multipla

repeticao_programada <- rep(3:5, each = 3)
repeticao_programada

# --------------- uso de vetores ---------------------

vetor2 <- c(2,4,6,8,10,12)
vetor2
vetor3 <- c(vetor2, 14) # acrescentou 14 ao vetor
vetor3
class(vetor3)

vetor4 <- c(vetor3,"pares")  
vetor4
class(vetor4)  # vetor numerico foi transformado para caracteres

posicao <- vetor2 [2]
posicao

posicao_excluida <- vetor2 [-3]  # retirou o nro. 6
posicao_excluida


###    ESTRUTURA DOS DADOS - MATRIZES    ###

matriz <- matrix(c(4,8,12,16,20,24),nrow=2,ncol=3,byrow=TRUE)
print(matriz)

matriz <- matrix(c(4,8,12,16,20,24),nrow=3,ncol=2,byrow=FALSE)
print(matriz)

matriz [2,2] # elemento (2,2)

vetorA <- c (2, 5, 8)
vetorB <- c (3, 6, 9)
matriz2 <- rbind(vetorA, vetorB)
matriz2

matriz2 [2,1]

matriz3 = matrix(2:9, ncol = 2)
matriz3

# Numero de linhas e colunas.
dim(matriz3)
nrow(matriz3)
ncol(matriz3)

# Nomear linhas e colunas
dimnames(matriz3) <- list(c("Linha1","Linha2","Linha3","Linha4"),
                          c("Coluna1", "Coluna2"))
matriz3

matriz4=matrix(2:13, nrow = 4, byrow=TRUE,
               dimnames = list(c("Linha1","Linha2","Linha3","Linha4"),
                               c("Coluna1", "Coluna2","Coluna3")))
matriz4

# Produto de um numero por uma matriz
produto <- 2 * matriz4
produto

# Soma ou subtração de matrizes
matriz5 = matrix(c(1,5,15,8),nrow=2,ncol=2,byrow=TRUE)
matriz5
matriz6 = matrix(c(2,4,6,10),nrow=2,ncol=2,byrow=TRUE)
matriz6

soma = matriz5+matriz6
soma

subtracao = matriz5-matriz6
subtracao

# Multiplicação Matricial

produto_matriz = matriz5 %*% matriz6
produto_matriz

# Media das linhas ou colunas
matriz5 = matrix(c(1,5,15,8),nrow=2,ncol=2,byrow=TRUE)
matriz5

media_coluna <- colMeans(matriz5)
media_coluna

media_linha <- rowMeans(matriz5)
media_linha

# Soma das linhas ou colunas
soma_linhas <- rowSums(matriz5)
soma_linhas

soma_colunas <- colSums(matriz5)
soma_colunas

# Matriz com caracteres
matriz7 = matrix(c("segunda","terça","quarta","quinta"),nrow=2,ncol=2,byrow=TRUE)
matriz7

###    ESTRUTURA DOS DADOS - LISTAS E DATA FRAME    ###

# É uma tabela de dados onde cada linha representa um registro e as colunas
# representam os atributos ou variaveis. Todos os elementos são vetores e
# precisam ter o mesmo comprimento.

mes_numero <- c(1,2,3,4,5,6,7,8,9,10,11,12)

mes_nome <- c("janeiro","fevereiro","março","abril","maio","junho","julho",
              "agosto","setembro","outubro","novembro","dezembro")

ano <- c(2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021,2021)

dtf <- data.frame(mes_numero,mes_nome,ano)
dtf
 
class(dtf)

# Data Frames pertencentes ao R
df <- mtcars
df

df1 = iris
df1

nrow(df1)
ncol(df1)
dim(df1)
summary(df1)

#-- LISTAS --------------------
# coleção de elementos sem restrições quanto à classe, comprimento 
# ou estrutura de cada elemento

nome <- c("Luciano","Pedro","Joyce", "Maria")
idade <- c(46, 38, 27, 29)
curso <- c("Estatistica", "Linguagem R", "Redes Neurais", "Python")
lista <- list(nome, idade, curso)
print(lista)
class(lista)

lista <- data.frame(nome, idade, curso)
print(lista)
class(lista)

lista2 <- list (nome  = c("Luciano","Pedro","Joyce", "Maria"),
               idade = c(46, 38, 27, 29),
               curso = c("Estatistica","Linguagem R","Python"))

lista2 <- data.frame(lista2) # Erro (arguments differing number of rows: 4, 3)



###    IMPORTAÇÃO DE DATA FRAMES    ###


setwd("C:/Curso R 2023")


# Arquivo txt

df1 <- read.table("Elementos.txt")
df1

# Arquivo csv

df2 <- read.csv("Valores.csv")
df2

df3 <- read.csv("Vestibular.csv")

write.csv (df3, file ="dfwrite.csv")

df4 <- read.csv("dfwrite.csv")


# Arquivo excel.xlsx

install.packages("readxl")
library(readxl)

dfc<- read_xlsx("Cadastro.xlsx")
dfc

###    ESTRUTURA CONDICIONAL - if e else    ###

y <- scan () # forneça 20 ou maior ou menor 

if (y < 20) {print("y é menor que 20!")
} else if (y == 20){
  print("y é igual a 20")
} else {
  print("y é maior que 20")
}

nota <- scan () # informar valor para a media

if (nota >= 6){
  print('Aprovado')
} else if (nota >= 5 & nota< 6){
  print('Recuperação')
} else {
  print('Reprovado')
}

###    ESTRUTURA de REPETIÇÃO : for, while e repeat    ###

for (i in 1:10) {
  print (i)
}

lista <- c(1, 2, 3, 4, 10)
for (numero in lista){
     print(numero * 2)
}

c <- 1
while (c <= 10) {
  s = c + 10
  print(s)
  c = c + 1
}

y <- 2
repeat {
  print (y)
  y <- y+1
  if (y >= 10) break()
}


# -----------------Estatistica Descritiva ----------------------
#
# ---------------- Medidas de Tendência Central----------------- 

datfx = c(100, 120, 110,  90, 150, 145, 149, 165, 150, 144,
          134, 139, 220, 206, 211, 210, 266, 249, 248, 260)

# Cálculo da média
mean(datfx)
# Cálculo da mediana
median(datfx)
# Cálculo da moda
table(datfx) ; subset(table(datfx), table(datfx)==max(table(datfx)))
# Cálculo da máximo e mínimo
max(datfx)   ; min(datfx)


# ---------------Medidas de Dispersão------------------------------

range(datfx)
diff(range(datfx))
amplitude = max(datfx) - min(datfx) ; amplitude

var(datfx)
sd(datfx)

CV = sd(datfx) / mean(datfx)*100 ; CV

descritiva = rbind(Média = mean(datfx),
                   Mediana = median(datfx),
                   Máximo=max(datfx),
                   Mínimo=min(datfx),
                   Amplitude=amplitude,
                   Variância=var(datfx),
                   "Desvio-padrão"=sd(datfx),
                   "CV(%)"=CV)

colnames(descritiva) = 'Estatísticas'
descritiva
