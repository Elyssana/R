#2 Questão: Utilizando a base de pacientes dos pacientes com Covid-19 em Alagoas, elabore
#os seguintes gráficos e escreva suas considerações sobre eles.

pacientes <- read.csv("dadosPacientes2021.csv", header = TRUE, sep = ",");

##2.A) Gráfico de barras da situação atual dos pacientes.
tabela.situação <- table(pacientes$situacao_atual)


barplot(sort(tabela.situação),
        ylim = c(0,200000),
        col = ("yellow"),
        main = "Situação atual dos pacientes",
        xlab = "Situação",
        ylab = "Nº de pacientes"
        )
#-Mais de 150.000 pacientes estão isolamento domiciliar



##2.B) Gráfico de barras, representando o número de óbitos por município.

obito.municipio <- table(pacientes$municipio_residencia[pacientes$situacao_atual == "Óbito"])

barplot(obito.municipio,
        ylim = c(0,2500),
        col = ("red"),las = 2,
        main = "Quantidade de óbitos por município",
        ylab = "Nº de óbitos")

#A maior parte dos óbitos do estado de Alagoas ocorreram na capital.


##C) Gráfico representando o número de óbitos por sexo e idade. Considere para a 
#idade um intervalo de classe de 10 anos. 




##D) Gráfico de óbitos por idade (histograma).
obito.idade <- table(pacientes$idade[pacientes$situacao_atual == "Óbito" & pacientes$idade > 0 ])
hist(obito.idade,
       # ylim = c(0,2500),
        col = ("red"),
        main = "Óbitos por idade",
        xlab = "idade",
        ylab = "Mortes")

barplot(obito.idade,
       # ylim = c(0,2500),
        col = ("red"),
        main = "Óbitos por idade",
        xlab = "idade",
        ylab = "Mortes")


##E) Gráfico de barras, representando o número de óbitos por mês
meses <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", 
           "Jul", "Ago", "Set", "Out", "Nov", "Dez")
dados["MesEdit"] <- paste(dados$Ano, "-", meses[dados$Mes])
