library(dplyr)
library(magrittr)
library(rvest)
library(janitor)
library(tidyr)
library(esquisse)
library(ggplot2)

webpage <- read_html("http://www.espn.com/tennis/history")

table1 <- webpage %>%
  html_nodes("table") %>%
  .[1] %>%
  html_table(fill = TRUE) %>%
  data.frame() %>%
  row_to_names(row_number = 2) %>%
  subset(select = -c(YEAR ,TOURNAMENT))
table1[2] <- NULL
table1 <- table1 %>%
  group_by(WINNER) %>%
  count() %>%
  arrange(desc(n)) %>%
  rename(Name = WINNER,
         Titles = n)
  
website <- read_html("https://tenniscompanion.org/players/male/birthdays/")

table <- website %>%
  html_nodes("table") %>%
  .[1] %>%
  html_table(fill = TRUE)

subtable1 <- table %>%
  data.frame() %>%
  row_to_names(row_number = 1) %>%
  unite(col = "Name", c("First Name", "Last Name"), sep = " ", remove = TRUE) %>%
  subset(select = -c(Birthday))

table <- website %>%
  html_nodes("table") %>%
  .[2] %>%
  html_table(fill = TRUE)

subtable2 <- table %>%
  data.frame() %>%
  row_to_names(row_number = 1) %>%
  unite(col = "Name", c("First Name", "Last Name"), sep = " ", remove = TRUE) %>%
  subset(select = -c(Birthday))

table2 <- rbind(subtable1, subtable2)
table3 <- merge(table1,table2)

esquisse::esquisser(table3)


library(ggplot2)

ggplot(table3) +
 aes(x = Age, y = Titles, colour = Name) +
 geom_point(shape = "square", size = 4L) +
 scale_color_hue(direction = 1) +
 labs(title = "Player Age vs Titles Earned", color = "Player") +
 coord_flip() +
 theme_minimal()

ggplot(table3) +
  aes(x = Age, y = Titles, colour = Name) +
  geom_point(shape = "circle", size = 4L) +
  scale_color_hue(direction = 1) +
  theme_minimal()