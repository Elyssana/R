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


##2.C) Gráfico representando o número de óbitos por sexo e idade. Considere para a 
#idade um intervalo de classe de 10 anos. 


interClasses <- c(0 , 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)

idade.cut <- cut(pacientes$idade[pacientes$situacao_atual == "Óbito" & pacientes$sexo != "Mascuino"], breaks = interClasses, right = FALSE)


sexo.idade.tb <- table(pacientes$sexo[pacientes$situacao_atual == "Óbito" & pacientes$sexo != "Mascuino"], idade.cut); sexo.idade.tb
#sexo.idade.tb <- 
barplot(sexo.idade.tb,
        main = "Número de óbitos por sexo e idade",
        ylim = c(0,800),
        ylab = "Nº de óbitos",
        xlab = "Idade",
        col = c("darkorange", "darkgreen"),
        legend.text = c("Mulheres", "Homens"),
        beside = TRUE)


##D) Gráfico de óbitos por idade (histograma).
obito.idade <- (pacientes$idade[pacientes$situacao_atual == "Óbito" & pacientes$idade > 0])

hist(obito.idade,
        col = ("red"),
        ylim = c(0,1500),
        xlim = c(0,120),
        labels = TRUE,
        right = FALSE,
        main = "Histograma óbitos por idade",
        xlab = "idade",
        ylab = "Mortes")


situacao = subset(pacientes, situacao_atual="Óbito")
idadeteste<-situacao$idade

hist(idadeteste)

##E) Gráfico de barras, representando o número de óbitos por mês
meses <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", 
           "Jul", "Ago", "Set", "Out", "Nov", "Dez")
dados["MesEdit"] <- paste(dados$Ano, "-", meses[dados$Mes])
