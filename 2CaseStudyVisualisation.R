library(tidyverse)
#1
df <- read.csv('Superstore.csv')
df %>% view()
#2
df %>% colnames()
df  <-  rename(df, 
              Row_ID = Row.ID,
              Order_ID = Order.ID,
              Order_Date = Order.Date,
              Ship_Date = Ship.Date,
              Customer_Name = Customer.Name,
              Postal_Code = Postal.Code,
              Product_ID = Product.ID,
              Sub_Category = Sub.Category,
              Product_Name = Product.Name)

df  <-   rename(df, 
               Ship_Mode = Ship.Mode,
               Customer_ID = Customer.ID)


change <- function(columns){
  for (names in columns){
    for (character in names){
      if(character =='.'){
        return(character='_')
      }else{
        return(character)
      }
    }
  }
  return(names)
}
sapply(colnames(df), change)


#3
ggplot(df, aes(Sales, Profit))+
  geom_point(size=10, color='red', alpha=0.4)+
  geom_smooth()+
  theme_bw()
#4
ggplot(df, aes(Segment, Discount))+
  geom_bar(stat = 'identity', color='red')+
  theme_bw()
#5
ggplot(df, aes(Sales, Profit))+
  geom_point(aes(color=Region))+
  facet_grid(Category~.)+
  theme_bw()
#6
ggplot(df, aes(Category, Quantity))+
  geom_bar(stat = 'identity', fill='red', alpha=0.4)+
  theme_bw()
#7
ggplot(df, aes(Sales, Profit))+
  geom_boxplot(aes(color=Region))+
  theme_bw()
#8
df %>% ggplot(aes(Ship_Mode, Quantity))+
  geom_boxplot(color='black',aes(fill=Ship_Mode))+
  scale_x_discrete(c('red','blue', 'yellow', 'green'))+
  facet_grid(Category~.)+
  theme_bw()
#9
df %>% ggplot(aes(Ship_Mode, Quantity))+
  geom_boxplot(color='black',aes(fill=Ship_Mode))+
  scale_x_discrete(c('red','blue', 'yellow', 'green'))+
  facet_grid(Category~.)+
  labs(title = 'Məhsul kateqoriyasına görə daşınma')+
  theme_bw()
#10
write.csv(df, 'SalesDataset')







