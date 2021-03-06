dados <- c(48, 58, 56, 63, 52, 50, 59, 51, 59, 38, 57, 56, 73, 61, 41, 55, 49, 
           61, 49, 49, 52, 55, 60, 52, 54, 57, 47, 66, 60, 53, 59, 50, 45, 57, 
           64, 56, 57, 60, 47, 58, 53, 58, 66, 47, 40)


###1.A) Histograma agrupado com a frequ�ncia absoluta.

hist(dados,
          main="Histograma de frequ�ncia dos dados",
          xlab = " ", ylab= "Frequencia",
          xlim = c(30,80),
          ylim = c(0,20),
          right=FALSE, col="orange"
          )



###1.B) Em c�lculos diferentes, com os dados agrupados, encontre:


tabela <- table(dados);tabela

# M�dia:
mediaDados <- mean(dados);mediaDados

# Moda de Czuber:
names(tabela)[which.max(tabela)]

# Mediana:
mediana <- median(dados);mediana

# Terceiro Quartil:
quantile ( dados, probs = 0.75)

# Percentis 8, 50 e 80:
quantile ( dados, probs = c (0.08, 0.50, 0.8))


###1.C) Boxplot e coment�rios referentes aos resultados apresentados nos gr�ficos


boxplot(dados, col="orange", main="Frequ�ncia dos dados")

#-Ao analisar o boxplot, podemos observar que a maior parte os dados est�o concentrados entre
#50 e 60 e que h� um �nico ponto fora da curva que se encontra acima dos 70.

