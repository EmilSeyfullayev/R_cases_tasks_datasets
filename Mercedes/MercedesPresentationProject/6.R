library(rpart)

tree <- rpart(Price ~ ., method = 'anova', data=train)

library(rpart.plot)
prp(tree)

tree_predictions <- predict(tree, test)


desc_tree_RMSE <- (sum((test$Price-tree_predictions)^2)*c/nrow(test)) %>% sqrt()
desc_tree_RMSE <- tree_RMSE
desc_tree_RMSE
