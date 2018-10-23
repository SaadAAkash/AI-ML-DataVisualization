## Basics of R coding ##

# First, we will start off with very basic coding backgroung of R. R can be used
# as a basic calculator, carrying out the basic operations

# Addition
21 + 12

# Multiplicarion
21 * 12

# Substraction
21 - 12

# Division
21/12

# But any calculator can do that. Most of the work in R will be done through datasets
# variables and models. This is how we assign variables in R and carry out work with
# with variables in R

a <- 10
b <- 3

(c <- a + b)

c

# The most common type of item we will use in R for any analysis is called a vector
# A vector is a collection of same type of data

a <- c(10, 12, 14)
a

b <- c(10, "Three", "Something")
b

sum(a)
mean(a)
sd(a)
var(a)

c <- c(12, 4, 6)

a > c

sum(a > c)

mean(a > c)

# A very important part of data analysis in R involves extensive use of logic. One
# very important function for logic is the ifelse function, which carries out a 
# logic test, and if the test is true, gives a result, or if the test is false,
# gives another result

# Suppose we have a variable between 1 to 100, and we want convert get another
# variable which identifies whether the previous variable is above 50, or below
# or equal to 50

x <- c(1:100)
x

y <- ifelse(x <= 50, "Less than or equal to 50", "More than 50")
y

# Suppose we want to recode x into three subgroups, 1 to 33, 34 to 66 and 67 above

z <- ifelse(x <34, "1 to 33", ifelse(x > 33 & x < 67, "34 to 66", "67 and above"))
z

# A nifty code to know what are the values in a categorical variable is
unique(z)

# Another way is
table(z)

# Finally we will be required to carry out loads of repititve steps for many data cleaning
# and analyzing activities. For this, a good concept to understand is the 'for' and 'while'
# loops in R

#Suppose we have the price of three different products, A, B and C, for past 5 years

A <- c(17, 18, 21, 24, 22)
B <- c(12, 12, 13, 14, 56)
C <- c(34, 36, 32, 37, 38)

# We can create a data frame from these three vectors

prices <- data.frame(A = A, B = B, C= C)

# What if I want to know the average price of A, B and C?

# The lengthy method will be

mean(prices$A)
mean(prices$B)

# This might get repetitive, and for large datasets, quite tedious. So we use a for loop

for (i in 1:ncol(prices)) {
  avg_price <- mean(prices[, i])
  print(avg_price)
}

# Suppose instead of printing, you want to store the information

# Start by creating a null vector

avg_price <- rep(NA, 3)

# Now run the loop

for (i in 1:ncol(prices)) {
  avg_price[i] <- mean(prices[,i])
}

# Lets look at the average price vector

avg_price

# Similar can be done if say we want to know the averge price of A, B and C for a certain
# period. Why not give it a try?

# A super useful shortcut for looping over rows and columns in a dataframe in R is the apply
# function

apply(prices, 2, mean)

# To store these values

avg_price <- apply(prices, 2, mean)
avg_price_period <- apply(prices, 1, mean)



## Loading datasets##

# We can import datasets easily from R Studio using their environment. The RStudio
# is robust in terms of importing data. You can import data from text files, csv
# files and also from files from other softwares - stata, spss and sas. Let us try
# loading different forms of data sets

# Sometimes you can directly get the data from an online source.

url <- "https://vincentarelbundock.github.io/Rdatasets/csv/Ecdat/Males.csv"

wage <- read.csv(url)

df <- read.csv("https://query.data.world/s/itxdviietv5smvk55ntmzswibf3cjx", header=TRUE, stringsAsFactors=FALSE)


## Getting a feel of the data##

# After loading a data in R Studio, we can run few of the following codes which
# quickly gives us an idea of what are we handling

dim(dm) # understanding the dimension of the data

# To get an idea of the type of variables there are in a dataset

str(dm)

# In order to view first few rows of a dataset

head(dm)

# A simple command can give you a summary of the whole dataset

summary(dm)


# Data indexing

dm[34:100, 1:5]

which(dm$Salary == max(dm$Salary))

max_spend <- dm[dm$AmountSpent == max(dm$AmountSpent), ]

above_average_sal <- dm[dm$Salary >= mean(dm$Salary),]

#Visually identifying outliers

boxplot(dm$AmountSpent)

boxplot(dm$Salary)

#composite outliers

plot(x = dm$Salary, y = dm$AmountSpent)

## Cleaning up data

# Sometimes the data presented to us is in a format not ready for analysis. Let us load one such
# data

# (Load the bmi data from the data folder)

# If we look at the data from our viewer, we can see that there is a problem with the data

# We can gather this data easily using the tidyr package

library(tidyr)

bmi_long <- gather(bmi_wide, year, bmi_val, - Country)

