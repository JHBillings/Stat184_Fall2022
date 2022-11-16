library(palmerpenguins)
library(ggplot2)
library(esquisse)
data(penguins)

esquisse::esquisser(penguins)


library(ggplot2)

ggplot(penguins) +
 aes(x = bill_length_mm, y = flipper_length_mm, fill = body_mass_g, colour = sex, size = island) +
 geom_point(shape = "circle") +
 scale_fill_gradient() +
 scale_color_hue(direction = 1) +
 theme_minimal() +
 facet_wrap(vars(species))
library(ggplot2)

ggplot(penguins) +
 aes(x = flipper_length_mm, y = island, colour = year) +
 geom_point(shape = "circle", 
 size = 1.5) +
 scale_color_gradient() +
 theme_minimal() +
 facet_wrap(vars(species))
