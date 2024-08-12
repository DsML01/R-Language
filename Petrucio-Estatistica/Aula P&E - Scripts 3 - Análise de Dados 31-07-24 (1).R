rm(list = ls()) ## Limpar memoria

## pasta a ser utilizada 

setwd("C:\\P&E 2024")

milsa <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

milsa
str(milsa) 

# a) Variavel Qualitativa Nominal

# Frequencia absoluta

civil.tb <- table(milsa$Est.civil)
civil.tb
## Frequencia relativa

prop.table(civil.tb)

# GRAFICO DE Barras
barplot(civil.tb)

barplot(civil.tb, cex.names=1.25, col=c("green","blue"),
        ylab="Número de Funcionários", 
        xlab="Estado civil", cex.axis=1.25,
        main="Proporção entre casados e solteiros",
        cex.lab=0.85,bty="n", ylim=c(0,25))

# GRAFICO DE PIZZA

?pie 

labs<-paste(c("Casados = ", "Solteiros = "),
            round(civil.tb/length(milsa$Est.civil)*100, 
                  digits=2), "%")

pie(civil.tb,labels=labs,col=c("green", "blue"),
    main="Proporção entre casados e solteiros")

#Plotando legenda no canto superior direito

legend("topright", pch=15, col=c("green","blue"), 
       legend=c("Casados", "Solteiros"), 
       cex=1.0, bty="n")

## b) Variavel Qualitativa Ordinal 

## Frequencia absoluta

inst.tb <- table(milsa$Inst)

## Frequencia relativa
prop.table(inst.tb)

## Grafico de Barras

barplot(sort(inst.tb,decreasing = FALSE),
        cex.names=1.15, 
        col=c("green", "blue", "red"),
        ylab="Instrução de Funcionários", 
        xlab="Escolaridade", cex.axis=1.05,
        main="Escolaridade dos Funcionários",
        cex.lab=0.85,bty="n", ylim=c(0,20))

barplot(sort(inst.tb,decreasing = TRUE),
        cex.names=1.15, 
        col=c("green", "blue", "red"),
        ylab="Instrução de Funcionários", 
        xlab="Escolaridade", cex.axis=1.25,
        main="Escolaridade dos Funcionários",
        cex.lab=0.85,bty="n", ylim=c(0,20))

## c) Variavel quantitativa discreta

## Frequencia absoluta

filhos.tb <- table(milsa$Filhos)
milsa$Filhos

plot(filhos.tb, col =  "green", type = "h",
     lwd = 5, cex.lab=1.2,
     main = " Frequencia Absoluta ",
     xlab= "Numero de filhos",
     ylab= "Quantidade de Filhos ") 

plot(filhos.tb, type = "S",col = "red",
     main = "Frequencia relativa acumulada",
     lwd = 5 )

?plot

## Frequencia relativa
filhos.tbr <- prop.table(filhos.tb)

## Frequencia absoluta e relativa acumulada
filhos.tbra <- cumsum(filhos.tbr)
filhos.tba <- cumsum(filhos.tb)

filhosTabResul = cbind(filhos.tb,filhos.tba,
                       filhos.tbr = round(filhos.tbr*100,digits = 2),
                       filhos.tbra= round(filhos.tbra*100,digits = 2))
filhosTabResul

## d) Variavel quantitativa Continua

Salario.tb <- (milsa$Salario)
sort (Salario.tb)
Amplitude <- diff(range(Salario.tb))
NK <-  nclass.Sturges (Salario.tb)
AmpClasse <- round(Amplitude / NK , digits = 1)
limitesclas <- seq (4 , 23.60 , AmpClasse )

classes<-c("04.0 |- 06.8","06.8 |- 09.6","09.6 |- 12.4","12.4 |- 15.2",
           "15.2 |- 18.0","18.0 |- 20.8","20.8 |- 23.6")

Freq = table(cut(Salario.tb, breaks = limitesclas, right=FALSE, 
                 include.lowest = TRUE, labels=classes))

#Freq = table(cut(Salario.tb, breaks = limitesclas, right=FALSE, labels=classes))

FreqAc <- cumsum(Freq); FreqRel <- prop.table(Freq); FreqRelAc <- cumsum(FreqRel)

TabResul = cbind(Freq,FreqAc, FreqRel = round(FreqRel*100,digits = 2),
                 FreqRelAc= round(FreqRelAc*100,digits = 2))
TabResul

# retirar labels e observar os intervalos
Freq = table(cut(Salario.tb, breaks = limitesclas, right=FALSE)) 

FreqAc <- cumsum(Freq); FreqRel <- prop.table(Freq); FreqRelAc <- cumsum(FreqRel)

