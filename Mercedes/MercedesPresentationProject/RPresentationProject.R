df <- read.csv('Mercedes.csv') #download file

library(ggplot2) #necessary libraries
library(dplyr)

select(df, -c (X, Xs_Transformed)) -> df #delete X and Xs_transformed columns

summary(df) #summary
str(df) #structure
is.na(df) %>% any() #any missing value?


