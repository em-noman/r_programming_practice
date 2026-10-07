# Install required packages 
install.packages("tidyverse")
install.packages("gtsummary")
install.packages("gt")


# Load required packages 
library(tidyverse)
library(gtsummary)
library(gt)

# Load the data 
raw_data <- read.csv("data/raw/pulse_data.csv")
# Preprocess your data 
# Check the data structures 
glimpse (raw_data)

# Convert char to factor (because these are categorical variables)
raw_data$Gender <- as.factor(raw_data$Gender)
raw_data$Smokes <- as.factor(raw_data$Smokes)
raw_data$Alcohol <- as.factor(raw_data$Alcohol)
raw_data$Exercise <- as.factor(raw_data$Exercise)
raw_data$Ran <- as.factor(raw_data$Ran)
# Check missing values 
is.na(raw_data)
sum(is.na(raw_data))
colSums(is.na(raw_data))

# Impute missing values with mean / median 
clean_data <- raw_data |> 
  mutate(Height = ifelse(
    is.na(Height), 
    mean(Height, na.rm = T), 
    Height
  )) |> 
  mutate(Pulse1 = ifelse(
    is.na(Pulse1), 
    mean(Pulse1, na.rm = T), 
    Pulse1
  )) |> 
  mutate(Pulse2 = ifelse(
    is.na(Pulse2), 
    mean(Pulse2, na.rm = T), 
    Pulse2
  ))

# check missing values 
colSums(is.na(clean_data))

# duplicated rows 
duplicated(clean_data)
sum(duplicated(clean_data))
# Explore the clean data 
write.csv(clean_data, "data/processed/pulse_data_clean.csv", row.names = FALSE)
# Import clean data 
data <- read.csv("data/processed/pulse_data_clean.csv")
# Statistical Summary 
# 1. Numeric Summary
# 2. Graphical Summary (data visualization)

# Numerical Summary 
# Numeric Variables 
# Center (mean, median, mode)
# Variation (sd, var)
# Center +/- Variation 

# min
min(data$Age)

# max 
max(data$Age)

# range 
max(data$Age) - min(data$Age)

# mean 
mean(data$Age)

# sd 
sd(data$Age)
# Statisticl Presentation: Mean (SD)
# Mean = where the observations are centered 
# Sd = how much the observations vary around that center 

# median 
median(data$Age)
# quantile (25% = Q1)
# About 25% of observations (sample) have an "Your Variable" <= Value 
quantile(data$Age, .25)
# Interpretation 1: About 25% of observations have an age <= 19
# Interpretation 1: About 75% of observations have an age >= 19

# quantile (50% = Q2)
# About 50% of observations (sample) have an "Your Variable" <= Value 
quantile(data$Age, .5)
# Interpretation 1: About 50% of observations have an age <= 20
# Interpretation 1: About 50% of observations have an age >= 20
# quantile (75% = Q3)
# About 75% of observations (sample) have an "Your Variable" <= Value 
quantile(data$Age, .75)
# Interpretation 1: About 75% of observations have an age <= 21
# Interpretation 1: About 25% of observations have an age >= 21

# Statistic ~ Interpretation
# If quantile(Variable, 0.25) ~ 25% <= Q1
# If quantile(Variable, 0.5) ~ 50% <= Q2
# If quantile(Variable, 0.75) ~ 75% <= Q3
# IQR = Q3 - Q1 
quantile(data$Age, .75) - quantile(data$Age, .25)

# Statisticl Presentation: Median (IQR)
# Median = tells you the center 
# IQR = tells you where the middle 50% of observations lie 

# Impact of outliers 
# mean is sensitive to outliers 
ages <- c(11, 22, 14, 15, 17, 19)
mean(ages)

ages2 <- c(11, 22, 14, 15, 17, 19, 120)
mean(ages2)
# sd 
sd(ages)
sd(ages2)

# range is sensitive outliers  
max(ages) - min(ages)
max(ages2) - min(ages2)

# median is not sensitive to outliers 
ages <- c(11, 22, 14, 15, 17, 19)
median(ages)

ages2 <- c(11, 22, 14, 15, 17, 19, 120)
median(ages2)
# IQR
quantile(ages, 0.75) - quantile(ages, 0.25)
quantile(ages2, 0.75) - quantile(ages2, 0.25)

# In summary Numeric Analysis 
# 1. min, max, range 
# 2. mean, sd 
# 3. median, IQR 
# 4. fivenum summary: min, max, mean, Q1, Q2, Q3
fivenum(data$Age)
# Categorical summary 
# 1. frequency (counts)
table(data$Gender)

# 2. percentage (%)
prop.table(table(data$Gender))
prop.table(table(data$Gender)) * 100 

table(data$Gender, data$Exercise)
prop.table(table(data$Gender, data$Exercise)) * 100