# Lets take a look at the bmi_long data file

# If we want to go back to the previous format, the code will be

bmi_wide2 <- spread(bmi_long, year, bmi_val)

# Sometimes, for our convenience, it might be useful to convert all the text in a certain field
# to all caps or no caps.

dm2 <- dm

dm2$LocationCaps <- toupper(dm2$Location)

# For no caps

dm2$MarriedLower <- tolower(dm2$Married)

# Sometimes, it is useful to have the field names to be all lower or upper, as it will help in
# coding

# This code will show you the names of the columns of the data frame
names(dm2)

# Now, lets change all the names to lower caps

names(dm2) <- tolower(names(dm2))
names(dm2)

# Replacing/Recoding string values

# Suppose we want to replace all female values of the data set with the code "F"

library(stringr)

dm2$gender <- str_replace(dm2$gender, "Female", "F")

# Similarly for Male to "M"

dm2$gender <- str_replace(dm2$gender, "Male", "M")

# As we have seen, we have missing values (NA) in our data set. One way to look at values which
# are missing, we have a code called:

complete.cases(dm)

# This gives us all the rows that have NA in them.

# To check the total number of rows that have NA

sum(complete.cases(dm))

# Or

mean(complete.cases(dm))

#One crude way to clean the dataset is to remove all NA rows

dm_noNA <- na.omit(dm)

summary(dm_noNA)
summary(dm)

# Instead of a crude removal, sometimes it is important to see what the NA value containig rows
# look like

dm_NA <- dm[is.na(dm$History),]
summary(dm_NA)

# So that is all about cleaning up data. For more advanced techniques, you can refer to several
# tutorials available in the web

# Handling NA's

#Step 1 will be to clean the unnecessary variables

dmNA$X <- NULL

summary(dmNA)

summary(dmNA$AmountSpent)

# So there are 100 NAs in the Amount Spent. There are different types of imputaion for
# numerical data

# Mean imputation

dmNA$AmountSpentImputed <- dmNA$AmountSpent
NAindex <- which(is.na(dmNA$AmountSpent))
dmNA$AmountSpentImputed[NAindex] <- mean(dmNA$AmountSpent, na.rm = T)
summary(dmNA$AmountSpentImputed)

# Median Imputation - can you try it???

# What about non-numerical NA's?

summary(dmNA$History)

# This brings us to the subjective realm. One idea is to look in detai at the NA dataset

# Another idea is to look at relative relationship of these NA's, which we will look at
# after we get introduced to data munging


# Data munging

# The best library for data munging in R is dplyr. So first, lets load the library up

library(dplyr)

# The first step in munging is the ability to select a subset of data based on few columns.
# Suppose we want a data set with only Age, Salary and AmountSpent

dm_mung1 <- select(dm, Age, Salary, AmountSpent)

# The same code can be written with something called a pipe operator "%>%"

dm_mung2 <- dm %>% select(Age, Salary, AmountSpent)

# We will stick to this version of the code, as it can be very useful, as you will see very soon

# Another operation in carrying out calculations to create fields
# Suppose we want to know the amount of spending per catalog emailed to a user

dm_mung3 <- dm %>% mutate(Spend_per_cat = AmountSpent/Catalogs)

# Another example maybe that we want to see the ratio of individual spending to the max spending

dm_mung4 <- dm %>% mutate(Ratio_to_MaxSpent = AmountSpent/max(AmountSpent))

# Select and Mutate are  Column level commands. Now we will look at row level commands

# Suppose we want to find out all those customer who have high history of visit
dm_mung5 <- dm %>% filter(History == "High")

# Suppose we want to find out all those customers who have low history of visit and who spent
# more than 1000 BDT in their last visit

dm_mung6 <- dm %>% filter(History == "Medium" & AmountSpent > 1000)

# Another interesting row level command is the arrange command

#Suppose we want to see our data based on ascending order of salary

dm_mung7 <- dm %>% arrange(Salary)

# Or suppose we want to see our data based on ascenind order to salary and after which highest
# spending amounts are showed first

dm_mung8 <- dm %>% arrange(Salary, desc(AmountSpent))

# There are other two functions in dplyr, which are also very helpful - summarise and group_by

# Suppose you want to know the average, standard deviation of spending, max spending and min spending

dm %>% summarise(Avg_spent = mean(AmountSpent), Sd_Spent = sd(AmountSpent), Min_Spent = min(AmountSpent), Max_Spent = max(AmountSpent))

# But this is not fancy! You already got the result from the summary function. But lets say
# you want this information based on different age groups

dm %>% group_by(Age) %>% summarise(Avg_spent = mean(AmountSpent), Sd_Spent = sd(AmountSpent), Min_Spent = min(AmountSpent), Max_Spent = max(AmountSpent))

# Now things are getting interesting!

