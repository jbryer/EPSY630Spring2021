library(ggplot2)
library(fGarch)

N <- 10000

# x <- rnbinom(N, 10, .1)
x <- rsnorm(N, mean = 0, sd = 1, xi = 1)

hist(x,
	 xlim=c(min(x),max(x)), probability=T, nclass=max(x)-min(x)+1,
	 col='lightblue', xlab=' ', ylab=' ', axes=F)
lines(density(x,bw=1), col='red', lwd=3)



