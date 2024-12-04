#### Preamble ####
# Purpose: Simulates a dataset of grocery items from Canadian vendors, 
# with an item id, cost and mass.
# Author: Luka Tosic
# Date: 26 November 2024
# Contact: luka.tosic@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
set.seed(731)


#### Simulate data ####
# vendor names
vendors <- c(
  "Voila", "T&T", "Loblaws", "No Frills", "Metro", "Galleria", 
  "Walmart", "Save-On-Foods")
vendor_probs <- c(0.1, 0.15, 0.2, 0.1, 0.1, 0.15, 0.1, 0.1)


# Create a dataset by randomly assigning states and parties to divisions
#id is a unique 1 to 5 digit number, price of 0 to $50, size of 0 to 1000grams
sim_data <- tibble(
  vendors = sample(vendors, size = 10000, replace = TRUE, prob = vendor_probs),
  id = sample(1:99999, size = 10000, replace = FALSE),
  price = round(runif(10000, min = 0, max = 50.00), 2),
  size = round(runif(10000, min = 0, max = 1000.00), 2)) %>%
    mutate(cost_per_size = ifelse(size == 0, NA, round(price/size, 2)))



#### Save data ####
write.csv(sim_data, "~/final-paper/data/00-simulated_data/simulated_data.csv")
