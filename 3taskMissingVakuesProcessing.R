#1
library(tidyverse)
library(data.table)
library(skimr)
library(recipes)
library(inspectdf)
data <- fread('C:/Users/user/Desktop/RStudioFiles/RtelimiTaskCase/Session3_task_case/HR.csv')
glimpse(data) %>% view()
skim(data)
inspect_na(data) %>% View()

unique_numeric_values <- data %>%
  select_if(is.numeric) %>%
  map_df(~ unique(.) %>% length()) %>%
  gather() %>%
  arrange(value) %>%
  mutate(key = as_factor(key))

num_factor_names <- unique_numeric_values %>%
  filter(value < 12) %>%
  arrange(desc(value)) %>%
  pull(key) %>%
  as.character()

for (v in num_factor_names) {
  data[[v]] <- as.character(data[[v]])
}

string_factor_names <- data %>%
  select_if(is.character) %>%
  names()


# Recipes Preprocessing
rec_obj <- recipe(~ ., data = data) %>%
  step_string2factor(string_factor_names) %>%
  step_meanimpute(all_numeric()) %>%
  step_modeimpute(all_nominal()) %>%
  prep(stringsAsFactors = FALSE)

data_processed <- bake(rec_obj, data) 

data_processed %>% inspect_na() %>% View()

#2
df <- data_processed

df %>% View()
df <- cbind(df, c(1:nrow(df)))

df <- rename(df, ID = 'c(1:nrow(df))')

df %>% view()

df <- select(df, ID, everything()) 

#3

left <- df %>% group_by(Department, left) %>% count() %>% arrange()
left <- data_frame(left)
left %>% filter(left==1) %>% ggplot(aes(Department, weight=n))+
  geom_bar(color='red', fill='green')+
  theme_bw()
#answer is sales

#4
salary <- df %>% group_by(salary, Department) %>% count() %>% arrange(desc(n))
#in Sales department frequence of people who get low payment is the highest

library(esquisse)
esquisser(salary)

library(ggplot2)

ggplot(salary) +
 aes(x = salary, weight = n) +
 geom_bar(fill = "#0c4c8a") +
 theme_bw() +
 facet_wrap(vars(Department))

#Sales salaries are the lowest

#5
valuable_employees <- df %>% filter(as.numeric(time_spend_company)>3,
              satisfaction_level>0.72,
              as.numeric(number_project)>4,
              left==1)

esquisser(valuable_employees)

library(ggplot2)
p1<- ggplot(valuable_employees) +
 aes(x = salary) +
 geom_bar(fill = "#cb181d") +
 labs(title = "Salary Levels", subtitle = "No high salary") +
 coord_flip() +
 theme_minimal()

p2<- valuable_employees %>% 
  ggplot(aes(satisfaction_level,
            last_evaluation))+
  geom_smooth(size=5)+
  geom_point(size = 10, alpha=0.5)+
  labs(title = 'Satisfaction-Performance Relationshp',
       subtitle = 'Valuable employees who left')+
  xlab('Satisfaction')+
  ylab ('Performance')+
  theme_bw()

not_valuable_employees <- df %>% filter(as.numeric(time_spend_company)<3,
                                    satisfaction_level<0.72,
                                    as.numeric(number_project)<4,
                                    as.numeric(left)!=1)

p3<-not_valuable_employees %>% 
  ggplot(aes(satisfaction_level,
             last_evaluation))+
  geom_smooth(size=5)+
  geom_point(size = 10, alpha=0.5)+
  labs(title = 'Satisfaction-Performance Relationshp',
       subtitle = 'Not-valuable employees who still work')+
  xlab('Satisfaction')+
  ylab ('Performance')+
  theme_bw()
#Employee satisfaction is negatively correlated with performance
#

esquisser(valuable_employees)
library(ggplot2)

p4<- ggplot(valuable_employees) +
 aes(x = promotion_last_5years) +
 geom_bar(fill = "#fb6a4a") +
 labs(x = "Times of Promotion in Last 5 years", title = "Promotion in last 5 years of valuable employees", subtitle = "As we see it is 0") +
 theme_bw()

p2+p3+p1+p4

