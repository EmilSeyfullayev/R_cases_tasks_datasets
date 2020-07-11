#Train Test Split

library(caTools)

set.seed(42)

split <- sample.split(sdf$Price, SplitRatio = 0.8)

train <- subset(sdf, split==T)
test <- subset(sdf, split==F)
