##3� Quest�o: Utilizando a base de dados da quest�o anterior, escolha um munic�pio e elabore An�lise Multivariada, usando gr�ficos (no m�nimo 2) pertinentes ao munic�pio escolhido por voc�s. Al�m disso, elabore coment�rios para cada gr�fico produzido.
pacientes <- read.csv("dadosPacientes2021.csv", header = TRUE, sep = ",")


cidade <- subset(pacientes, municipio_residencia == "Arapiraca")

interClasses <- c(0 , 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 110)

idade.obito.cut <- cut(cidade$idade[cidade$situacao_atual == "�bito"], 
                       breaks = interClasses, 
                       right = FALSE)

barplot(table(idade.obito.cut),
        main = "Quantidade de �bitos por idade na cidade de Arapiraca",
        ylim = c(0, 120),
        ylab = "N�mero de �bitos",
        xlab = "idade",
        col = "darkred")

####gr�fico pizza de numero de �bitos por sexo na faixa et�ria de 70 a 80 anos####

faixaetaria.cut  <- cut(cidade$idade, 
                        breaks = interClasses, 
                        right = FALSE)
cidade["faixa_etaria"] <- as.character(faixaetaria.cut)



sexo.obito.faixaetaria <- table(cidade$sexo[cidade$situacao == "�bito" 
                                            & cidade$faixa_etaria == "[70,80)"
                                            & cidade$sexo != "Mascuino"])
                      

pie(sexo.obito.faixaetaria,
main="N�meros de �bitos na faixa et�ria entre 70 e 80 anos 
        no munic�pio de Arapiraca",
        labels = sexo.obito.faixaetaria,
        col = c("orange","blue")
        )

legend("topright", 
       c("Mulheres", "Homens"),
       fill = c("orange","blue"))

#A maior incid�ncia de �bitos ocorreu para pessoas com idade entre 70 e 80 anos. E dentre essa faixa et�ria, a maior parte dos �bitos foram de homens.