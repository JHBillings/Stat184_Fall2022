library(dcData)
library(dplyr)
library(plyr)
library(ggplot2)

options(max.print = 30)  

  Minneapolis2013 %>% count(Precinct) %>% arrange(desc(n))
  
  colSums(Minneapolis2013 != "undervote")

  Minneapolis2013
  
  BabyNames
  

  t1 <- BabyNames %>% filter(name == "Emma")
  t2 <- BabyNames %>% filter(name == "Elizabeth")
  t3 <- BabyNames %>% filter(name == "Ida")
  emma <- ddply(t1,"year",numcolwise(sum))
  emma <- plyr::rename(emma, c("count"="emma"))  
  elizabeth <- ddply(t2,"year",numcolwise(sum))
  elizabeth <- plyr::rename(elizabeth, c("count"="elizabeth"))
  ida <- ddply(t3,"year",numcolwise(sum))
  ida <- plyr::rename(ida, c("count"="ida")) 
  
  tt2 <- merge(emma, merge(elizabeth,ida))
  
  e1 <- BabyNames %>% filter(name == "Emma")
  e2 <- BabyNames %>% filter(name == "Elizabeth")
  e3 <- BabyNames %>% filter(name == "Ida")
  
  e1 <- ddply(t1,"year",numcolwise(sum))
  e2 <- ddply(t2,"year",numcolwise(sum))
  e3 <- ddply(t3,"year",numcolwise(sum))
  e1$name = "emma"
  e2$name = "elizabeth"
  e3$name = "ida"
  e1
  e2
  e3
  
  tt4 <- BabyNames %>% filter(name == "Emma" | name == "Elizabeth" | name == "Ida") %>% ddply(.(year, name), numcolwise(sum))
  esquisser(tt4)
  
  
library(ggplot2)

ggplot(tt4) +
 aes(x = year, y = count, colour = name) +
 geom_line(size = 0.5) +
 scale_color_hue(direction = 1) +
 theme_minimal()
tt3 <- merge(e1,e2, by = "year")
  tt3
  
  
  esquisse::esquisser(tt2)

library(ggplot2)

ggplot(tt2) +
 aes(x = year, y = emma) +
 geom_line(size = 0.5, colour = "#112446") +
 
  
 
theme_minimal()
ggplot(tt2, aes(x= year)) +
 geom_line(aes(y=elizabeth), colour = "red")
 geom_line(aes(y=emma), colour = "blue", linetype="twodash")
 
geom_line(aes(y=ida), colour = "green")

ggplot(tt2) +
  aes(x = year, y = ida) +
  geom_line(size = 0.5, colour = "#112446") +
  theme_minimal()











