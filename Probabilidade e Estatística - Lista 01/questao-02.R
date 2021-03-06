#2 Quest�o: Utilizando a base de pacientes dos pacientes com Covid-19 em Alagoas, elabore
#os seguintes gr�ficos e escreva suas considera��es sobre eles.

pacientes <- read.csv("dadosPacientes2021.csv", header = TRUE, sep = ",");

##2.A) Gr�fico de barras da situa��o atual dos pacientes.
tabela.situa��o <- table(pacientes$situacao_atual)


barplot(sort(tabela.situa��o),
        ylim = c(0,200000),
        col = ("yellow"),
        main = "Situa��o atual dos pacientes",
        xlab = "Situa��o",
        ylab = "N� de pacientes")

#-Mais de 150.000 pacientes est�o isolamento domiciliar



##2.B) Gr�fico de barras, representando o n�mero de �bitos por munic�pio.

obito.municipio <- table(pacientes$municipio_residencia[pacientes$situacao_atual == "�bito"])

barplot(obito.municipio,
        ylim = c(0,2500),
        col = ("red"),las = 2,
        main = "Quantidade de �bitos por munic�pio",
        ylab = "N� de �bitos")

#A maior parte dos �bitos do estado de Alagoas ocorreram na capital.


##2.C) Gr�fico representando o n�mero de �bitos por sexo e idade. Considere para a 
#idade um intervalo de classe de 10 anos. 


interClasses <- c(0 , 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)

idade.cut <- cut(pacientes$idade[pacientes$situacao_atual == "�bito" & pacientes$sexo != "Mascuino"], breaks = interClasses, right = FALSE)


sexo.idade.tb <- table(pacientes$sexo[pacientes$situacao_atual == "�bito" & pacientes$sexo != "Mascuino"], idade.cut); sexo.idade.tb

barplot(sexo.idade.tb,
        main = "N�mero de �bitos por sexo e idade",
        ylim = c(0,800),
        ylab = "N� de �bitos",
        xlab = "Idade",
        col = c("darkorange", "darkgreen"),
        legend.text = c("Mulheres", "Homens"),
        beside = TRUE)


##D) Gr�fico de �bitos por idade (histograma).
obito.idade <- (pacientes$idade[pacientes$situacao_atual == "�bito" & pacientes$idade > 0])

hist(obito.idade,
        col = ("red"),
        ylim = c(0,1500),
        xlim = c(0,120),
        labels = TRUE,
        right = FALSE,
        main = "Histograma �bitos por idade",
        xlab = "idade",
        ylab = "Mortes")




##E) Gr�fico de barras, representando o n�mero de �bitos por m�s

data <- as.character(pacientes$data_resultado_exame)

mes <- substr(data, 6,7)

ano <- substr(data, 1, 4)

pacientes["m�s"] <- mes
pacientes["ano"] <- ano


pacientes["mes_ano"] <- paste( pacientes$ano,"/",pacientes$m�s)

mes.ano <- pacientes$mes_ano[pacientes$situacao_atual == "�bito" &
                                     pacientes$m�s != "NA" &
                                     pacientes$ano >= 2020 &
                                     pacientes$ano <= 2021]
#table(mes.ano)

barplot(table(mes.ano), 
        ylim = c(0,1000),
        las=2,
        main = "N�mero de �bitos por m�s",
        col = ("darkred"))
