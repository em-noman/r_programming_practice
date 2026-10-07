# load package 
library(tidyverse)

# check built-in datasets 
data()

# load built-in datasets 
data(airquality)

# View first 6 rows
head(airquality)

# View last 6 rows
tail(airquality)

# Dataset dimensions
dim(airquality)

# Column names
names(airquality)

# Structure
glimpse(airquality)

# Summary statistics
summary(airquality)

# Problem with missing values 
mean(airquality$Temp)
mean(airquality$Ozone)

# How to deal with missing values?
# remove missing value 
mean(airquality$Ozone, na.rm = T)
median(airquality$Ozone, na.rm = T)

# Find missing values (if NA = TRUE, if not = FALSE)
is.na(airquality)

# Count total missing values
sum(is.na(airquality))

# Find missing values per column
colSums(is.na(airquality))

# Find rows with no missing values 
airquality[complete.cases(airquality), ]

# Find rows containing missing values
airquality[!complete.cases(airquality), ]

# which function 
which(complete.cases(airquality))
which(!complete.cases(airquality))

# Remove rows containing NA
airquality_clean <- na.omit(airquality)
sum(is.na(airquality_clean))

# imputation
# 2. if numeric variable (imputation)
# filling missing values with center (mean, median)
airquality_clean2 <- airquality |> 
  mutate(Ozone = ifelse(
    is.na(Ozone), 
    mean(Ozone, na.rm = T), 
    Ozone
  )) |> 
  mutate(Solar.R = ifelse(
    is.na(Solar.R), 
    mean(Solar.R, na.rm = T), 
    Solar.R
  ))
sum(is.na(airquality_clean2))

# export 
write.csv(airquality_clean2, "data/processed/airquality_clean2.csv", row.names = FALSE)
data <- read.csv("data/processed/airquality_clean2.csv")


# cbind() — combine by columns (row must be similar)
df1 <- data.frame(
  ID = 1:3,
  Name = c("A", "B", "C")
)

df2 <- data.frame(
  Age = c(20, 25, 30),
  Score = c(80, 90, 85)
)

cbind(df1, df2)
bind_cols(df1, df2)

# rbind() — combine by rows (column must be similar)
df3 <- data.frame(
  ID = 1:3,
  Name = c("A", "B", "C")
)

df4 <- data.frame(
  ID = 4:6,
  Name = c("D", "E", "F")
)

rbind(df3, df4)
bind_rows(df3, df4)

# wide data 
# This is wide format because Week1, Week2, and Week3 are separate columns.
wide_df <- data.frame(
  ID = c(1, 2, 3),
  Name = c("A", "B", "C"),
  Week1 = c(10, 20, 30),
  Week2 = c(15, 25, 35),
  Week3 = c(20, 30, 40)
)

# wide to long data 
long_df <- wide_df |> 
  pivot_longer(
    cols = 3:5, 
    names_to = "Week", 
    values_to = "Value"
  )

# long to wide data 
long_df |> 
  pivot_wider(
    names_from = Week, 
    values_from = Value
  )

# merge data 
df1 <- data.frame(
  ID = c(1, 2, 3, 4),
  Name = c("A", "B", "C", "D")
)

df2 <- data.frame(
  ID2 = c(1, 2, 3, 5),
  Age = c(20, 25, 30, 35)
)

# left_join() keeps all observations from the first data frame.
# if column name is the same 
df1 |> 
  left_join(df2, by = "ID")

# if column name is not same
df1 <- data.frame(
  IDx = c(1, 2, 3, 4),
  Name = c("A", "B", "C", "D")
)

df2 <- data.frame(
  ID2 = c(1, 2, 3, 5),
  Age = c(20, 25, 30, 35)
)

df1 |> 
  left_join(df2, by = c("IDx" = "ID2"))


# ID 1 → matched
# ID 2 → matched
# ID 3 → matched
# ID 4 → no match → NA
# This is probably the most commonly used join in practical data analysis.

# Summary
# 1. Missing handling 
# 2. col and row binding 
# 3. data layout transformation (wide to long, long to wide)
# 4. left join 


