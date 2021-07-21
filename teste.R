
##########agrupados###################################


###1.A) Histograma agrupado com a frequência absoluta.

#amplitudes
amp <- max(dados) - min(dados); amp

#quantidade de classes
k = round(1+3.222 * log10(length(dados))); k

#amplitude de classe
ampclasse <- round(amp/k); ampclasse

#limites das classes
limclasse <- c(38, 44, 50, 56, 62, 68, 74)

#classes
classes <- c("38 |-- 44", "44 |-- 50", "50 |-- 56",  "56 |-- 62", "62 |-- 68", "68 |-- 74")

#frequencia
freq <- table (cut(dados, breaks = limclasse, right = FALSE, labels =  classes)); freqhist(dados,
     breaks = limclasse,
     ylim = c(0,20),
     labels = classes,
     main = "Frequência de dados",
     col = "orange",
     ylab ="Frequência", xlab =" "
     
)






