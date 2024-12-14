#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Canadian Grocery Vendor data.
# Author: Luka Tosic
# Date: 26 November 2024
# Contact: luka.tosic@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

test_simulate_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("test_simulate_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 10000 rows
if (nrow(test_simulate_data) == 10000) {
  message("Test Passed: The dataset contains 10000 rows")
} else {
  stop("Test Failed: number of rows is not 10000")
}

# Check if the dataset has 5 columns
if (ncol(test_simulate_data) == 5) {
  message("Test Passed: The dataset contains 5 columns.")
} else {
  stop("Test Failed: The dataset does not contain 5 columns.")
}

# Check if 'month' column contains only valid months
valid_months <- 1:12
if (all(test_simulate_data$month %in% valid_months)) {
  message("Test Passed: The 'month' column contains only valid month numbers.")
} else {
  stop("Test Failed: The 'month' column contains invalid month numbers.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(test_simulate_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in vendors.
if (all(test_simulate_data$vendors != "")) {
  message("Test Passed: There are no empty strings in vendors.")
} else {
  stop("Test Failed: One or more rows contains an empty string in vendors.")
}

# Check if there are no empty values in id.
if (all(!is.null(test_simulate_data$id))) {
  message("Test Passed: There are no empty values in id.")
} else {
  stop("Test Failed: One or more rows have an empty value in null.")
}

# Check whether price is always greater than or equal to 0.
if (all(test_simulate_data$price >= 0)) {
  message("Test Passed: Prices are always greater than or equal to 0.")
} else {
  stop("Test Failed: One or more rows has a price not greater than or equal 0")
}

# Ensure size is always greater or equal to 0.
if (all(test_simulate_data$size >= 0)) {
  message("Test Passed: Sizes are always greater or equal to 0.")
} else {
  stop("Test Failed: One or more rows has a size not greater than or equal 0.")
}

# Ensure cost_per_size is always greater or equal to 0.
if (all(test_simulate_data$cost_per_size >= 0)) {
  message("Test Passed: Costs per size are always greater or equal to 0.")
} else {
  stop("Test Failed: One or more rows has a cost per size not greater than or equal 0.")
}