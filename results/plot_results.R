library(ggplot2)
library(ggthemes)

data <- read.csv("all_results.csv")

ggplot(data,aes(x=Population,y=Days,color=Web)) + geom_point()+ theme_tufte()

data$Crossover <- as.factor(data$Crossover)
data$Population <- as.factor(data$Population)


data.web <- data[data$Web == "Static",]

ggplot(data.web, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation, size=Copies*10,alpha=Days)) + geom_jitter(width = 0.3)+ theme_tufte()
ggsave("static.png",width=190, units="mm")

data.juice <- data[data$Web == "Juice Shop",]

ggplot(data.juice, aes(x=Population,y=Fitness,color=Crossover,shape=Mutation, size=Copies*10,alpha=Days))+ geom_jitter(width = 0.3) +  theme_tufte()
ggsave("juice-shop.png", width=190, units="mm")

