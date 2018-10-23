## Basic Statistical Tests

# T.tests with single sample

# Suppose we want to test whether the average amount spent is greater than 1150

t.test(dm$AmountSpent, mu = 1150, alternative = "greater")

# For two sample t tests, checking if there is a difference between two groups of observations

t.test(dm$AmountSpent ~ dm$Location)

# For paired test, we have a data showing a sample of 200 member purchases on the month of Feb
# and March. Lets load the data 

t.test(paired$February, paired$March, paired = T)

# For comparison of multiple means, we can reply on one way ANOVA

anova_model = aov(AmountSpent ~ Age, data = dm)

summary(anova_model)

# One way to see how the means varied is

dm %>% group_by(Age) %>% summarise(mean(AmountSpent))

# Or we can visualize them

ggplot(dm, aes(y = AmountSpent, x = Age, fill = Age)) + geom_boxplot()

# To further analyze the difference in groups, we can carry out TukeyHSD

TukeyHSD(anova_model)

# And also visualize the differences 

plot(TukeyHSD(anova_model))

# For categorical data, one very useful test is Chi Square test of independence. Let us check if
# there is a relationship between the frequency of visit and nearness to store

chitabl <- table(dm$History, dm$Location)

chisq.test(table(dm$History, dm$Location))

# Another useful test among categorical data chi square GOF test. So suppose we want to know
# whether gender is equally represented in our data set

dm_gen <- dm %>% group_by(Gender) %>% summarise(count = n())

chisq.test(dm_gen$count, p = c(1/2 , 1/2))

# Finally, correlaton shows us the ditectional relationship between two numeric variables

dm_num <- dm %>% select(AmountSpent, Salary, Catalogs)

cor(dm_num)

# To check these visually
plot(dm_num)