#load packages in R studio
library(tidyverse)

#import data
read.csv("D:/R for Research/RHB-C02/data/raw/pulse_data.csv")
data <- read.csv("D:/R for Research/RHB-C02/data/raw/pulse_data.csv")
view(data)

#data exploration

# 1. display first few rows
head(data,10)
# 2.display last few rows
tail(data,10)
# 3.sampling
sample_n(data,10)
sampled_data <- sample_n(data,10)

sample_frac(data, .20)
sampled_frac<- sample_frac(data, .20)

# 4.data structure
glimpse(data)

# 5.access column
data$Gender

# 6.if catagorical in char; convert it into factor

data$Gender <- as.factor(data$Gender)
data$Smokes <- as.factor(data$Smokes)
data$Alcohol <- as.factor(data$Alcohol)
data$Exercise <- as.factor(data$Exercise)
data$Ran <- as.factor(data$Ran)

# 7. summary stats
summary (data)

## data manipulation
# 1 desired column selection


