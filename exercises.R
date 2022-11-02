library(tidyverse)
mpg
?mpg

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()
