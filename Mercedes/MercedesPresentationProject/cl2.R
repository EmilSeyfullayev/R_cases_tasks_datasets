#Logistic Model

log_model <- glm(Class ~ . ,
                 family = binomial(link = 'logit'),
                 data = train)

predicted_probabilities <- predict(log_model,
                                   test,
                                   type = 'response')


fitted_results <- ifelse(predicted_probabilities>0.5, 1, 0)
miss_class_error <- mean(fitted_results != test$Class)
accuracy <- 1 - miss_class_error

accuracy


table(test$Class, predicted_probabilities>0.5)

predicted_probabilities
