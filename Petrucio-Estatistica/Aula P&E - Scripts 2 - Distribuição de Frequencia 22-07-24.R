# ----------------------------
## Distribuição de Frequência
# ----------------------------

rm(list = ls()) ## Limpar variaveis

## Valores Pontuais 

## Exemplo 1.

# 8.5  7.5  9.0  7.5  5.5  9.5  10  8.5  6.0  6.0  6.5  4.5  10  6.5  9.0  6.5

Notas <- scan()  ## copiar/colar os dados acima.

## ou definir direto no dataframe

Notas1 <- c (8.5, 7.5, 9.0, 7.5, 5.5, 9.5, 10, 8.5,
           6.0, 6.0, 6.5, 4.5, 10, 6.5, 9.0, 6.5)

Freq <- table (Notas)
FreqAc <- cumsum(Freq)
FreqRel <- prop.table (Freq)
FreqRelAc <- cumsum (FreqRel)


TabResul <- cbind (Freq,
                  FreqAc,
                  FreqRel = round (FreqRel*100, digits = 2),
                  FreqRelAc = round (FreqRelAc*100, digits =2))
TabResul

## Exemplo 2. 


## Lendo do arquivo .csv 

rm(list = ls())

setwd("C:\\P&E 2024") 
# ou no Rstudio-Session-Set Working Directory-Choose Directory

Estadoc <- read.csv("Estadocivil.csv", header = TRUE,
                    sep = ",", dec = ".")

str(Estadoc)

# Outra opção ...
# Importando dados pelo RStudio --> File  Import Dataset From Text(base)

Estadoc <- Estadocivil

# Outra opçao ... Ler da area de transferencia do Windows

rm(list = ls())

Estadoc <- read.table(file = "clipboard", sep = "\t", header=TRUE, dec=",")

## Observar o dataframe criado.

# outra alternativa ... Ler arquivo Excel

rm(list = ls())
install.packages("readxl")
library("readxl")

Estadoc <- read_excel("EstadocivilExcel.xlsx")


# Mais outra alternativa ... Lendo atraves da Tela 

Estadoc <- scan(what = "character")

Freq <- table (Estadoc)
FreqAc <- cumsum(Freq)
FreqRel <- prop.table (Freq)
FreqRelAc <- cumsum (FreqRel)
TabResul = cbind (Freq,
                  FreqAc,
                  FreqRel = round (FreqRel*100, digits = 2),
                  FreqRelAc = round (FreqRelAc*100, digits =2))
TabResul

bar_pos <- barplot(Freq, 
                   col = c ("Yellow", "Orange", "Green", "Blue"), 
                   main = "Distribuição do Estado Civil",
                   xlab = "Estado Civil",
                   ylab = "Quantidade", 
                   ylim = c(0, max(Freq) + 6)) # Adicionando rótulos aos valores

# colocando valores das frequencias no gráfico
text(x = bar_pos, 
     y = Freq, 
     labels = Freq, 
     pos = 3,        # pos = 3 significa acima das barras
     cex = 0.8,      # Tamanho do texto
     col = "black")  # Cor do texto 

# ------------------
# Gráfico de pizza

# Cores para as fatias

cores <- rainbow(length(Freq)) 

cores <- c ("Yellow","Orange","Green","Blue") # ou definir as cores

pie(Freq, col = cores, 
    main = "Gráfico de Pizza - Estado Civil")

# ------------------
## Valores Agrupados
# ------------------

## Exemplo 1 - Bicicletas

rm(list = ls())

setwd("C:\\P&E 2024")

Producao <- read.csv("Bicicleta.csv", header = TRUE,
                    sep = ",", dec = ".")
str(Producao)

hist(Producao$Bike) # Histograma

# Valores do objeto Histograma

Reshist <- hist(Producao$Bike)
Reshist

# Agrupando os valores em Classes 

range(Producao$Bike)

Amplitude = diff (range(Producao$Bike))

Nclasses <- nclass.Sturges(Producao$Bike)

AmpClasse <- round (Amplitude / Nclasses)

limitesclas <- seq (230 , 370 , AmpClasse )

classes<-c("230 |- 250","250 |- 270","270 |- 290","290 |- 310",
           "310 |- 330","330 |- 350","350 |- 370")

Freq = table(cut(Producao$Bike, breaks = limitesclas, right=FALSE, 
                labels=classes))

