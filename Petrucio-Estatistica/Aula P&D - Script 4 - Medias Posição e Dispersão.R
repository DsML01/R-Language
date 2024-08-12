# Media Harmonica e Geometrica

x <- c(45, 36)
mh <- length(x) / sum(1 / x)
print(paste("Média Harmônica:", mh))

x <- c(50, 60)
mh <- length(x) / sum(1 / x)
print(paste("Média Harmônica:", round(mh,4))) 


# Média geométrica

x <- c(10, 60, 360)
media_geometrica <- prod(x)^(1 / length(x))
print(paste("Média Geométrica:", media_geometrica))

x <- c(1, 3, 9, 27)
f <- c(2, 4, 2, 1 )
mg <- (prod(x ^ f)) ^ (1 / sum(f))
print(paste("Média Geométrica:", round(mg,4)))

# --------------- Moda------------------------ 
dfx <- c( 2, 7, 8, 9 , 5, 10 , 22, 14, 14, 12)
freq_dfx <- (table(dfx))
freq_dfx [freq_dfx == max(freq_dfx)]

# -----------Multimodal ----------------------
dfx <- c( 2, 7, 8, 9 , 8, 10 , 2, 14, 14, 12)
freq_dfx <- (table(dfx))
freq_dfx [freq_dfx == max(freq_dfx)]

# ------------ Amodal-----------------------

dfx <- c( 2, 7, 8, 9 , 5, 10 , 22, 14, 15, 12)
freq_dfx <- (table(dfx))
freq_dfx [freq_dfx == max(freq_dfx)]

# ------------ Moda -------------------------
dfx <- c( 2, 7, 8, 9 , 5, 10 , 22, 14, 15, 22)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))

# -------------Multimodal--------------------
dfx <- c( 2, 7, 8, 9 , 8, 10 , 14, 14, 10, 22)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))

# ------------ Amodal-------------------------
dfx <- c( 2, 7, 8, 9 , 5, 10 , 22, 14, 15, 12)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))

# ---------------Desvio Padrão ------------------------

x <- c(10,12,14,16,18)
var(x) ; sd(x)

# ----------- Coeficiente de Variação ------------

#hoteis <- read.csv(file ="C:/P&E 2024/Hoteis.csv",
#                  sep = ";", dec = ".", header = TRUE,
#                  fileEncoding = "UTF-8")

Meses <- c("Jan","Fev","Mar","Abr","Mai","Jun", "Jul","Ago","Set")
Hotel.A <- c(760, 690, 380, 280, 320, 300, 710, 270, 360)
Hotel.B <- c(420, 450, 510, 460, 470, 440, 480, 430, 410)

hoteis <- data.frame (Meses, Hotel.A, Hotel.B)

str(hoteis)

mean(hoteis$Hotel.A); mean(hoteis$Hotel.B)
var(hoteis$Hotel.A); var(hoteis$Hotel.B)
sd(hoteis$Hotel.A); sd(hoteis$Hotel.B)

sd(hoteis$Hotel.A)/mean(hoteis$Hotel.A) * 100
sd(hoteis$Hotel.B)/mean(hoteis$Hotel.B) * 100


# ---------------- Assimetria ---------------------

install.packages("e1071")
library(e1071)

Asspp <- c( 3,4,5,5,6,6,6,6,6,6,6,7,7,8,9)

h = hist(Asspp)

assimetria <- skewness(Asspp)
assimetria

Asserq <- c( 2,6,7,8,8,17,18,16,11,11,
             13,14,16,17,15,17,20,21,22)

h = hist(Asserq,main="Histograma Assimétrico à Esquerda")

assimetria <- skewness(Asserq)
assimetria

mean(Asserq)
median(Asserq)
Ap2 = (mean(Asserq) - median(Asserq)) / sd(Asserq)
Ap2

assimetria <- skewness(Asserq)
assimetria

boxplot(Asserq, horizontal = TRUE)

Assdir <- c(2,4,5,6,7,8,8,9,9,10,10,10,
            11,12,13,13,15,19,20,22)

h = hist(Assdir,main="Histograma Assimétrico à Direita")

mean(Assdir)
median(Assdir)

Ap2 = (mean(Assdir) - median(Assdir)) / sd(Assdir)
Ap2

assimetria <- skewness(Assdir)
assimetria

boxplot(Assdir, horizontal = TRUE)


# Assimetria  ... outros exemplos 

set.seed(123)  
dados <- c(rnorm(100, mean = 5, sd = 1))
h = hist(dados)

mean(dados)
median(dados)
Ap2 = (mean(dados) - median(dados)) / sd(dados)
Ap2
assimetria <- skewness(dados)
assimetria


dados <- rnorm(1000, mean = 7.5, sd = 2.5)
h = hist(dados)

mean(dados)
median(dados)
Ap2 = (mean(dados) - median(dados)) / sd(dados)
Ap2
assimetria <- skewness(dados)
assimetria


# -------------Outras Assimetrias ----------------

# Gerar n notas aleatórias 

numnotas = scan()

dados <- runif(numnotas, min = 4, max = 10)
 
hist(dados)

# Calcular média, mediana e desvio padrão
media <- mean(dados)
mediana <- median(dados)
desvio_padrao <- sd(dados)

# Calcular os quartis
Q1 <- quantile(dados, 0.25)
Q2 <- quantile(dados, 0.50)
Q3 <- quantile(dados, 0.75)

# Coef. Assimetria de Pearson (Primeira Fórmula)
assimetria_pearson1 <- (media - mediana) / desvio_padrao

# Coef. Assimetria de Pearson (Segunda Fórmula)
assimetria_pearson2 <- 3 * (media - mediana) / desvio_padrao

# Coef. Assimetria de Bowley
assimetria_bowley <- (Q3 + Q1 - 2 * Q2) / (Q3 - Q1)

# Coef. Assimetria usando a função skewness() do pacote e1071
assimetria_e1071 <- skewness(dados)

# Exibindo os resultados

print(paste("Coef. Assimetria de Pearson (Primeira Fórmula):", assimetria_pearson1))
print(paste("Coef. Assimetria de Pearson (Segunda Fórmula):", assimetria_pearson2))
print(paste("Coef. Assimetria de Bowley:", assimetria_bowley))
print(paste("Coef. Assimetria calculado pelo pacote e1071:", assimetria_e1071))



