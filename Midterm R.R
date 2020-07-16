#Part 1---------
# 1) True
# 2) True
# 3) True


#Part 1

# 1) arrange() with dplyr or sort() - built in
# 2) 1,3,5,7,9
# 3) 6
# 4) seq(2,11,3)

#Part 1

# 1) c
# 2) a
# 3) a
# 4) d
# 5) a

# Part 2 ---------

#1
df <- mtcars

#2
#df$ID <- c(1:nrow(df))

df$ID <- 'cars'

#3
library(dplyr)
colnames(df)

df %>% 
  rename(Carburetors=carb) -> df

colnames(df)

#4
df %>% 
  select(disp:wt)

#5
df %>% 
  select(hp) %>% 
  arrange(hp %>% as.numeric()) %>% 
  row.names() %>% 
  .[1] #Honda Civic

#6
df %>% 
  select(Carburetors, everything()) -> df

df  

#7
df %>% 
  mutate(newcol=paste(am,gear, sep = "<->"))


#8
df %>% 
  transmute(newcol= disp/cyl)

#9

df$wt %>% sort(decreasing = T)

df %>% 
  select(wt) %>% 
  arrange(desc(wt))

#10
df %>% 
  arrange(hp %>% 
            as.numeric()) %>% 
  arrange(qsec %>% 
            as.numeric()
          %>% desc())

#11

library(ggplot2)

df %>% 
  ggplot(aes(cyl))+
  geom_histogram(size=10)+
  theme_bw()

#12
df %>% 
  ggplot(aes(hp, fill= as.factor(cyl)))+
  geom_bar()+
  theme_bw()

#df %>% 
 # ggplot(aes(cyl, fill = hp))+
  #geom_bar()+
  #theme_bw()

#13
df %>% 
  ggplot(aes(wt,qsec))+
  geom_point()+
  geom_smooth()+
  theme_bw()

#relationship is weak, I think so

#14
df %>% 
  ggplot(aes(wt,qsec, color=cyl, size=vs))+
  geom_point()+
  geom_smooth()+
  theme_bw()

#15
df %>% 
  ggplot(aes(wt,qsec, color=cyl, size=vs))+
  geom_point()+
  geom_smooth()+
  facet_grid(~am, scales = 'free')+
  theme_bw()

  
  
  
  
  
  
  
  
  


