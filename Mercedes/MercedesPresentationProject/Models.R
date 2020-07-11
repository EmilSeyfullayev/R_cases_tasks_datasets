#Linear, Decision Tree Regression and Neural Net

lm_model <- lm(Price ~ ., data=train) #model itself

summary(lm_model) #summary

predict(lm_model, test) -> lm_predictions #predictions

######## descaling RMSE
miny <- min(df$Price)
maxy <- max(df$Price)
a <- (maxy-miny)
c <- a^2

lm_MSE <- sum((true_test_y-lm_descaled_predictions)^2)/nrow(test)
desc_lm_RMSE <- (sum((test$Price-lm_predictions)^2)*c/nrow(test)) %>% sqrt()
desc_lm_RMSE
