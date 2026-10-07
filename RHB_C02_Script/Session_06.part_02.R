# Load required packages 
library(tidyverse)
library(gtsummary)
library(gt)
# Load the data 
data <- readxl::read_excel("data/raw/AMR_KAP_RAW.xlsx", sheet = 2)
# Table 1. Demographic characteristics of study participants 
data |> 
  select(1:11) |> 
  tbl_summary() |> 
  as_gt() |> 
  gtsave("results/tables/Table1.docx")


