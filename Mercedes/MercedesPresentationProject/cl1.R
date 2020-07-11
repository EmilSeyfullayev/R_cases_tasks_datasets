library(caTools)

set.seed(42)
split <- sample.split(cdf$Class, SplitRatio = 0.75)
train <- subset(cdf, split==T)
test <- subset(cdf, split==F)