FreqAc <- cumsum(Freq); 
FreqRel <- prop.table(Freq); 
FreqRelAc <- cumsum(FreqRel)

TabResul = cbind(Freq,
                 FreqAc, 
                 FreqRel = round(FreqRel*100,digits = 2),
                 FreqRelAc= round(FreqRelAc*100,digits = 2))
TabResul

h = hist(Producao$Bike, breaks=limitesclas,
    ylab="Frequencias absolutas", 
    xlab= "Bicicletas Produzidas",labels=classes,
    main="Histograma", col="orange", 
    xlim=c(220,380), ylim = c (0, max(Freq) + 5))

lines(c(min(h$breaks), h$mids, max(h$breaks)), 
       c(0,h$counts, 0), type = "l")

boxplot(Producao, col = "red")

boxplot(Producao, col = "Orange", varwidth = TRUE, notch = TRUE) 


## Exemplo 2 - IMC

setwd("C:\\P&E 2024")

IMC <- read.csv("IMCvalores.csv", header = TRUE,
                     sep = ";", dec = ",")

attach(IMC)

hist(IMCplan)

Reshist <- hist(IMCplan)
Reshist

Amplitude <- diff( range(IMCplan)) 

Nclasses <- nclass.Sturges(IMCplan)

AmpClasse <- round (Amplitude / Nclasses)
range(IMCplan)

limitesclas <- seq( 15.68, 33.68, AmpClasse )

classes<-c("15.68 |- 18.68", "18.68 |- 21.68", "21.68 |- 24.68", "24.68 |- 27.68",
           "27.68 |- 30.68", "30.68 |- 33.68")

Freq = table(cut(IMCplan, breaks = limitesclas, right=FALSE, labels=classes))
FreqAc <- cumsum(Freq)
FreqRel <- prop.table(Freq)
FreqRelAc <- cumsum(FreqRel)

TabResul = cbind(Freq,FreqAc,FreqRel=round(FreqRel*100,digits = 2),
                 FreqRelAc= round(FreqRelAc*100,digits = 2))
TabResul

h = hist(IMCplan, breaks = limitesclas, labels = classes,
         col="orange", xlim=c(15, 35), ylim = c (0,10),
         ylab="Frequencias absolutas", main="Histograma")


lines(c(min(h$breaks), h$mids, max(h$breaks)), 
      c(0,h$counts, 0), type = "l")

boxplot(IMC, col = "red")

boxplot(IMC,  col = "orange", varwidth = TRUE, notch = TRUE)


## ---Exemplo 3. IMC com CLASSES DESIGUAIS ---------------------------

setwd("C:\\P&E 2024")

IMC <- read.table ("IMCvalores.csv", header = TRUE, sep = ";" , dec=",")

limitesclas <- c(14, 18.4, 24.9, 29.9, 40)

classes<-c(" Abaixo [14,0 |-- 18,4)", " Normal [18,4 |-- 24,9)", 
           " Acima  [24,9 |-- 29,9)", " Obeso  [29,9 |-- 40,0)")

Freq = table(cut(IMC$IMCplan, breaks = limitesclas, right=FALSE,
                 labels=classes, include.lowest = TRUE))

FreqRel <- prop.table(Freq)
FreqAc <- cumsum(Freq)
FreqRelAc <- cumsum(FreqRel)
difclas <- diff(limitesclas)

TabResul = cbind(Freq,FreqRel = round(FreqRel*100,digits = 2), 
           FreqAc = round(FreqAc ,digits = 2),
           FreqRelAc = round(FreqRelAc*100,digits = 2),
           difclas, densidade = round(FreqRel/difclas,digits = 4))
TabResul

hist(IMC$IMCplan, breaks = limitesclas, labels = classes, col="green",
     xlim=c(15, 40), ylim = c (0,0.10),  
     xlab = "IMCs", main="Histograma - IMC ")

# --- Exemplo 4 -  usando os QUARTIS COMO CLASSES -----------------------

setwd("C:\\P&E 2024")

IMC <- read.table ("IMCvalores.csv", header = TRUE, sep = ";" , dec=",")

limitesclas <- quantile(round(IMC$IMCplan, digits = 4))

classes<-c(" 0 a 25 % "," 25 a 50 %)"," 50 a 75 % "," 75 a 100 %")

Freq.IMC.cut <- table( cut (IMC$IMCplan, breaks = limitesclas, 
                       right = FALSE, include.lowest = TRUE))  

