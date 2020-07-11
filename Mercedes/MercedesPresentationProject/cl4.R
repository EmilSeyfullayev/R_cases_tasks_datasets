# K Nearest Neighbor model
knn_prediction <- knn(train, test, train$Class, k=7)
accuracy <- mean(test$Class == knn_prediction)
accuracy

  knn_prediction <- NULL
error_rate <- NULL
for (i in 1:20){
  set.seed(42)
  knn_prediction <- knn(train, test, train$Class, k=i)
  error_rate[i] <- mean(test$Class != knn_prediction)
}

k <- 1:20
error_df <- data.frame(error_rate, k)


ggplot(error_df, aes(k, error_rate))+
  geom_point(size=3)+
  geom_line(color='red', size=1)+
  theme_bw()
  
