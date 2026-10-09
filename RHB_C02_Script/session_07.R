# Load required packages 
library(tidyverse)
library(gtsummary)
library(gt)
#load required data
data<-read.csv("data/processed/pulse_data_clean.csv")
# Descriptive summary
# https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html

data |> 
  tbl_summary(
    type = c ("Smokes", "Alcohol", "Ran") ~ "categorical",
    statistic = all_continuous() ~ "{mean}±{sd}"
  ) |> 
    as_gt() |> 
    gtsave("Results/Tables/table1_descriptive.docx")

# Difference Comparative Table (Numeric ~ Category => Difference)   
data |> 
  select(Height,Weight, Age, Pulse1,Pulse2,Gender) |> 
  tbl_summary(by= Gender )|> 
  as_gt() |> 
  gtsave("Results/Tables/table2_difference.docx")

# Association Comparative Table (Category ~ Category => Association)

data|> 
  select(Gender, Exercise, Ran, Alcohol, Smokes) |> 
  tbl_summary(by = Gender, type = c("Smokes", "Alcohol", "Ran") ~ "categorical") |> 
  as_gt() |> 
  gtsave("Results/Tables/table3_association.docx")

# Is is statistically significant? 
data |> 
  select(Age, Height, Weight, Pulse1, Pulse2, Gender) |> 
  tbl_summary(by = Gender) |>
  add_p() |> 
  bold_p( t= 0.05) |> 
  as_gt() |> 
  gtsave("Results/Tables/Table4_Difference_Sigficance_Test.docx")
  

data|> 
  select(Gender, Exercise, Ran, Alcohol, Smokes) |> 
  tbl_summary(by = Gender, type = c("Smokes", "Alcohol", "Ran") ~ "categorical") |> 
  add_p() |> 
  bold_p(t =0.05) |> 
  as_gt() |> 
  gtsave("Results/Tables/Table5_Association_Sigficance_Test.docx")

  
  
  
  


  





