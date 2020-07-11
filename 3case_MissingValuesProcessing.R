library(tidyverse)
library(data.table)
library(skimr)
library(recipes)
library(inspectdf)

#1
df1 <- read_csv('manager survey data.csv')
df2 <- read_csv('general data.csv')
df3<- read_csv('employee survey data.csv')

df1 %>% 
  left_join(df2, by=c('EmployeeID'='EmployeeID')) %>% 
  left_join(df3, by=c('EmployeeID'='EmployeeID')) -> df

#2
df %>% inspect_na()

#3
df %>% skim()
df %>% str()

df$EmployeeID <- df$EmployeeID %>% as.factor()

#4
value_count <- c()
names <- colnames(df)

for (i in names){
  df[[i]] %>% 
    unique() %>% 
    length() %>% 
    append(value_count) -> value_count 
}

value_count

count <- matrix(data = c(names))
count <- count %>% cbind(rev(value_count))
count <- data.frame(count)

count %>% arrange(as.numeric(X2)) -> count
count %>% view()

#5

count %>% 
  filter(as.numeric(X2)<9) %>% 
  select(X1) %>% 
  c() -> factor_column_names


for (i in factor_column_names[["X1"]]) {
  df[[i]] <- as.factor(df[[i]])
} 

df %>% skim()

factor_column_names[["X1"]] %>% length()

#6

inspect_na(df)

string_factor_names <- df %>%
  select_if(is.character) %>%
  names()

rec_obj <- recipe(~ ., data = df) %>%
  step_string2factor(string_factor_names) %>%
  step_meanimpute(all_numeric()) %>%
  step_modeimpute(all_nominal()) %>%
  prep(strings_as_factor=T)


df_processed <- bake(rec_obj, df) 

df_processed$JobRole <- as.character(df_processed$JobRole)

df_processed %>% skim()

#6


mutate(df_processed, 
       Experience_Level = 
         ifelse(df_processed$TotalWorkingYears>10,
        'Experienced',
        'Not-Experienced')) -> df_final

df_final %>% skim()







  


