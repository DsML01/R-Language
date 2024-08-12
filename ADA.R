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
cuts <- cut(submits,breaks = c(0.00, 0.17, 0.34, 0.51, 0.68, 0.85, 1.00),include.lowest = TRUE, right = FALSE)

frequenciaAbsoluta <- table(cuts)
frequenciaAbsoluta

frequenciaAbsolutaAcumulada <- cumsum(frequenciaAbsoluta)
#frequenciaAbsolutaAcumulada[7] <- NA
frequenciaAbsolutaAcumulada

frequenciaRelativa <- round(100*prop.table(frequenciaAbsoluta), digits=2)
frequenciaRelativa

frequenciaRelativaAcumulada <- cumsum(frequenciaRelativa)
frequenciaRelativaAcumulada

fi <- c(frequenciaAbsoluta, sum(frequenciaAbsoluta))
Fi <- c(frequenciaAbsolutaAcumulada, NA)
fri <- c(frequenciaRelativa, sum(frequenciaRelativa))
Fri <- c(frequenciaRelativaAcumulada, NA)
names(fi)[7] <- "TOTAL"

#names(Fi)[6] <- "100.00"

tabelaFrequencia <- cbind(fi, Fi, fri, Fri)
tabelaFrequencia

write.table(tabelaFrequencia, file = "tabela_frequencia_media_geral_ADA.csv", sep=";")

#HISTOGRAMAAAAA

submits <- sort(submits)
submits
histograma <- hist(submits,
                   breaks = seq(0, max(submits, na.rm = TRUE) + 0.17, by = 0.17),# Intervalos de 0.17
                   include.lowest = TRUE,
                   right = FALSE,
                   xlim = c(0, 1.02),
                   ylim = c(0, 14),  # Limite do eixo y em 11
                   main = "Histograma de Notas Geral",
                   xlab = "Notas",
                   ylab = "Frequência",
                   col = "green",
                   labels = TRUE,
                   axes = FALSE)
axis(1, at = seq(0, max(submits, na.rm = TRUE) + 0.17, by = 0.17))  # Eixo x de 0 a max(submits) + 0.17 com intervalos de 0.17

axis(2, at = seq(0, 13, by = 1), las = 1)  # Eixo y de 0 a 12 com intervalos de 1 em 1

#HISTOGRAMA COM CONTEXTO E SEM CONTEXTO
# Definindo os vetores para cada linha
linha1 <- c(155, 156, 157, 158, 161, 163, 164, 166, 167, 169, 173, 174, 176, 177, 179, 183, 190)
linha2 <- c(159, 160, 162, 165, 168, 170, 171, 172, 175, 178, 180, 181, 182, 185, 187)

# Determinando o comprimento dos vetores
len1 <- length(linha1)
len2 <- length(linha2)

# Calculando a diferença de comprimento
diff_len <- abs(len1 - len2)

# Preenchendo o menor vetor com NAs
if (len1 < len2) {
  linha1 <- c(linha1, rep(NA, diff_len))
} else if (len2 < len1) {
  linha2 <- c(linha2, rep(NA, diff_len))
}

# Combinando os vetores em uma matriz
matriz <- rbind(linha1, linha2)

# Exibindo a matriz
print(matriz)

m <- df_AnaliseIndividual

neo_vector <- matrix(data = NA, nrow = 2, ncol = 17)
print(neo_vector)
View(neo_vector)

?match

for (j in 1:2) {
  for (i in 1:nrow(df_AnaliseIndividual)) {
    
    if (!is.na(m[i, 7]))
    {
      
      pecheur <- match(m[i, 5], matriz[j, ])
      
      if (!is.na(pecheur))
      {
        na <- which(is.na(neo_vector[j, ]))[1]
        #print(na)
        neo_vector[j, na] <- m[i, 7]
      }
    }
  }
}
#print(neo_vector[1,1])
print(na)


submits <- sort(neo_vector[2,])
submits
histograma <- hist(submits,
                   breaks = seq(0, max(submits, na.rm = TRUE) + 0.17, by = 0.17),# Intervalos de 0.17
                   include.lowest = TRUE,
                   right = FALSE,
                   xlim = c(0, 1.02),
                   ylim = c(0, 8),  # Limite do eixo y em 11
                   main = "Histograma de Notas da Primeira Sessão",
                   xlab = "Notas",
                   ylab = "Frequência",
                   col = "green",
                   labels = TRUE,
                   axes = FALSE)
axis(1, at = seq(0, max(submits, na.rm = TRUE) + 0.17, by = 0.17))  # Eixo x de 0 a max(submits) + 0.17 com intervalos de 0.17

axis(2, at = seq(0, 8, by = 1), las = 1)  # Eixo y de 0 a 12 com intervalos de 1 em 1

#TABELA DE FREQUENCIA

cuts <- cut(submits,breaks = c(0.00, 0.17, 0.34, 0.51, 0.68, 0.85, 1.00),include.lowest = TRUE, right = FALSE)

frequenciaAbsoluta <- table(cuts)
frequenciaAbsoluta

frequenciaAbsolutaAcumulada <- cumsum(frequenciaAbsoluta)
#frequenciaAbsolutaAcumulada[7] <- NA
frequenciaAbsolutaAcumulada

frequenciaRelativa <- round(100*prop.table(frequenciaAbsoluta), digits=2)
frequenciaRelativa

frequenciaRelativaAcumulada <- cumsum(frequenciaRelativa)
frequenciaRelativaAcumulada

fi <- c(frequenciaAbsoluta, sum(frequenciaAbsoluta))
Fi <- c(frequenciaAbsolutaAcumulada, NA)
fri <- c(frequenciaRelativa, sum(frequenciaRelativa))
Fri <- c(frequenciaRelativaAcumulada, NA)
names(fi)[7] <- "TOTAL"

#names(Fi)[6] <- "100.00"

tabelaFrequencia <- cbind(fi, Fi, fri, Fri)
tabelaFrequencia
