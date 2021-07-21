##3ª Questão: Utilizando a base de dados da questão anterior, escolha um município e elabore Análise Multivariada, usando gráficos (no mínimo 2) pertinentes ao município escolhido por vocês. Além disso, elabore comentários para cada gráfico produzido.
pacientes <- read.csv("dadosPacientes2021.csv", header = TRUE, sep = ",")


cidade <- subset(pacientes, municipio_residencia == "Arapiraca")

interClasses <- c(0 , 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)

idade.obito.cut <- cut(cidade$idade[cidade$situacao_atual == "Óbito"], 
                       breaks = interClasses, 
                       right = FALSE)

barplot(table(idade.obito.cut),
        main = "Quantidade de óbitos por idade na cidade de Arapiraca",
        ylim = c(0, 120),
        ylab = "Número de óbitos",
        xlab = "idade",
        col = "darkred")

####gráfico pizza de numero de óbitos por sexo na faixa etária de 70 a 80 anos####

faixaetaria.cut  <- cut(cidade$idade, 
                        breaks = interClasses, 
                        right = FALSE)
cidade["faixa_etaria"] <- as.character(faixaetaria.cut)



sexo.obito.faixaetaria <- table(cidade$sexo[cidade$situacao == "Óbito" 
                                            & cidade$faixa_etaria == "[70,80)"
                                            & cidade$sexo != "Mascuino"])
                      

pie(sexo.obito.faixaetaria,
main="Números de óbitos na faixa etária entre 70 e 80 anos 
        no município de Arapiraca",
        labels = sexo.obito.faixaetaria,
        col = c("orange","blue")
        )

legend("topright", 
       c("Mulheres", "Homens"),
       fill = c("orange","blue"))

#A maior incidência de óbitos ocorreu para pessoas com idade entre 70 e 80 anos. E dentre essa faixa etária, a maior parte dos óbitos foram de homens.