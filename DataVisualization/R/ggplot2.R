ggplot(dm, aes(x = History)) + geom_bar()
ggplot(dm, aes(x = History, fill = Age)) + geom_bar()
ggplot(dm, aes(x = History, fill = Age)) + geom_bar(position = "fill")
ggplot(dm, aes(x = History, fill = Age)) + geom_bar(position = "dodge")

ggplot(dm, aes(x = AmountSpent, fill = Age) ) + geom_histogram(binwidth = 50)
ggplot(dm, aes(x = AmountSpent, fill = Age) ) + geom_density(alpha = 0.3)

qplot(sample = AmountSpent, data = dm, col = History)

ggplot(dm, aes(x = 1, y = AmountSpent, fill = Age) ) + geom_boxplot() + facet_wrap(~OwnHome) 

ggplot( dm, aes (x= Salary, y = AmountSpent, col = Age, size = Children, shape=OwnHome) ) + geom_point(alpha = 0.4)
+ facet_wrap(~Married)

ggplot( dm, aes (x= Salary, y = AmountSpent, col = Location) ) + geom_density_2d()


