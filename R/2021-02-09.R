# R script for 2021-02-09 class

# We will be working with the legosets data.frame from the brickset package
library(brickset)
data(legosets)

library(ggplot2)
library(TriMatch)
library(psych)

data("tutoring")
str(tutoring)

head(legosets$category)
length(legosets$category)
table(legosets$category)
tab_out <- table(legosets$category)
tab_out
prop.table(tab_out)

letters
letters %in% c('a','e','i','o','u')
which(letters %in% c('a','e','i','o','u'))
letters %in% c('a','e','i','o','u') %>% which()
vowels <- letters %in% c('a','e','i','o','u')
vowels
letters[vowels]

legosets[1,]
legosets[,1]
legosets[1,1]

mylego <- legosets %>% select(setID, pieces, theme, availability, minifigs, starts_with('US_'))
head(mylego)


legosets %>% group_by(themeGroup)

test <- c(1, 5, 10)
mean(test)
test <- c(test, NA)
test
mean(test)
mean(test, na.rm = TRUE)

library(psych)
?describe


ggplot(legosets, aes(x=pieces, y=US_retailPrice, size=minifigs, color=availability)) +
	geom_point(alpha = 0.25)

data(tutoring, package="TriMatch")
ggplot(tutoring, aes(x = Age)) + geom_histogram(bins = 20)
ggplot(tutoring, aes(x = Age)) + geom_density()
table(tutoring$Grade)
ggplot(tutoring, aes(x = Age, color = factor(Grade))) + geom_density()
ggplot(tutoring, aes(x = Age, color = factor(Grade))) + geom_density() + facet_wrap(~ Grade, ncol = 1)
ggplot(tutoring, aes(x = Age, fill = factor(Grade))) + geom_histogram() + facet_wrap(~ Grade, ncol = 1)

str(tutoring)


ggplot(arbuthnot, aes(x = year, y = boys)) + geom_point()
ggplot(arbuthnot, aes(x = year, y = boys)) + geom_path() + ggtitle('Arbuthnot')

ggplot(present, aes(x = year, y = boys)) + geom_point()
ggplot(present, aes(x = year, y = boys)) + geom_path() + ggtitle('Present')

ggplot() +
	geom_line(data = arbuthnot, aes(x = year, y = boys), color = 'darkgreen') +
	geom_line(data = present, aes(x = year, y = boys), color = 'blue')

describe(arbuthnot$boys)
describe(present$boys)

