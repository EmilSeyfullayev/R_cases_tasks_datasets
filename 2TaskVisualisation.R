ISLR::Carseats -> df
library(dplyr)
glimpse(df)
View(df)
#2 Change column names
df <- rename(df, satis=Sales)
df <- rename(df, Deyeri = CompPrice, Gelir=Income, )
df <- rename(df, Marketinq = Advertising, Ehalisi = Population, Bazar_qiymeti=Price)
df <- rename(df, Keyfiyyeti=ShelveLoc)
df <- rename(df, Yasi = Age)
df <- rename(df, Tehsili = Education)
df <- rename(df, sheherde_yerlewir = Urban)
df <- rename(df, ABS = US)
#3 Save and read file
write.csv(df, 'Usaq oturacaqlarin satisi')
df <- read.csv('Usaq oturacaqlarin satisi')
#4
library(ggplot2)
ggplot(df, aes(Deyeri, Bazar_qiymeti))+
  geom_point(color = 'red', size=4, alpha=0.4)+
  theme_bw()
#5
ggplot(df, aes(Deyeri, Bazar_qiymeti))+
  geom_point(aes(color = Keyfiyyeti, size=Gelir), alpha=0.4)+
  theme_bw()
#6
ggplot(df, aes(Deyeri, Bazar_qiymeti))+
  geom_point(aes(color = sheherde_yerlewir, size=5), alpha=0.4)+
  theme_bw()

ggplot(df, aes(Deyeri, Bazar_qiymeti))+
  geom_point(aes(color = sheherde_yerlewir, size=5), alpha=0.4)+
  facet_grid(ABS~Tehsili)+
  theme_bw()

ggplot(df, aes(Tehsili))+
  geom_bar(aes(fill=ABS), color='black',size=1, alpha=0.4)+
  scale_y_continuous(breaks = seq(0,50,5))+
  theme_bw()

#7
ggplot(df, aes(Deyeri, Bazar_qiymeti))+
  geom_boxplot(aes(color=Keyfiyyeti), size=2)+
  scale_y_continuous(breaks = seq(0,200,10))+
  theme_bw()
#8
ggplot(df, aes(satis))+
  geom_histogram(aes(fill=sheherde_yerlewir), size=1,
                 alpha=0.4, color='black', bins=12)+
  theme_bw()
#9
ggplot(df, aes(satis))+
  geom_histogram(aes(fill=sheherde_yerlewir), size=1,
                 alpha=0.4, color='black', bins=12)+
  facet_grid(Keyfiyyeti~.)+
  theme_bw()
#10
ggplot(df, aes(satis))+
  geom_histogram(aes(fill=sheherde_yerlewir), size=1,
                 alpha=0.4, color='black', bins=12)+
  facet_grid(Keyfiyyeti~.)+
  labs(title = 'Satışlar üzrə mağazaların yerləşməsi')
  theme_bw()






