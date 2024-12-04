#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("~/final-paper/data/02-analysis_data/analysis_data.parquet")

### Model data ####
first_model <-
  lm(
    formula = current_price ~ total_units + vendor + bread_type + old_price,
    data = analysis_data)


#### Save model ####
saveRDS(
  first_model,
  file = "~/final-paper/models/first_model.rds"
)


