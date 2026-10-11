install.packages("easystats")
install.packages("report")

# Load required packages 
library(tidyverse)
library(easystats)
library(report)
library(gtsummary)
library(gt)


# Explore data 
iris

# Linear Regression 
# y (dependent) = mx(independent) + c
# lm(y ~ x)
# lm(Sepal.Length ~ Species)

data<- read.csv("data/processed/pulse_data_clean.csv")
uv_model<- lm(Pulse1~Exercise, data=data)
uv_model|>
  tbl_regression()|> 
  bold_p(t = 0.05)
report(uv_model) |> 
summary()

mv_model <- lm(Pulse1 ~ Height + Weight + Age, data = data)
mv_model
report(mv_model) |> 
  summary()
# read diabetes data 
dib_data <- read.csv("data/raw/pima-indians-diabetes.csv")
# str 
glimpse(dib_data)
dib_data$Diabetes <- as.factor(dib_data$Diabetes)

# UV Logistic Regression 
uv_logreg <- glm(Diabetes ~ BloodPressure, data = dib_data, family = "binomial")
report(uv_logreg)
# MV Logistic Regression 
mv_logreg <- glm(Diabetes ~ Pregnancy + Glucose + BloodPressure + Tricep + Insulin + BMI + DPF + Age, data = dib_data, family = "binomial")
report(mv_logreg) |> 
  summary()

mv_logreg |>
   tbl_regression(exponentiate = T) |>
  bold_p(t = 0.05) |> 
  as_gt() |> 
  gtsave("results/tables/UV_LogReg.docx")