# How about getting the same information group by age and marital status?

dm %>% group_by(Age, Married) %>% summarise(Avg_spent = mean(AmountSpent), Sd_Spent = sd(AmountSpent), Min_Spent = min(AmountSpent), Max_Spent = max(AmountSpent))

# Now that we have looked at the 6 commands for munging, you can think some very interesting questions
# to ask. Let me give you a test of 2 such contexts

# Suppose you want to know about the salary and amount spent and history of only those people who own a home
# and live close to the store. Also you want the information to be ordered descending in terms of
# amount spent.

dm_mung9 <- dm %>% filter(OwnHome == "Own" & Location == "Close") %>% select(Salary, AmountSpent, History) %>% arrange(desc(AmountSpent))

# Suppose we want to know the max spending of those people who earn more than 75000 BDT by their gender

dm %>% filter(Salary > 75000) %>% group_by(Gender) %>% summarise(max(AmountSpent))

# Now its your turn to think of interesting questions that you can ask the data at hand


## Data Vizualisations

# Now that you have looked in the basics of data cleaning and queries, we will start our looking
# at the data that we have

# For categorical variables in our data set, the most commonly used type of visualization is bar plots

library(ggplot2)

ggplot(dm, aes(x = Age)) + geom_bar()

# This bar plot shows you the count. But we can look into percentages

ggplot(dm, aes(x = Age)) + geom_bar(aes(y = ..count../sum(..count..)))

# Also we can see how this age is divided into different marital groups

ggplot(dm, aes(x = Age, fill = Married)) + geom_bar()

# This might be a bit misleading, so we change a property in geom_bar called position

ggplot(dm, aes(x = Age, fill = Married)) + geom_bar(position = "dodge")

ggplot(dm, aes(x = Age, fill = Married)) + geom_bar(position = "fill") # better

# Suppose we want to see how this ration of age and gender vary accross differing location

ggplot(dm, aes(x = Age, fill = Married)) + geom_bar(position = "fill") + facet_wrap(~ Location)

# How about we add one more dimension - OwnHome

ggplot(dm, aes(x = Age, fill = Married)) + geom_bar(position = "fill") + facet_wrap(~ Location + OwnHome)

# For numeric data, one ver useful vis is the boxbplot

ggplot(dm, aes(x = 1, y = AmountSpent)) + geom_boxplot()

# How does the age factor in?

ggplot(dm, aes(x = Age, y = AmountSpent)) + geom_boxplot()

#Lets make that a little bit colorful:

ggplot(dm, aes(x = Age, y = AmountSpent, fill = Age)) + geom_boxplot()

# How does marital status factor in?

ggplot(dm, aes(x = Age, y = AmountSpent, fill = Age)) + geom_boxplot() + facet_wrap( ~ Married)

# Another useful type of chart for looking at a distribution of a numeric data type is a histogram

ggplot(dm, aes(x = Salary)) + geom_histogram()

# Here we can specify the number of bins

ggplot(dm, aes(x = Salary)) + geom_histogram(bins = 50)
ggplot(dm, aes(x = Salary)) + geom_histogram(bins = 20)

# A smoother way to look at histograms is density plots

ggplot(dm, aes(x = Salary)) + geom_density()

# But again, who will interested in just the distribution of salary. Lets see how salary is 
# distributed based on age

ggplot(dm, aes(x = Salary, fill = Age)) + geom_density()

# As we see, here is a problem - some areas are not visible. We can solve this in 2 ways

ggplot(dm, aes(x = Salary, fill = Age)) + geom_density() + facet_wrap(~ Age)

ggplot(dm, aes(x = Salary, fill = Age)) + geom_density(alpha = 0.5)

# Besides just looking at a single variable, we can observe relationships between two variables

ggplot(dm, aes(x = Salary, y = AmountSpent)) + geom_point(alpha = 0.4)

# How does this vary based on number of children?

ggplot(dm, aes(x = Salary, y = AmountSpent, size = Children)) + geom_point(alpha = 0.4)

# What about location?

ggplot(dm, aes(x = Salary, y = AmountSpent, size = Children, shape = Location)) + geom_point(alpha = 0.4)

# How about History

ggplot(dm, aes(x = Salary, y = AmountSpent, size = Children, shape = Location, col = History)) + geom_point(alpha = 0.4)

# Can we see marital status there?

ggplot(dm, aes(x = Salary, y = AmountSpent, size = Children, shape = Location, col = History)) + geom_point(alpha = 0.4) + facet_wrap(~ Married)

# This will be end to the data vis section. There are more fancy plots, and feel free to explore
# then online and also in the Help section in R Studio

ggplot(dm, aes(x = Salary, y = AmountSpent)) + geom_density_2d(aes(col = Location))

#trenary plots and k means clustering plots