#Author: Iago Rios

#Description: 
#Script utilizado na apresentação "Manipulando Bases de Dados Públicas em R", a qual visou mostrar os conceitos básicos
#da linguagem R e o workflow de uma análise simples. Tal apresentação foi realizada na Campus Party Bahia 2018.

#Seta o diretório de trabalho
setwd("/home/Desktop/") #Incluir diretório desejado

#Importa o dataset
prouni_dataset <- read.csv(file= "cursos-prouni-2018.csv", header= TRUE, sep= ",")

#Cria um subset com as universidades da BA. O operador $ é utilizado para "selecionar" uma coluna
subset_BA<-subset(prouni_dataset, prouni_dataset$uf_busca == 'BA')

#Cria um subset com os cursos de Salvador e Feira de Santana
subset_SSA_FSA<-subset(prouni_dataset, cidade_busca == 'Salvador' | cidade_busca == 'Feira de Santana')

#Cria um vetor com o nome de 3 colunas do dataset
colunas<-c("cidade_busca", "nome", "nota_integral_ampla")

#Cria um subset a partir de um vetor. O vetor colunas foi utilizado para demonstrar outra forma de se obter um subset
subset_col_selection<-subset_SSA_FSA[colunas]

#Obtém a média dos valores de uma coluna, sendo que na.rm desconsidera os valores N/A
media_notas<-mean(subset_col_selection$nota_integral_ampla, na.rm= TRUE)

#Plota um histograma
hist(subset_col_selection$nota_integral_ampla, main="Notas de corte em Salvador e Feira de Santana", xlab= "Nota", ylab= "Frequência")

#Plota um gráfico de barras e adiciona uma linha com a média dos valores
barplot(subset_col_selection$nota_integral_ampla, main="Notas de corte em Salvador e Feira de Santana", xlab= "Nota", ylab= "Frequência")
abline(h=media_notas, col= "red")
