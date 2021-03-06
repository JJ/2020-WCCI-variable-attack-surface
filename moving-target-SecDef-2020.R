## ----setup, cache=FALSE,echo=FALSE--------------------------------------------
suppressPackageStartupMessages({
    library(ggplot2)
    library(ggthemes)
})


## ----vulnerabilities, cache=FALSE,echo=FALSE----------------------------------
data <- read.csv("results/vulnerabilities-per-generation-results-02-05-2020.csv")
data$individual.medium <- data$Medium / data$Population
data$individual.low <- data$Low / data$Population
data$Generation <- as.factor(data$Generation)
ggplot(data[data$Population==16,],aes(x=Generation))+geom_boxplot(aes(y=individual.medium,color="Medium"))+geom_boxplot(aes(y=individual.low,color="Low"))+theme_tufte()+ylab("Number of vulnerabilities")+ scale_x_discrete(name ="Generation", limits=c("0","10","20","30"))+ggtitle("Vulnerabilities, pop = 16")
ggsave("vulnerabilities-population-16.png",width=8,height=6)
ggplot(data[data$Population==32,],aes(x=Generation))+geom_boxplot(aes(y=individual.medium,color="Medium"))+geom_boxplot(aes(y=individual.low,color="Low"))+theme_tufte()+ylab("Number of vulnerabilities")+ scale_x_discrete(name ="Generation", limits=c("0","10","20","30"))+ggtitle("Vulnerabilities, pop = 32")
ggsave("vulnerabilities-population-32.png",width=8,height=6)

## ----distances, cache=FALSE,echo=FALSE----------------------------------------
data.md <- read.csv("results/mutual-distances-averages-entropy.csv")
data.32 = data.md[ data.md$Population == 32, ]
ggplot(data.32,aes(x=Experiment,y=Avg.Distance))+ geom_boxplot() + theme_tufte()+ylab("Average distance")+ggtitle("Distance between configurations")
ggsave("average-distance.png",widht=8, height=6)

## ----entropy, cache=FALSE,echo=FALSE------------------------------------------
ggplot(data.32,aes(x=Experiment,y=Entropy))+ geom_boxplot() + theme_tufte()+ggtitle("Average total entropy")
ggsave("average-entropy.png",width=8, height=6)

## ----component_entropy, cache=FALSE,echo=FALSE--------------------------------
entropy.initial <- read.csv("results/component-entropy-evostar.csv")
entropy.new <- read.csv("results/component-entropy-sorted.csv")
entropy.unsorted <- read.csv("results/component-entropy-gecco.csv")

entropy.initial$Experiment <- "Evostar"
entropy.new$Experiment <- "Sorted"
entropy.unsorted$Experiment <- "GECCO"

entropy.data <- rbind(entropy.initial, entropy.new, entropy.unsorted)

entropy.data$Population <- substr( entropy.data$File, 16, 17 )

ggplot( entropy.data[entropy.data$Population==32,], aes(x=Experiment,y=Entropy)) + geom_boxplot()+ theme_tufte()+ggtitle("Component entropy")
ggsave("component-entropy.png",width=8, height=6)
