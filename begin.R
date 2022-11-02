library(tidyverse)
mpg
?mpg



ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = displ < 5))

# This first maps the scatterplot then splits it into various groups according to their classes
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)

# This first maps the scatterplot then splits it into various groups according to their drv and splits then again according to the cyl
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
  
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

#------------------My own experimentation--------------------
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(alpha=0.5) +
  geom_smooth(aes(linetype = drv)) +
  facet_grid(.~drv)

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(alpha=0.5) +
  facet_grid(.~drv) +
  geom_smooth() 
#----------------End of experiment---------------------------

diamonds
?diamonds
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))

#overide default stat
demo <- tribble(
  ~a,
  ~b,
  "bar_1", 20,
  "bar_2", 30,
  "bar_3", 40
)
ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )

# change default mapping
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, y = ..prop.., group = 1)
  )

# emphasize statistical summary
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )

# bar chart color vs fill
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

# proportion of another variable in main variables in bar chart (stacking one variable on another)
ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

# this changes the scales and stakes the second variable's values on top of each other
# position = identity
ggplot(
  data = diamonds,
  mapping = aes(x = cut, fill = clarity)
) +
  geom_bar(position = "identity")

ggplot(
  data = diamonds,
  mapping = aes(x = cut, color = clarity)
) +
  geom_bar(fill = NA, position = "identity")

# position = fill
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "fill"
  )

# position = stack
ggplot(data = diamonds) +
  geom_bar(
    mapping = aes(x = cut, fill = clarity),
    position = "dodge"
  )

# position = jitter
ggplot(data = mpg) +
  geom_point(
    mapping = aes(x = displ, y = hwy),
    position = "jitter"
  )
  #same as below
ggplot(data = mpg) +
  geom_jitter(mapping = aes(x = displ, y = hwy))











