#Separation of data to apply both to regression and classification problems

separation <- function(price){ 
  if (price>16000){
    return(1)
  }else{
    return(0)
  }
}

sapply(df$Price, separation) -> Class

cdf <- cbind(select(df, -Price), Class)
