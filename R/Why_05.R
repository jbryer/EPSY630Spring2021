library(tidyverse)

n <- 16 # Number of observations per sample
nSamples <- 15 # Number of samples to take

r <- seq(0.1, 0.6, length.out = nSamples) %>% sample()
samples <- list()
results <- data.frame()
for(i in 1:nSamples) {
	sim.r <- r[i]
	Sigma <- matrix(c(1,sim.r,sim.r,1),2,2)
	sample <- mvrnorm(n = n, mu = rep(0, 2), Sigma = Sigma, empirical=TRUE)
	sample <- as.data.frame(sample)
	names(sample) <- c('X', 'Y')
	test <- cor.test(sample[,1], sample[,2])
	test$p.value

	sample$Iteration <- i
	sample$r <- cor(sample$X, sample$Y)
	sample$p <- test$p.value
	samples[[i]] <- list(sample = sample,
						 r = sim.r,
						 p = test$p.value)
	results <- rbind(results, data.frame(
		sample
	))
}

results[!duplicated(results$Iteration),] %>% arrange(p)

results %>% dplyr::arrange(p) %>%
	ggplot( aes(x = X, y = Y, color = p <= 0.05)) +
	geom_point() + facet_wrap(~ round(p, digits = 3))
