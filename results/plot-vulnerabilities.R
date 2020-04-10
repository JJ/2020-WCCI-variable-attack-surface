library(ggplot2)
library(ggthemes)

data <- read.csv("vulnerabilities-per-generation-results-02-05-2020.csv")
data$individual.medium <- data$Medium / data$Population
data$individual.low <- data$Low / data$Population
data$Generation <- as.factor(data$Generation)
data$Population <- as.factor(data$Population)
ggplot(data,aes(x=Generation,shape=Population))+geom_point(aes(y=individual.medium,color="Medium"))+geom_point(aes(y=individual.low,color="Low"))+theme_tufte()
