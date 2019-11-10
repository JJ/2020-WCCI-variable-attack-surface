library(ggplot2)
library(ggthemes)

data <- read.csv("all_results.csv")
data$Crossover <- as.factor(data$Crossover)
data.web <- data[data$Web == "Static",]

ggplot(data.web, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation)) + geom_point()+ theme_tufte()+ geom_jitter(width = 0.3, height=0.2)
ggsave("static.png")

data.juice <- data[data$Web == "Juice Shop",]

ggplot(data.juice, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation)) + geom_point()+ theme_tufte()+ geom_jitter(width = 0.3, height=0.2)
ggsave("juice-shop.png")
