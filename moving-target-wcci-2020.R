## ----setup, cache=FALSE,echo=FALSE--------------------------------------------
library(ggplot2)
library(ggthemes)
active.fitness.data <- read.csv("results/initial-fitness.dat")
experiments.data <- read.csv("results/all_results.csv")


## ----passive-scan, cache=FALSE,echo=FALSE-------------------------------------
kable(col.names=c("Zap Score","Number of instances"),as.data.frame(table(active.fitness.data)))


## ----experiments, cache=FALSE,echo=FALSE--------------------------------------
kable(experiments.data)

