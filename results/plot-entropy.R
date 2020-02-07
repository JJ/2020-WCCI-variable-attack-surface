library(ggplot2)
library(ggthemes)

data <- read.csv("mutual-distances-averages-entropy.csv")
data.16 = data[ data$Population == 16, ]
ggplot(data.16,aes(x=Experiment,y=Entropy))+ geom_boxplot() + theme_tufte()
ggplot(data.16,aes(x=Experiment,y=Avg.Distance))+ geom_boxplot() + theme_tufte()

data.32 = data[ data$Population == 32, ]
ggplot(data.32,aes(x=Experiment,y=Entropy))+ geom_boxplot() + theme_tufte()
ggplot(data.32,aes(x=Experiment,y=Avg.Distance))+ geom_boxplot() + theme_tufte()
