#MinMax Scaling with 0 to 1 range

maxs <- apply(df, 2, max)
mins <- apply(df, 2, min)

scale(df, center = mins, scale = maxs-mins) -> sdf

sdf <- data.frame(sdf)
