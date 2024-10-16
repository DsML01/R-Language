#Distribuicoes continuas

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


#----------------------------------------------
#Lista variáveis continuas começa aqui

#Questão 1: O volume de correspondencia por uma empresa quinzenalmente tem
#distribuição normal com média de 4000 cartas e desvio padrão de 200 cartas.
#Qual porcentagem de quinzenas em que a firma recebe:

#a) Entre 3600 e 4250 cartas
(pnorm(4250, 4000, 200) - pnorm(3600, 4000, 200)) * 100

#b) Menos de 3400 cartas
pnorm(3400, 4000, 200) * 100

#c) Mais de 4636 cartas
pnorm(4635, 4000, 200, F) * 100

#Questão 2: Uma enchedora automática de refrigerantes está regulada para que o
#volume médio de líquido de cada garrafa seja de 1000cm3 e desvio padrão de 10cm3
#Admita que o volume siga uma distribuição normal.

#a) Qual a porcentagem de garrafas com o volume liquido menores que 990cm3?
pnorm(990, 1000, 10)

#b) Qual a porcentagem de garrafas que o volume líquido não se desvia da média
#em mais do que dois desvios padrões?
pnorm(1020, 1000, 10) - pnorm(980, 1000, 10)

#c) Se 10 garrafas são selecionadas ao acaso, qual a probabilidade que no máximo
#4 tenham volume líquido superior a 1002cm3?

#Primeiro vamos saber qual a P de uma garrafa ter vol liquido superior a 1002cm3
prob_garrafa_superior_a_1002 <- pnorm(1002, 1000, 10, F)
prob_garrafa_superior_a_1002

#Agora, utilizaremos a binomial para descobrir a porcentagem de 4 de 10 garrafas
#terem esse vol liquido
pbinom(4, 10, prob_garrafa_superior_a_1002)

#Questão 3: Em certo teste, os candidatos devem realizar as tarefas no menor tempo.
#O tempo médio tem distribuição normal com média de 45 min com dp = 20 min.
#Suponha que o teste foi aplicado com uma amostra de 50 candidatos.

#a) Qual a probabilidade de encontrarmos algum candidato que tenha um tempo
#superior a 50 minutos ou inferior a 30 minutos?
pnorm(50, 45, 20, F) + pnorm(30, 45, 20)

#b) Qual o número de candidatos com tal perfil?
50 * (pnorm(50, 45, 20, F) + pnorm(30, 45, 20))
#Aproximadamente 32 pessoas.

#Questão 4: Uma máquina produz discos de diâmetro médio = 2cm e dp = 0.01cm.
#as peças com mais de 0.03 desse valor médio são consideradas defeituosas.
#Qual percentual de peças defeituosas?

(pnorm(2.03, 2, 0.01, F) + pnorm(1.97, 2, 0.01)) * 100

#Questão 5: A vida média de uma televisão é 8 anos com dp = 1.8 anos.
#qual seria o tempo de garantia que você especificaria para ter no máximo
#5% de trocas?

#qnorm(porcentagem que queremos achar, media, dp)
qnorm(.05,8,1.8)

#Questão 6: Suponha que o tempo médio de atendimento de um banco seja de 5 min.
#Admitindo que o tempo para atendimento tenha distribuição exponencial, determine P.

#lembrar que lambda = 1/media

#a) P(t > 5 min)
#media = 5min, lambda = 1/5
pexp(5, 1/5, F)

#b) P(t < 4 min)
pexp(4, 1/5)

#c) P(3 <= t <= 8)
pexp(8, 1/5) - pexp(3, 1/5)

#Questão 7: O tempo de cirurgia é 129 min com dp = 14min.

#a) Qual a P(t > (129 + (14 * 2)))

pnorm((129 + (14*2)), 129, 14, F)

#b) Qual P(t < 100)
pnorm(100, 129, 14)

#c) Qual tempo p/ 95%?
qnorm(.95, 129, 14)

#d) Se P(t) = 199 min, o que você conclui sobre as cirurgias do hospital?
pnorm(199, 129, 14)

#indica que apenas 0.0001% das cirurgias teriam essa duração, também podemos
#que a cirurgia está 5 desvios padrões acima da média.

#Questão 8: Uma fabricante de baterias, sabe que sua bateria tem média de 600 dias
#de duração e desvio padrão de 100 dias com distribuição normal.
#Ele oferece uma garantia de 312 dias.
#Ele fabrica 10000 baterias mensalmente. Quantas deverá trocar pelo uso da garantia
#mensalmente?
fabricacao_mensal <- 10000

pnorm(312, 600, 100) * fabricacao_mensal
#Ele troca aproximadamente 20 baterias por mês.

#Questão 9: Pacotes de queijo ralado tem média = 100g e dp = 10g
#a) Qual P(95g <= x <= 105g)
p9 <- pnorm(105, 100, 10) - pnorm(95, 100, 10)

#b) Se 16 pacotes são escolhidos ao acaso, qual P de o peso médio estar entre
#95g e 105g?
dp9 <- 10
n <- 16
#Precisamos calcular o desvio padrão da nossa amostra
dp_amostra9 <- dp9/sqrt(n)

pnorm(105, 100, dp_amostra9) - pnorm(95, 100, dp_amostra9)

#Questão 10: O tempo até a falha de um conjunto de motores tem distribuição expo
#nencial de 28500 horas. Qual P de um destes ventiladores falhar nas primeiras
#24000 horas de funcionamento?

pexp(24000, 1/28500)

#Questão 11: Considere que o tempo de resposta de uma tela tem distribuição expo
#nencial média = 5 milisegundos.
#a) Qual P(t <= 10 milisegundos)?
pexp(10, 1/5)

#b) Qual P(5 <= t <= 10)
pexp(10, 1/5) - pexp(5, 1/5)

#Questão 12: Considere que uma reação demore em média 4000 segundos.
#a) Qual P(t > 2000)
pexp(2000, 1/4000, F)

#b) qual P de durar 6k segundos, sabendo que já durou 2k segundos?
pexp(2000, 1/4000,F)

#Questão 13: Motor dura em média = 150000km, com dp = 5000km.

#a) Qual p(t < 170000)
pnorm(170000, 150000, 5000)

#b) Qual P(140000 <= t <= 165000)
pnorm(165000, 150000, 5000) - pnorm(140000, 150000, 5000)

#c) Qual deve ser a garantia para que a porcentagem dos motores seja inferior a
#0.02?
qnorm(0.02, 150000, 5000)

#Questão 14: Adultos tem média = 75kg e dp = 8kg.
#Adultos que praticam sumô tem média = 110kg e dp = 5kg.

#Sete adultos comuns e 3 praticantes de sumô estão pra entrar num elevador
#que tem capacidade máxima de 10 pessoas ou 850kg.

#Determine a probabilidade de que o peso dessas 10 pessoas ultrapasse a capacidade
#máxima do elevador.

nova_media14 <- 75 * 7 + 110 * 3
nova_dp14 <- sqrt(7 * 8^2 + 3 * 5^2)

pnorm(850, nova_media14, nova_dp14, F)

#Questão 15: A capacidade máxima de um elevador é 500kg. Se o peso de cada usuário
#tem média = 70kg e var = 100kg

#a) Qual P de 7 passageiros ultrapassarem o limite?
#dp = var^(1/2)

nova_media15 <- 70 * 7
nova_dp15 <- sqrt(7 * 10^2)

pnorm(500, nova_media15, nova_dp15, F)

#b) E seis passageiros?
nova_media152 <- 70 * 6
nova_dp152 <- sqrt(6 * 10^2)

pnorm(500, nova_media152, nova_dp152, F)