FreqAc <- cumsum(Freq.IMC.cut)
FreqRel <- prop.table(Freq.IMC.cut)
difclas <- diff(limitesclas)
TabResul = cbind(Freq.IMC.cut, FreqAc, 
                 FreqRel = round(FreqRel,digits = 2),difclas,
                 densidade= round(FreqRel/difclas,digits = 4))
TabResul

h = hist(IMC$IMCplan, breaks = quantile(IMC$IMCplan), 
         col="orange", main="Histograma", xlim=c(15, 35),
         ylim = c (0,0.14), labels = classes, xlab = "IMC")


# --- Exemplo 4.1 -  usando os QUARTIS COMO CLASSES -----------------------
# incluindo labels para as classes 

setwd("C:\\P&E 2024")

IMC <- read.table ("IMCvalores.csv", header = TRUE, sep = ";" , dec=",")

limitesclas <- quantile(IMC$IMCplan)

classes<-c(" Até Q1", " Entre (Q1 e Q2)", 
           " Entre (Q2 e Q3)", " Supeior a Q3")
Freq.IMC.cut <- table( cut (IMC$IMCplan, breaks = limitesclas, right = FALSE,
                            labels = classes,include.lowest = TRUE))  

FreqAc <- cumsum(Freq.IMC.cut)
FreqRel <- prop.table(Freq.IMC.cut)
difclas <- diff(limitesclas)
TabResul = cbind(Freq.IMC.cut, FreqAc, 
                 FreqRel = round(FreqRel,digits = 2),difclas,
                 densidade= round(FreqRel/difclas,digits = 4))
TabResul

h = hist(IMC$IMCplan, breaks = quantile(IMC$IMCplan), labels = classes, 
         col="orange", main="Histograma", xlim=c(15, 35),
         ylim = c (0,0.14), xlab = "IMC")

# ------------------------------------------------------------
# Utilizando o histograma 
#
altura = c(1.30, 1.33, 1.40, 1.42, 1.45, 1.50, 1.50, 1.52, 1.55,
           1.56, 1.58, 1.60, 1.62, 1.64, 1.65, 1.67, 1.68, 1.68,
           1.70, 1.72, 1.72, 1.74, 1.80, 1.83, 1.85)

h <- hist(altura, labels = TRUE)

h <- hist(altura, freq = FALSE, labels = TRUE) 
h

par(mfrow = c (1,2))

h <- hist(altura, breaks = c (1.3, 1.5, 1.7, 1.9))


h <- hist(altura, breaks = c (1.3, 1.5, 1.7, 1.8, 1.9))

h <- hist(altura, breaks = c (1.3, 1.5, 1.7, 1.9), 
          col = c("violet", "yellow" , "Orange" ),
          labels = TRUE, ylim = c (0,20))

hist(altura, breaks = c (1.3, 1.5, 1.6, 1.8, 1.9), 
     col= c("violet"))

par (mfrow = c (1,1))

h <- hist(altura,  
          main = "Altura dos alunos do Ensino Médio", 
          xlab = "Altura dos alunos", ylab = "Freq. Absoluta", 
          col = c("violet"), border = FALSE, 
          xlim = c(1.2,2), ylim = c(0,9),
          labels = TRUE)

lines(c(min(h$breaks), h$mids, max(h$breaks)), 
      c(0,h$counts, 0), type = "l")


limitesclas <- seq( 1.30, 1.90, 0.1 )

classes<-c("1.30 |- 1.40", "1.40 |- 1.50", "1.50 |- 1.60", "1.60 |- 1.70",
           "1,70 |- 1.80", "1.80 |- 1.90")

Freq = table(cut(altura, breaks = limitesclas, right=FALSE, labels=classes))
FreqAc <- cumsum(Freq)
FreqRel <- prop.table(Freq)
FreqRelAc <- cumsum(FreqRel)

TabResul = cbind(Freq,FreqAc,FreqRel=round(FreqRel*100,digits = 2),
                 FreqRelAc= round(FreqRelAc*100,digits = 2))
TabResul

h <- hist(altura,  
          main = "Altura dos alunos do 1? ano do Ensino M?dio", 
          xlab = "Altura dos alunos", ylab = "Freq. Absoluta", 
          col = c("violet"), border = FALSE, 
          xlim = c(1.3,1.9), ylim = c(0,9),
          labels = TRUE)

lines(c(min(h$breaks), h$mids, max(h$breaks)), 
      c(0,h$counts, 0), type = "l", col = ("red"))





