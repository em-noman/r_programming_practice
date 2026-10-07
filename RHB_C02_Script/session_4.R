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

#summary(data exploration)

# import(data)
# view(data)
# names(data)
# access data (data$Gender)
# 1. Head
# 2. Tail
# 3. sample_n
# 4. sample_frac
# 5. glimpse (data)
# 6. if categorical in char; convert it to factor
#data$Gender <- as.factor(data$Gender)
# 7.summary (data)



# data manipulation
# 1. Desired column selection

# select single column using column name
select(data, Age)

# select multiple column using column name
select(data,Age,Smokes,Gender)

# select single and multiple column using number
select (data, 2,5,9)
select(data, 1,2,4,5,7)
select(data, c(1,3,5,7,8))

# select column using range
select(data, 3:5)

# select column using starts_with and ends_with() function
select(data, starts_with("A"))
select (data, ends_with("r"))

# 2. filter rows (<,>,==,<=,>=,AND,OR)
filter(data,Age <=18)
filter(data, Smokes=="Yes")
filter(data, Age>18 &  Ran=="Yes")
filter(data, Age>18 &  Ran=="Yes" & Smokes=="Yes")
filter(data, Age>18 | Ran=="Yes")
filter(data, Age>18 | Ran=="Yes" | Smokes=="Yes")

# 3. new variable
mutate(data,Age_group = ifelse(Age >18,"Adult","Child"))
data <- mutate(data,Age_group = ifelse(Age >18,"Adult","Child"))

# 4. Rename column
data <- rename(data, smoking_status=Smokes) 

## select and filter
# 1. select columns from data (Age,Gender,Height,Weight)
# 2. create new data variable (selected_data)
# 3. filter on 'selected_data'

selected_data <- select(data,Age,Gender,Height,Weight)
filter(selected_data, Age>18)

# formal way for above task ( Pipe Operator- CONTRL+SHIFT+M )
data |> 
  select(Age,Gender,Height,Weight) |> 
  filter(Age>18)

# 5. Grouping and summarise data
data |> 
  group_by(Gender) |> 
  summarise(mean_age=mean(Age), sd_age= sd(Age))

data |> 
  group_by(Gender) |> 
  summarise(mean_age=mean(Age), sd_age= sd(Age),max_Age=max(Age),min_age=min(Age))

#summary(data manipulation)
# 1.select
# 2.filter
# 3.mutate
# 4.rename
# 5.group_by
# 6.summarise




