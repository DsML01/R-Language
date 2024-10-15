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

#Distribuicoes continuas

#Distribuicao uniforme continua
#Esperança = (b + a)/2
#Variancia = [(b - a)^2]/12
#Desvio padrao = variancia^(1/2)
#Distribuicao acumulativa = [x/(b-a)] - [a/(b-a)] | a <= x <= b

#Ex: Uma máquina envasa detergente líquido de forma que o volume
#tem distribuição Uniforme Contínua com 4900 ≤ y ≤ 5050 ml.

#a) Qual a media e variancia do volume de detergente?
Media <- (5050+4900)/2 
Variancia <- ((5050-4900)^2)/12

#b) Qual a proporção de embalagens com menos de 5000ml?
#punif(x, min, max)
# x = numero que queremos saber a porcentagem
# min e max = Minimo e maximo 
punif(5000, 4900, 5050)

#Ex: Min 5, Max 10, calcular:
#a)P(X < 7)
punif(7, 5, 10)

#b)P(X > 8.5)
punif(8.5, 5, 10, FALSE)

#c) P(8 < x < 9)
punif(9, 5, 10) - punif(8, 5, 10)

#Ex: Latas de coca-cola são enchidas num processo automático segundo uma
#distribuição uniforme no intervalo (em ml) [345,355].

#c) Qualquer lata com volume 4 ml abaixo da média pode gerar
#reclamação do consumidor e com volume 4 ml acima da média pode
#transbordar no momento de abertura, devido à pressão interna. Qual é
#a proporção de latas problemáticas?
punif(346,345, 355) + punif(354, 345, 355, F) #F = FALSE

#Distribuiçãp normal
# u = média
# o = desvio padrão
# x = O valor que queremos saber a porcentagem

#pnorm(x, u, o)

#Ex: Se dissermos que a altura média do homem brasileiro adulto é de 1,70 m, e
#desvio padrão é de 5 cm, estaremos dizendo:

#a) Calcule a % de homens com a altura entre 165 e 175.
pnorm(175, 170, 5) - pnorm(165, 170, 5)

#Ex: Os resultados do experimento ormam uma VA com distribuição normal,
#com média de 40 e desvio padrão de 10
#a) Qual P(x <= 50)
pnorm(50, 40, 10)
  #Caso eu tenha o Z ao invés dos dados, posso fazer
pnorm(1) #Vai me gerar o mesmo resultado.

#Plotando o gráfico dessa questão
x <- seq(5, 75) #Eixo X de 5 
y <- dnorm(x, 40, 10) #Calcula a densidade para cada valor de x
#usando a distribuição normal com esses parametros
plot(x, y, type = "l") #plota a função de densidade normal como uma linha 
#(indicada pelo argumento type = "l").
i <- x <= 50
polygon(c(0,x[i],50), c(0,y[i],0), col="red") 
#Nas 2 linhas acima estamos destacando x <= 50
p <- pnorm(q = 50, mean = 40, sd = 10)
text(40, 0.02, round(p, digits = 5))#Plotando o texto no gráfico
#text(x, y, o que será printado e casas decimais)

#b) Qual P(x >= 35)
pnorm(35, 40, 10, F)

#c) Qual P(25 >= x <= 60)
pnorm(60, 40, 10) - pnorm(25, 40, 10)

#Plot de gráfico
x <- seq(5, 75)
y <- dnorm(x, 40, 10)
plot(x, y, type = "l")
i <- x >= 25 & x <= 60
polygon(c(25, x[i], 60), c(0, y[i], 0), col="yellow")
p <- pnorm(q = 60, mean = 40, sd = 10) - pnorm(q = 25, mean = 40, sd = 10)
text(40, 0.015, round(p, digits = 5))

#d) Qual P(x <= 30 & x >= 55)
pnorm(30, 40, 10) + pnorm(55, 40, 10, F)

x <-seq(5, 75)
y <- dnorm(x, 40, 10)
plot(x, y, type="l")
i1 <- x <= 30
i2 <- x >=55
polygon(c(0, x[i1], 30), c(0, y[i1], 0), col="red")
polygon(c(55, x[i2], 75), c(0, y[i2], 0), col="red")
p1 <- pnorm(30, 40, 10)
p2 <- pnorm(55, 40, 10, F)
text(20, 0.01, round(p1, digits = 4))
text(60, 0.01, round(p2, digits = 4))

#Ex: Durabilidade de um pneu é a distribuição normal
#com media = 60000km e dp = 10000km

#a) Qual P(x > 75000)?
pnorm(75000, 60000, 10000, F)

