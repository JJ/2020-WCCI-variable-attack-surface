library(ggplot2)
library(ggthemes)

data <- read.csv("initial-fitness.dat", header=F)

ggplot(data,aes(x=V1)) + geom_bar()+ theme_tufte()+ scale_x_log10()

table(data)
