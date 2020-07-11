install.packages('ISLR')
library(ISLR)

library(dplyr)
#1

df <- Carseats

#2
mutate(df, ID=NA) ->df
View(df)

#3
df <- rename(df, Quality=ShelveLoc)

#4
select(df, Sales, Price, CompPrice, Advertising, 
       Income, everything()) -> df
View(df)

#5
filter(df, Sales>10) ->df2 
arrange(df2, Sales) %>% head()

#6
filter(df, US=='No') %>% filter(Sales==max(Sales)) #82 vs 139

#7
df$Quality %>% unique()
filter(df, Quality=='Good') -> df1
df1$Age %>% mean()

#8
mutate(df, Gelir=Sales*Price) -> df

#9
glimpse(df)
select(df, -c(Quality, Urban, US, ID)) -> df4
arrange(df4, desc(Gelir)) %>% head()

#10
filter(df, Advertising==0) %>% arrange(Urban) -> df6
filter(df6, Urban =='No') %>% count(Urban) # %>% nrow()
filter(df6, Urban =='Yes') %>% nrow()
df6 %>% nrow()






