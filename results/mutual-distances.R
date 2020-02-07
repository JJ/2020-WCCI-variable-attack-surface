library(ggplots)
library(ggthemes)
library(entropy)

md.initial <- read.csv("mutual-distances-02-01.csv")
md.new <- read.csv("mutual-distances-02-02.csv")
md.unsorted <- read.csv("mutual-distances-02-05.csv")

md.initial$Experiment <- "Evostar"
md.new$Experiment <- "Sorted"
md.unsorted$Experiment <- "GECCO"

data <- rbind(md.initial, md.new, md.unsorted)

data$Population <- substr( data$File, 16, 17 )
write.csv(data, "mutual-distances-all.csv")
