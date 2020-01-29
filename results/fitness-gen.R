library(ggplot2)
library(ggthemes)

data <- read.csv("fitness-by-gen-pop32-gen32.csv")
p <- plot_ly(x=data$Rank,y=data$Gen,z=data$Fitness,intensity=data$Fitness,colors = colorRamp(c("red", "green", "blue")),type='mesh3d')
