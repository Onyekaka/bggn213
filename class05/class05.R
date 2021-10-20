# class 05 dta visualization 

# Today is ggplot
# first we need to load the package
#install.packages("ggplot2")
library(ggplot2)
ggplot(cars)

# we will use this inbuilt "cars" dataset first
head(cars)

# All ggplots have atleast 3 layers
# data + aes + geoms
ggplot(data=cars) +
  aes(x=speed, y=dist) +
geom_point() +
  geom_smooth(method="lm") +
  labs(titles="stopping of old cars", 
       x="speed (MPH)",
       y="stopping distance (ft)")

# side-note: ggplot is not the only graphics system
# a very popular one is good old  "base" R graphics
plot(cars$speed, cars$speed)


url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)




# q. How many genes in thsi dataset
nrow(genes)

# how many genes are "up"
table(genes$State)

# Q. what % are up?
round( table(genes$State)/nrow(genes) * 100, 3)

# lets make a figure
p <- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

p 

p + aes(col=State) + geom_point(col="blue")

p


# I like it but not the default colors, let's change them
p + scale_color_manual(values=c("blue", "gray", "red"))



# lets explore the gapminder dataset
# install.packages("gapminder")
library(gapminder)
head(gapminder)

#let's make a new plot of year vs lifexp
ggplot(gapminder) +
aes(x=year, y=lifeExp, col=continent) +
  geom_jitter(width=0.3,alpha=0.4) +
geom_boxplot( aes(group=year), alpha=0.2 )
geom_violin( aes(group=year), alpha=0.2,
             draw_quantiles = 0.5)
# install the plotly
#install.packages("plotly")
library(plotly)
#ggplotly()
