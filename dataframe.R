#data frames - Planilhas em CSV exportadas pro R.

#Definindo área de trabalho
setwd("C:/Users/davim/Downloads/ExperimentoADA")

#Ler o CSV
df_AnaliseIndividual <- read.csv("ANALISE-INDIVIDUAL.csv")

#Visualizar o dataframe
View(df_AnaliseIndividual)

notas_gerais_questao <- df_AnaliseIndividual[4]
notas_gerais_questao

a <- c(1,2,3,4,5)
#Acessa tudo, menos a posicao 3
a[-3]

#Acessa da posicao 3 até a 5
a[3:5]

#Acessa todos, menos do 3 ao 5
a[-(3:5)]

df_AnaliseIndividual$Nota

notas_gerais_questaoo <- df_AnaliseIndividual$Nota
notas_gerais_questaoo