TabResul = cbind(Freq,FreqAc, FreqRel = round(FreqRel*100,digits = 2),
                 FreqRelAc= round(FreqRelAc*100,digits = 2))
TabResul

h = hist(Salario.tb, breaks=limitesclas,
         ylab="Frequencias absolutas",  labels=classes,main="Histograma", 
         xlim=c(4,25), ylim = c (0,16), col="orange")

lines(c(min(h$breaks), h$mids, max(h$breaks)), 
      c(0,h$counts, 0), type = "l")

## Para variaveis numericas ...

## Mediana
median(milsa$Salario)
## Media
mean(milsa$Salario)
## Quartis
quantile(milsa$Salario)
## Amplitude - diferenca entre maximo e minimo
diff(range(milsa$Salario))
## Variancia
var(milsa$Salario)
## Desvio-padrao
sd(milsa$Salario)
## Coeficiente de variacao
sd(milsa$Salario)/mean(milsa$Salario)
## Quartis
(Salario.qt <- quantile(milsa$Salario))
## Summary() para resumir os dados de uma s? vez
summary(milsa$Salario)

boxplot(milsa$Salario)

boxplot(milsa$Salario,  col = "orange", 
        varwidth = TRUE, notch = TRUE)


#----------------------------- ANALISE BIVARIADA ----------------------------

#a) ------ Variavel Qualitativa X Variavel Qualitativa --------------


inst.civ.tb <- with(milsa,table(Instrucao, Est.civil))
inst.civ.tb

civ.inst.tb <- with(milsa,table(Est.civil, Instrucao))
addmargins(civ.inst.tb)

prop.table(civ.inst.tb)
addmargins(prop.table(civ.inst.tb))

prop.table(civ.inst.tb, margin = 1)

prop.table(civ.inst.tb, margin = 2)

# Estado civil x instrucao 

barplot(civ.inst.tb, main = "Estado Civil x Instrucao",
        col= c("green","blue"), beside = TRUE,
        legend = TRUE,  args.legend = list(x = "topright",
                        bty = "y",ncol = 1))

#  instrucao X Estado civil

barplot(inst.civ.tb, main = "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),
        beside = TRUE,legend = TRUE, 
        args.legend = list(x = "topright",
                           bty = "n", ncol = 1))

#  instrucao X Estado civil na Horizontal 

barplot(inst.civ.tb, main= "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),
        beside = TRUE,legend = TRUE, 
        args.legend = list(x = "topright", bty = "n",
                           ncol = 1), horiz = TRUE)

#  instrucao X Estado civil Agrupado --> beside = FALSE 

barplot(inst.civ.tb, main = "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),legend = TRUE,
        beside = TRUE, 
        args.legend = list(x = "topright",bty = "n",
        inset=c(-0.1, 1.60), ncol = 3), ylim = c (0,15))


# b) Qualitativa vs quantitativa (variaveis Instrucao e Salario) --------

## Quartis de salario

quantile(milsa$Salario)

## Classificacao de acordo com os quartis

salario.cut <- cut(milsa$Salario, breaks =  quantile(milsa$Salario),      
                   include.lowest = TRUE, right = FALSE)

## Tabela de frequencias absolutas
inst.sal.tb <- table(milsa$Instrucao, salario.cut)
inst.sal.tb

barplot(inst.sal.tb, col=c("yellow","red","orange"),
        main= "Salario x Instrucao",
        xlab = "Quantiles", ylab = "Frequencia  Instrucao",
        beside = TRUE, legend = TRUE, 
        args.legend = list(x = "topright",bty = "n",
                           ncol = 1))

boxplot(Salario ~ Instrucao, data = milsa, 
        col=c("yellow", "red", "orange"))  

prop.table(inst.sal.tb)

#c) -- Quantitativa vs Quantitativa (considerar as variaveis Salario e Idade)

Anos.cut <- cut(milsa$Anos, breaks = quantile(milsa$Anos),
                right = FALSE , include.lowest = TRUE)

salario.cut <- cut(milsa$Salario, breaks = quantile(milsa$Salario),
                   right = FALSE, include.lowest = TRUE)
## Tabela cruzada

Anos.sal.tb <- table(Anos.cut, salario.cut)
Anos.sal.tb

## Calculo da Correlacao

cor (milsa$Anos, milsa$Salario) # correlacao

plot(milsa$Anos, milsa$Salario)

plot(x = milsa$Anos, y = milsa$Salario,
     main = " Salario x Anos",
     xlab = "Anos - Variavel preditora", 
     ylab = "Salario - Variavel resposta",
     col = "blue", cex.axis = 0.75, 
     xlim = c(20, 50), ylim = c(0, 25))

abline(lsfit(milsa$Anos, milsa$Salario),col="darkred")