#se ele desse o z, que era z = 1,5
#Como queremos saber x > 75k, utilizaremos lower.tail
#Ou seja, o nosso Z terá sinal invertido
pnorm(-1.5)

#b) Qual P(50000 >= x >= 70000)
pnorm(70000, 60000, 10000) - pnorm(50000, 60000, 10000)

#d) Qual P(x = 70000)
#P(X = 70000) = 0
#Isso ocorre porque, em distribuições contínuas, a probabilidade associada a um
#único ponto é infinitesimalmente pequena (tende a zero).

#e) De quantos km precisamos para que somente 1% dos pneus sejam selecionados?
#P(X < x) = 0.01
#qnorm(p, media, dp) -> Descobrir o número que representa a uma probabilidade
#p = a probabilidade que queremos achar o número que a representa
qnorm(.01, 60000, 10000)

#Ex: Suponha que as amplitudes de vida de dois aparelhos
#elétricos, D1 e D2, tenham distribuições N(42, 6^2) e N(45, 3^2)
#respectivamente. Se os aparelhos são feitos para ser usados por um período de 45 horas, responda.

#a) Qual aparelho deverá ser escolhido?
a1 <- pnorm(45, 42, 6, F)
a2 <- pnorm(45, 45, 3, F)
a1;a2
#a1 = .69 e a2 = .5
#Logo, a resposta é aparelho 1

#b) E se for por um período de 49 horas?
pnorm(49, 42, 6, F)
pnorm(49, 45, 3, F)

#Ex: O diametro do eixo principal de um disco rigido tem distribuição normal
#com media = 25.08 e dp = 0.05. Se as especificações para esse eixo
#são 25 +- 0.15, determine o percentual de unidades em conformidade.

pnorm(25.15, 25.08, 0.05) - pnorm(24.85, 25.08, 0.05)

#Ex: A nota de estatistica se distribui normalmente com media = 6.4
#e dp = 0.8. Em uma sala com 80 alunos, quantos terão?

#a) Nota < 5
p = pnorm(5, 6.4, 0.8)
p * 80

#b) 5 >= nota >= 7.5
(pnorm(7.5, 6.4, 0.8) - pnorm(5, 6.4, 0.8)) * 80

#c) nota >7.5
pnorm(7.5, 6.4, 0.8, F) * 80

#Ex: A VA "Retornos do contrato futuro de soja na bolsa de Chicago"
#(100 retornos) possui distribuição normal com media = 0.18 % ao dia
#e dp = 1.17% ao dia.

#a) qual P((0.18/100) >= retorno >= (2/100)) por dia?

pnorm(2/100, 0.18/100, 1.17/100) - pnorm(0.18/100, 0.18/100, 1.17/100)

#b) Qual P(retorno > 2/100)
pnorm(2/100, 0.18/100, 1.17/100, F)

#Ex:Uma cidade tem media = 170cm de altura dos jovens, com variancia = 36cm^2.

#a) Qual P(x > 179cm) ?
#Se variancia é 36cm^2, dp = 36^(1/2) -> dp = 6cm

pnorm(179, 170, 6, F)

#b) Qual altura que a probabilidade de encontrarmos valores menores que ela
#seja 80%?
qnorm(.8, 170, 6)

#Ex: O tempo gasto no vestibular tem média = 120min e
#dp = 15min

#a) Qual P(x < 100 min)?
pnorm(100, 120, 15)

#b) Qual P(x) | 95% terminem no prazo estibulado?
#Tenho porcentagem
qnorm(.95, 120, 15)

#N(220, 16)
#Ou seja, media = 220, dp = 16^(1/2) -> 4
#a) P(X <= k) = 0.01
qnorm(.01, 220, 4)

#Combinação linear de distribuições normais

#Em uma empresa, a montagem de uma peça é feita em duas etapas
#Os tempos são independentes e tem as seguintes distribuições
#x1 = N(75 seg, 16,81 seg^2)
#x2 = N(129 seg, 106,09 seg^2)

#Para responder essa questão, precisamos recalcular a média
#e o dp.

# E(X) = 75 + 129 = 204
# DP = (16,81 + 106,06)^(1/2) = (122,90)^(1/2) -> 11.08

#a) Qual P(x < 200)
pnorm(200, 204, 11.08)

#Máquina enche latas baseada em pesos brutos. O peso bruto
#tem distribuição normal com media = 1000g e dp = 20g
#As latas tem peso bruto com media = 90g e dp = 10g

#E(x) = 1000 - 90 = 910
#dp = (20^2 + 10^2)^(1/2) = 500^(1/2) = 22.36

#a) P(x < 850g)
pnorm(850, 910, 22.36)

