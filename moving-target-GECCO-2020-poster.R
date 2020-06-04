## ----setup, cache=FALSE,echo=FALSE--------------------------------------------
suppressPackageStartupMessages({
    library(ggplot2)
    library(ggthemes)
})


## ----distances, cache=FALSE,echo=FALSE----------------------------------------
data.md <- read.csv("results/mutual-distances-averages-entropy.csv")
data.16 = data.md[ data.md$Population == 16, ]
ggplot(data.16,aes(x=Experiment,y=Avg.Distance))+ geom_boxplot() + theme_tufte()


## ----entropy, cache=FALSE,echo=FALSE------------------------------------------
ggplot(data.16,aes(x=Experiment,y=Entropy))+ geom_boxplot() + theme_tufte()

