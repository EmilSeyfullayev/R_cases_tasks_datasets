#Loading and assigning dataframe
library(DAAG)
df <- nassCDS

#Changing some variable names
rename(df, Speed=dvcat) -> df
rename(df, Airbag_deploy=abcat) -> df

#Unbelted dead drivers count
filter(df, dead=='dead', seatbelt=='none') %>% nrow() #680

#In case of Women, which parts damaged most, frontal or back parts
filter(df, sex=='f', frontal==1) %>% nrow() #7493
filter(df, sex=='f', frontal==0) %>% nrow() #4755

#from 2001, in which cases airbags' absence caused death
filter(df, yearacc>=2001, airbag=='none', dead=='dead') %>%  nrow() #154
