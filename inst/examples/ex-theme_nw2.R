library("ggplot2")

box <- ggplot(data = iris, aes(x = Species, y = Sepal.Length)) +
  geom_boxplot(aes(fill = Species)) +
  ylab("Sepal Length") + ggtitle("Iris Boxplot") +
  stat_summary(fun = mean, geom = "point", shape = 5, size = 4) +
  theme_nw2()
box
