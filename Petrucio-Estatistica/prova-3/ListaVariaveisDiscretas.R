#Distribuicoes discretas

#Uniforme
  #Esperanca = (b + a)/2 | a < b
  #Variancia = [(b - a + 1)^2 - 1]/12
  #Desvio Padrao = (Variancia)^(1/2)
  #Tambem temos acumulado na uniforme
  #P(X < n) = P(1) + ... + P(n) || P(x < n) P(1) * (n - 1)


#Bernoulli - Taxa de sucesso P(S) || Taxa de fracasso P(F)
  #P(S) + P(F) = 1
  
  #Esperança = P(S)
  #Variancia = P(S) + P(F)

#Binomial -> (Combinação de n,K) * p^k * p^(n-k)
# n = numero de tentativas
# k = numero de vezes que ocorreu o sucesso
# p = probabilidade de sucesso

#Media = n * p
#var = n * p * q
#Desvio padrao = (var)^(1/2)

#Comando no R
  #dbinom(k, n, p)

  #Ex: Prova com 4 questões e 5 alternativas, qual P de acertar 
#3 das 4 questões dadas?

dbinom(3, 4, 1/5)

  #Ex: Voo diario com chance de turbulencia de 0,4. Em uma semana de voo,
#qual a chance de ter turbulencia em pelo menos 3 deles?
#de 3 a 7 turbulencias.
#Acumulativa, ou seja, pbinom(k, n, p)

1 - pbinom(2, 7, 0.4)
pbinom(2, 7, 0.4, FALSE) #Quando eu quero saber P(x >= k)

  #Ex: Vasco e botafogo jogam 6 vezes, as chances do vasco vencer é 1/3.
#Qual p do vasco ganhar no máximo 2 partidas?
pbinom(2, 6, 1/3)

#Plot das taxas de sucesso do vasco e das taxas de sucesso acumuladas

x <- numeric()
y <- numeric()
for(i in 1:7) x[i] <- c (dbinom(i - 1, 6, 1/3))
x <- dbinom(0:6, 6, 1/3)

for(i in 1:7) y[i] <- c (pbinom(i - 1, 6, 1/3))
y <- pbinom(0:6, 6, 1/3)

barplot(x, col=1:7, main="Binomial")
barplot(y, col=1:7, main=" Binomial Acumulada ")

#Poisson - Usada para modelar a ocorrencia de eventos discretos
#dentro de um intervalo de tempo ou espaço.

#P(X) = (e^lambda * lambda^x)*(x!)

#lambda = taxa média de sucessos | lambda > 0
#x = número de sucessos
#e = 2,7182

  #Ex: Numa central telefonica chegam 300 telefonemas por hora.
#a) Qual a p de num minuto não chegar nenhuma chamada?
  #lambda = 300/h || 300/60 = 5/min.
  #x = 0.
  #[e^(-5)*5^0] * 0! -> Em código, dpois(x, lambda) ->
dpois(0, 5)

#b) Em 2 minutos haja 2 chamadas
  #lambda = 10
  #x = 2
dpois(2, 10)

#c) Qual P(x) da capacidade da mesa ser ultrapassada, sabendo
#que a capacidade da mesma eh 10/min
FALTA RESPONDER


