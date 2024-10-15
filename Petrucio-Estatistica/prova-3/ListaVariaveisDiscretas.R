#Comandos R
# d -> calcula a densidade de probabilidade f(x) no ponto;
# p -> calcula a função de probabilidade acumulada F(x) no ponto;
# q -> calcula o quantil correspondente a uma dada probabilidade
#(inversa da função distribuição acumulada);
# r -> retira uma amostra aleatória da distribuição.

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
#(combinalçao de n,k) = choose(n,k)
# n = numero de tentativas
# k = numero de vezes que ocorreu o sucesso
# p = probabilidade de sucesso

#Media = n * p
#var = n * p * q | q = (1 - p)
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

#P = a probabilidade acumulada que queremos testar
#qbinom(P,n,p)

#Ex: Jogamos uma moeda 10 vezes, com 0.5 de P(s) de obter cara
#Queremos saber o número mínimo de sucessos k | a probabilidade
#acumulada de obter até k sucessos seja 90% ou mais.
qbinom(0.9, 10, 0.5)

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
#lambda = 5 -> Frequencia de 1 minuto
#x = 10 -> número de sucessos
#False é basicamente quando queremos 1 - p
ppois(10, 5, FALSE)

#Ex: Num deposito chegam 2,8 caminhoes/hora, determine a probabilidade
#de chegarem 2 ou mais caminhões.
#lambda = 2,8/hora

#a)Em um periodo de 0,5 horas
#Aqui x = 1 para indicar que queremos valores maiores que 1,
#ou seja, pelo menos 2.
ppois(1, 1.4, FALSE)

#b)Em um período de 1 hora
ppois(1, 2.8, FALSE)

#c)Em um período de 2 horas
ppois(1, 5.6, FALSE)

#Ex: A média de alunos aprovados é 23 alunos.
#lambda = 23
#a) Qual P(x = 17)?
dpois(17, 23)

#c) Qual P(x <= 19)?
ppois(19, 23)

#d) Qual P(x > 19)?
ppois(19, 23, FALSE)

#e) Quantidade de aprovados se a probabilidade acumulada
#for de 80%
qpois(p = 0.80, lambda = 23)

#Ex: Numero de afogamentos por fim de semana é de 2 para cada 50k habitantes
#a) Qual P(x = 5 p/ 200k habitantes)
dpois(5, (2/50000) * 200000)

#b) 112.500 habitantes ocorram pelo menos 3 afogamentos?
ppois(2, ((2/50000) * 112500), FALSE)

#Média = lambda
#Variância = lambda
#Desvio padrão = lambda^(1/2)

#------------------------------
#A lista começa aqui

#Questão 1: Em uma rede de computadores, 60% dos dias ocorre alguma falha.
#Construir a distribuição de probabilidades e calcular a esperança para a vari-
#ável aleatória x = 3 dias. Suponha que os eventos são independentes.

#Binomial -> (Combinação de n,K) * p^k * p^(n-k)
#(combinalçao de n,k) = choose(n,k)
# n = numero de tentativas
# k = numero de vezes que ocorreu o sucesso
# p = probabilidade de sucesso

#Media = n * p
#var = n * p * q
#Desvio padrao = (var)^(1/2)

#Comando no R
#dbinom(k, n, p)

#Pelo eventos serem independentes, temos que calcular a chance de ocorrer de 
#0 a 3 erros em um único dia, que é o que esse nosso array com k1 = 0 - 3 .
k1 <- 0:3

n1 <- 3

p1 <- 0.6

resultado1 <- dbinom(k1, n1, p1)
resultado1

#a esperanca da distribuição binomial é n * p
esperanca <- n1 * p1
esperanca

#Questão 2: Em uma fabricação de ceramicas, 12% apresentam defeitos. Utilizando
#dbinom, calcule P em um lote de 40 componentes, encontrar

p2 <- 12/100

#a) Entre 3 a 5 estejam defeituosos
pbinom(5, 40, p2) - pbinom(2, 40, p2)

#b) Pelo menos 2 componentes defeituosos
pbinom(1, 40, p2, F)

#c) No máximo 3 componentes defeituosos
pbinom(3, 40, p2)

#d) Pelo menos 39 componentes de qualidade
pbinom(1, 40, p2)

#e) No máximo 39 componentes de qualidade
pbinom(0, 40, p2, F)

#Questão 3: O corpo de bombeiros tem em média 3 chamadas por dia.
#a) Qual P(x = 4 no dia)
dpois(4, 3)

#b) P(x = 0 no dia)
dpois(0, 3)

#c) P(x = 20 chamadas numa semana)
#new_lambda = 3 * 7 chamadas por semana
dpois(20, 3 * 7)

#Questão 4: Tem-se 15 ações. Ontem, 75% das ações da bolsa caíram de preço.
#Supondo que as ações que perdem valor tem distribuição binomial, calcule.
#a) Quantas ações da carteira se espera que tenham caído de preço?
n4 <- 15; p4 <- 0.75
esperanca4 <- n4 * p4
esperanca4

#b) Qual o desvio padrão das ações da carteira?
q4 <- 1 - p4
dp4 <- sqrt(n4 * p4 * q4)
dp4

#c) Qual a probabilidade que as 15 ações tenham caído?
dbinom(15, 15, p4)

#d) Qual a probabilidade que tenham caído exatamente 10 ações?
dbinom(10, 15, p4)

#e) Qual P(x >= 13)
pbinom(12, 15, p4, F)

#Questão 5: Uma moeda é lançada 6 vezes, encontre a probabilidade de:
#a) Ocorrer 4 coroas.
dbinom(4, 6, 1/2)

#b) Ocorrer pelo menos 2 coroas.
pbinom(1, 6, 1/2, F)

#c) Ocorrer no máximo 3 coroas
pbinom(3, 6, 1/2)

#Questão 6: 