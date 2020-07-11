cor(df[,1:4])
library(corrplot) #plot correlation
corrplot(cor(df[,1:4]))

ggplot(df, aes(Price))+ #Plot Histogram
  geom_histogram(bins=8, color='black', fill='blue', size=0.5, alpha=0.4)+
  theme_bw()

ggplot(df, aes(Year))+ #Plot Density Function Graphs
  geom_density(color='black', fill='yellow', size=0.5, alpha=0.4)+
  theme_bw()

ggplot(df, aes(Year, Price))+ #Plot Scatterplot, X=Year, Y=Price, Z=Went
  geom_point(aes(color=Went), size=15)+
  scale_color_gradientn(colours =  rev(c('red', 'yellow', 'green')))+
  theme_bw()
