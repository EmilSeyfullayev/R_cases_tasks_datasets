#Neural Network Model

library(neuralnet)

nn <- neuralnet(Price ~ Year, data = train[,1:2],
                hidden = c(3,7,3),
                linear.output = T)

nn_predictions <- compute(nn, test[1:2])

desc_nn_RMSE <- (sum((test$Price-nn_predictions$net.result)^2)*c/nrow(test)) %>% sqrt()
desc_nn_RMSE 

nn_predictions$net.result %>% data.frame() -> df_nn
df_nn$Year <- subset(df, split==F)$Year
df_nn$Price <- subset(df, split==F)$Price
df_nn




ggplot(df_nn, aes(Price, df_nn[,1]))+
  geom_point(size=10, color='red', alpha=0.4)+
  ylab('Predicted Price')+
  xlab('Actual Price')+
  ggtitle('The more x=y, the more accurate predictions are')+
  theme_bw()

ggplot(df_nn, aes(Year, df_nn[,1]))+
  geom_point(size=10, color='green', alpha=1)+
  ylab('Predicted Price')+
  ggtitle('Model Prediction Curve Based on Year')+
  theme_bw()

ggplot(df_nn, aes(Year, df_nn[,1]))+
  geom_smooth(size=2, color='green', alpha=0.4)+
  theme_bw()

ggplot(df, aes(Year, Price))+
  geom_point(size=10, color='blue', alpha=0.5)+
  ggtitle('Whole Data, Effect of Year on Price')+
  theme_bw()
  
























