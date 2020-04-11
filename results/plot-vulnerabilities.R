library(ggplot2)
library(ggthemes)

data <- read.csv("vulnerabilities-per-generation-results-02-05-2020.csv")
data$individual.medium <- data$Medium / data$Population
data$individual.low <- data$Low / data$Population
data$Generation <- as.factor(data$Generation)
ggplot(data[data$Population==16,],aes(x=Generation))+geom_boxplot(aes(y=individual.medium,color="Medium"))+geom_boxplot(aes(y=individual.low,color="Low"))+theme_tufte()
ggplot(data[data$Population==32,],aes(x=Generation))+geom_boxplot(aes(y=individual.medium,color="Medium"))+geom_boxplot(aes(y=individual.low,color="Low"))+theme_tufte()

data <- read.csv("secdef-2020.csv")
data$individual.medium <- data$Medium / data$Population
data$individual.low <- data$Low / data$Population
data$Generation <- as.factor(data$Generation)
ggplot(data[data$Population==16,],aes(x=Generation))+geom_boxplot(aes(y=individual.medium,color="Medium"))+geom_boxplot(aes(y=individual.low,color="Low"))+theme_tufte()


