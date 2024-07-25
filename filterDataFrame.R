#data frames - Planilhas em CSV exportadas pro R.

#Definindo área de trabalho
setwd("C:/Users/davim/Downloads/ExperimentoADA")

#Ler o CSV
df_AnaliseIndividual <- read.csv("ANALISE-INDIVIDUAL.csv")

#Visualizar o dataframe
View(df_AnaliseIndividual)

#Aqui eu trago a primeira coluna inteira
df_AnaliseIndividual[1]

#Aqui eu trago a primeira linha inteira
df_AnaliseIndividual[1,]

#Trazendo as colunas 1 até 6
df_AnaliseIndividual[1:6]

#Trazendo todas as colunas, menos a 4
df_AnaliseIndividual[-4]

#Trazendo coluna 1, linha 1
df_AnaliseIndividual[1,1]

#Trazendo as 10 primeiras linhas e as 4 primeiras colunas
df_AnaliseIndividual[1:10,1:4]

#Assim, eu excluiria essa coluna do dataframe
#df_AnaliseIndividual$idproblema <- NULL

#Criando o meu dataframe
idades <- c(20, 28)
nomes <- c("Davi", "Paloma")
#criando o data frame
df <- data.frame(nomes, idades)
View(df)

#Exemplo de IF
if(df$idades[df$nomes == "Davi"] > df$idades[df$nomes == "Paloma"])
{
  "Davi é mais velho"
} else {
  "Paloma é mais velha"
}

idades <- c(20, 28, 21, 24, 20, 18)
nomes <- c("Davi", "Paloma", "Cauet", "Jack", "Iury", "Vieira")
df <- data.frame(nomes, idades)

#Igual o for no python
for(i in idades){
  print(i)
}

x <- 0
for(i in df$idades){
  if(i > x) x <- i
}

df$nomes[df$idades == x]

x <- 0
while(x < 10){
  print(x)
  x <- x + 1
}

y <- 0
x <- 0
cont <- 0
#Pode-se dizer que iniciei uma lista vazia aqui
idades100 <- 0

while(y < 100){
  cont <- cont + 1
  idades100[cont] <- idades[cont]
  x <- x + idades[cont]
  y <- x + idades[cont + 1]
}

idades
idades100
sum(idades100)

idades100[4]

#Aqui ele printa 2 vezes, pois o 20 aparece 2 vezes no array de idade
idades[idades == 20]
