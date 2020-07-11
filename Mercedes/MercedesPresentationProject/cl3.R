#Decision tree

tree <- rpart(Class ~ . ,
              method='class',
              data = train)

pred_proba_tree <- predict(tree,
                           test)

fitted_results_tree <- ifelse(pred_proba_tree[,2]>0.5, 1, 0)
miss_class_error_tree <- mean(fitted_results_tree != test$Class)
accuracy_tree <- 1 - miss_class_error_tree

accuracy_tree

table(test$Class, pred_proba_tree[,2]>0.5)

prp(tree)



