#ranking heights by family role

library(ggplot2)
library(esquisse)
library(readxl)
tidy <- read_excel("C:/Users/blazi/Documents/R/Galston.xlsx")

#esquisse::esquisser(data<-tidy)

#112446

ggplot(`tidy`) +
 aes(x = Role, y = Height) +
 geom_boxplot(fill = "#FF8C00") +
 theme_minimal()+
 ylab("Difference in Height from 60 inches")

ggplot('army')+
  aes(x = )