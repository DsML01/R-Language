xx <- 50  # Substitua pelo valor que você estiver usando

# Gerar a sequência de pesos brutos e amostras
pesosb <- seq(1000 - xx, 1000 + xx)
pesosemb <- seq(xx, xx + 50)

# Gerar amostras de pesos brutos e de pesos das embalagens
amostrapb <- sample(pesosb, xx, replace = TRUE)
amostraemb <- sample(pesosemb, xx, replace = TRUE)

# Peso líquido do produto (peso bruto - peso da embalagem)
pesoliquido <- amostrapb - amostraemb

# Calcular média e desvio padrão do peso líquido
media_liquido <- mean(pesoliquido)
dp_liquido <- sd(pesoliquido)

#a)
# Valor de corte para a questão A
valor_corte_a <- media_liquido - (1 + xx/100) * dp_liquido

# Calcular a probabilidade de o peso líquido ser superior ao valor de corte
prob_a <- pnorm(valor_corte_a, mean = media_liquido, sd = dp_liquido, lower.tail = FALSE)
prob_a

#b)
# Limites do intervalo para a questão B
limite_inferior_b <- media_liquido - dp_liquido
limite_superior_b <- media_liquido + 1.2 * dp_liquido

# Calcular a probabilidade de estar dentro do intervalo
prob_b <- pnorm(limite_superior_b, mean = media_liquido, sd = dp_liquido) - 
  pnorm(limite_inferior_b, mean = media_liquido, sd = dp_liquido)
prob_b

#c)
# Percentil de 92%
valor_c <- qnorm(0.92, mean = media_liquido, sd = dp_liquido)
valor_c



#Questão 2: Um tratamento cura media = 64% dos casos. Se o tratamento for aplicado
#a 19 pacientes, qual probabilidade.

#a) De ocorrer 5 curas.
dbinom(5, 19, .64)

#b) Ocorrer no mínimo 9 curas e no máximo 11 curas
pbinom(11, 19, .64) - pbinom(8, 19, .64)

#c) O correr mais que 9 curas
pbinom(9, 19, .64, F)

#Questão 3: O corpo de bombeiros de uma cidade recebe chamadas, com média = 19/10
#chamadas a cada meia hora, 1.9, ou 1.9 * 2 chamadas por hora.

#a) Qual a probabilidade de have 3 chamadas em meia hora?
dpois(3, 1.9)

#b) Qual P(x > 4 em 1 hora?)
ppois(4, 1.9 * 2, F)

#c) Qual o número médio de chamadas por hora?
#1.9 * 2 -> 3.8

#Questão 4: GPT


xx <- 50  # substituir pelo valor real de xx

# Gerar as amostras de pesos
pesosb <- seq(1000 - xx, 1000 + xx)
pesosemb <- seq(xx, xx + 50)
amostrapb <- sample(pesosb, xx, replace = TRUE)
amostraemb <- sample(pesosemb, xx, replace = TRUE)

# Calcular o peso líquido
pesoliquido <- amostrapb - amostraemb

# Calcular a média e desvio padrão do peso líquido
media_liquido <- mean(pesoliquido)
dp_liquido <- sd(pesoliquido)

# Valor de corte para a questão A
valor_corte <- media_liquido - (1 + xx/100) * dp_liquido

# Calcular a probabilidade de o peso líquido ser superior ao valor de corte
prob_a <- pnorm(valor_corte, mean = media_liquido, sd = dp_liquido, lower.tail = FALSE)
prob_a

#b)
# Limites do intervalo
limite_inferior <- media_liquido - dp_liquido
limite_superior <- media_liquido + 1.2 * dp_liquido

# Probabilidade de estar dentro do intervalo
prob_b <- pnorm(limite_superior, mean = media_liquido, sd = dp_liquido) -
  pnorm(limite_inferior, mean = media_liquido, sd = dp_liquido)
prob_b

#c)
# Percentil de 92%
valor_c <- qnorm(0.92, mean = media_liquido, sd = dp_liquido)
valor_c



#Questão 5: As conexões de rede da UFAL atendem os requisitos de um processo de
#Poisson, com média de 19 conexões por hora.

#a) Em 19/10 minutos, qual a probabilidade de não haver conexões?
ppois(0,19/10 * 19/60)

#b) Qual P de que o tempo até a próxima conexão esteja entre 2 e 5 minutos?
#Por se tratar inicialmente de uma questão de poisson, a nossa média não será
#1 / media, mas será a média em si.
pexp(5, (19/60)) - pexp(2, (19/60))


