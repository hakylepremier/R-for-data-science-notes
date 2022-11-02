library(tidyverse)
mpg
?mpg

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()
# To make it better you can use jitter to see the true concentration of the values 
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_jitter()