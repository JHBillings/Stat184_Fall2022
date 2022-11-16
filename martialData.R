library(janitor)
library(dplyr)
library(ggplot2)
library(DT)

marital <- read.csv("C:/Users/blazi/Desktop/Sophmore/R/rawArmyData.csv")

maritalClean <- marital[(marital$sex == "Male"),]

maritalClean <- maritalClean %>%
  as.data.frame()%>%
  group_by_all() %>% 
  summarise(COUNT = n()) %>%
  subset(select = -c(sex)) %>%
  rename(Totals = COUNT)

maritalClean$Percentage <- round(100*(maritalClean$Totals/sum(maritalClean$Totals)),digits = 4)
maritalClean <- maritalClean[order(-maritalClean$Percentage),]
  

view(maritalClean)

if (!require("DT")) devtools::install_github("rstudio/DT")

datatable(maritalClean)
