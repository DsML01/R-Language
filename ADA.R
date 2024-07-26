#data frames - Planilhas em CSV exportadas pro R.

#Definindo área de trabalho
setwd("C:/Users/davim/Downloads/ExperimentoADA")

#Ler o CSV
df_AnaliseIndividual <- read.csv("ANALISE-INDIVIDUAL.csv")

View(df_AnaliseIndividual)

df_AnaliseIndividual[,4] <- as.numeric(gsub(",", ".", df_AnaliseIndividual[,4]))

submitsBoxPlot <- df_AnaliseIndividual[,4]

submitsBoxPlot

boxplot(submitsBoxPlot, main = "BoxPlot Submits", col = "blue")

df_AnaliseIndividual[,7] <- as.numeric(gsub("," , ".", df_AnaliseIndividual[,7]))

df_AnaliseIndividual[,10] <- as.numeric(gsub("," , ".", df_AnaliseIndividual[,10]))

df_AnaliseIndividual[,13] <- as.numeric(gsub("," , ".", df_AnaliseIndividual[,13]))

mediaGeral <- df_AnaliseIndividual[,7]

mediaMasc <- df_AnaliseIndividual[,10]

mediaFem <- df_AnaliseIndividual[,13]

dados_Boxplot <- data.frame(Geral = mediaGeral, Masculino = mediaMasc, Feminino = mediaFem)

boxplot(dados_Boxplot,
        main = "Medias: Geral e por gênero", 
        col = c("green", "blue", "pink"),
        names = c("Geral", "Masculino", "Feminino"))

#Tabela de frequencia
df_AnaliseIndividual$SOMA...NUM_QUESTOES <- as.numeric(gsub(",", ".", df_AnaliseIndividual[,7]))

submits <- df_AnaliseIndividual$SOMA...NUM_QUESTOES
submits
submits <- sort(submits)
submits
submits <- na.omit(submits)
submits
cuts <- cut(submits, breaks = c(0.00, 0.17, 0.34, 0.51, 0.68, 0.85, 1.00), include.lowest = TRUE, right = FALSE)

frequenciaAbsoluta <- table(cuts)
frequenciaAbsoluta
