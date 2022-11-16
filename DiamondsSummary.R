library(dplyr)
library(ggplot2)
library(tidyverse)
data(diamonds)
diamondsY <- diamonds %>%
  as.data.frame() %>%
  subset(select = c(cut,y)) %>%
  group_by(cut) %>%
  summarize(count = n(), minimum = min(y), firstQuintile = quantile(y, .2), secondQuintile = quantile(y, .4),, median = median(y), thirdQuintile = quantile(y, .6), fourthQuintile = quantile(y, .8), maximum = max(y), "arithmetic mean" = mean(y), "arithmetic standard deviation" = sd(y))
view(diamondsY)

