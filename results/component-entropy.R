library(ggplots)
library(ggthemes)
library(entropy)

entropy.initial <- read.csv("component-entropy-evostar.csv")
entropy.new <- read.csv("component-entropy-sorted.csv")
entropy.unsorted <- read.csv("component-entropy-gecco.csv")

entropy.initial$Experiment <- "Evostar"
entropy.new$Experiment <- "Sorted"
entropy.unsorted$Experiment <- "GECCO"

entropy.data <- rbind(entropy.initial, entropy.new, entropy.unsorted)

entropy.data$Population <- substr( entropy.data$File, 16, 17 )


ggplot( entropy.data[entropy.data$Population==16,], aes(x=Experiment,y=Entropy)) + geom_boxplot()+ theme_tufte()
ggplot( entropy.data[entropy.data$Population==32,], aes(x=Experiment,y=Entropy)) + geom_boxplot()+ theme_tufte()
