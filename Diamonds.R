library(ggplot2)
library(esquisse)
data(diamonds)

esquisse::esquisser(diamonds)


library(ggplot2)

ggplot(diamonds) +
 aes(x = depth, y = carat, fill = color, colour = price, size = clarity, group = table) +
 geom_point(shape = "circle") +
 scale_fill_viridis_d(option = "inferno", direction = 1) +
 scale_color_viridis_c(option = "inferno", 
 direction = 1) +
 theme_minimal() +
 facet_wrap(vars(cut))
library(ggplot2)

ggplot(`diamonds`) +
 aes(x = carat, y = price, colour = clarity, group = color) +
 geom_point(shape = "circle", 
 size = 1.5) +
 scale_color_hue(direction = 1) +
 theme_minimal() +
 facet_wrap(vars(cut))