#b) P(x > 870g)
pnorm(870, 910, 22.36, F)

#c) P(860 <= x <= 920)
pnorm(920, 910, 22.36) - pnorm(860, 910, 22.36)

#Um elevador tem resistencia em distribuição normal com média de 300kg e dp = 10kg
#Se a carga supera a resistencia um freio é acionado.
#Numa viagem com 4 pessoas, elas tem media = 70kg e dp = 13kg

#media 4 pessoas = 70 * 4 = 280
#dp 4 pessoas = (13^2 * 4)^(1/2) = 676^(1/2) = 26kg

#Nova media = 300 - 280
#Nova dp = (13^2 + 26^2)^(1/2) = 776^(1/2) = 27.86kg

#a) Qual P de usar p freio de emergencia? P(T < 0)
pnorm(0, 20, 27.86)

#Distribuição exponencial
#Utilizada para modelar uma variedade de fenômenos aleatórios
#relacionados a tempos de espera entre eventos

#lambda = Taxa de eventos por unidade de tempo
#x = unidade de medida de tempo que queremos saber a porcentagem
#da ocorrencia

#Função densidade de probabilidade
#fx(x) = lambda * e^(-lambda * e)

#Esperança = 1/lambda
#Variancia = 1/(lambda)^2

#Função de distribuição cumilativa
#P(X <= x) = 1 - e^(-lambda * x) | x >= 0 & lambda > 0

#Ex: A duração de um telefonema, em minutos, seja a variavel aleatoria
#exponencial com lambda = 1/5. Se alguém chegou antes de você.
#a) Qual P(x = 5)?
dexp(5, 1/5)

#b) Qual P(x <= 5)?
pexp(5, 1/5)

#c) Qual P(x > 5)?
pexp(5, 1/5, F)

#d) Qual P(5 >= x >= 7)?
pexp(7, 1/5) - pexp(5, 1/5)

#Ex: O tempo de espera de um exame tem distribuição exponencial
#com média = 3 dias.
#a) Qual a P(x > 2 dias)?

#Se a esperança é de 3 dias, lambda = 1/3, então.
pexp(2, 1/3, F)

#b) Qual P(2 >= x >= 4)?
pexp(4, 1/3) - pexp(2, 1/3)

#Ex: Sabendo que lambda = 2, determine:
#a) P(x <= 0)
pexp(0, 2)

#b) P(x <= 1)
pexp(1, 2)

#c) P(x >= 2)
pexp(2, 2, F)

#d) P(1 < x < 2)
pexp(2, 2) - pexp(1, 2)

#e) P(X < x) = 0.05
#Para esse, precisamos usar o qexp
#Calcula o quantil correspondente a uma dada probabilidade
qexp(0.05, 2)

#Ex: Uma companhia fabrica lampadas especiais com uma duração média
#de 100 horas e com distribuição exponencial.

#a) Qual deve ser a garantia do fabricante para repor
#apenas 5% da produção?
#lambda = 1/media, ou seja, lambda = 1/100.
qexp(0.05, 1/100)

#Ex: Uma fábrica tem em média 3 falhas por dia em suas máquinas
#Supondo que as falhas sigam a distribuição de poisson.
#lambda = media = 3 -> para poisson

#a) Qual P(x > 4)?
ppois(4, lambda = 3, F)

#b) Qual P(t > 8 horas)?
#As falhas eram por dia, e queriamos por hora, por isso 8/24
pexp(8, 3/24, F)
pexp(8/24, 3, F)

#Ex: Um call center recebe, em média, 15 chamadas por hora.
#Assumindo que seja uma distribuição de poisson, calcule:

#a) P(10 chamadas < 40 min)
dpois(10, 40/60 * 15)

#b) A probabilidade que o tempo até a próxima chamada seja
#superior a 5 minutos
pexp(5/60, 15, F)

#Ex: Uma empresa está acompanhando o tempo útil das lampadas
#a média delas é 100 horas

#lambda = 1/100

#a) Qual P(0 < t <= 10)?

pexp(10, 1/100) - pexp(0, 1/100)

#b) Qual P(100 < t <= 110)?
pexp(110, 1/100) - pexp(100, 1/100)

#c) Qual probabilidade de uma lampada queimar no intervalo
#entre 100 e 110 horas, sabendo que já durou 100 horas?

#Probabilidade condicional

#P(A|B) = P(A intersection B)/P(B)
#P(100 < t <= 110)/P(t > 100)
#Utilizamos t > 100 por causa que estamos lidando com o caso
#dele durar mais de 100 horas


(pexp(110, 1/100) - pexp(100, 1/100))/(pexp(100, 1/100,F))