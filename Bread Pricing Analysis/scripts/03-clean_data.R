#### Preamble ####
# Purpose: Cleans the raw grocery data recorded by Jacob Fillip in Project Hammer
# Author: Luka Tosic
# Date: 11 November 2024
# Contact: luka.tosic@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(arrow)
library(janitor)
library(lubridate)
library(dplyr)

#### Clean data ####
raw_data <- read.csv("~/final-paper/data/01-raw_data/hammer-4-raw.csv")
product_data <- read_csv("~/final-paper/data/02-analysis_data/hammer-4-product.csv")

#join files
full_data <- raw_data |>
  inner_join(product_data, by = c("product_id" = "id")) %>%
  select(nowtime, vendor, concatted, product_id, product_name, brand, current_price, 
         old_price, units, price_per_unit, other)

#dataset of solely bread item groceries
#aka breadata
bread_data <- full_data |> filter(str_detect(tolower(product_name), " bread(\\b|$)") &  # "bread" at end or followed by space
                          !str_detect(tolower(product_name), " flour") &        # Exclude " flour"
                                !str_detect(tolower(product_name), " mix"))

#create bread_type variable and filter for only those types
new_bread_data <- bread_data |> filter(str_detect(tolower(product_name),
                                              "white|sourdough|whole")) |>
  mutate(bread_type = case_when(str_detect(tolower(product_name), "white") ~ "white",
      str_detect(tolower(product_name), "sourdough") ~ "sourdough",
      str_detect(tolower(product_name), "whole") ~ "whole"))

#filter out units not in grams
new_bread_data <- new_bread_data |> mutate(units = as.numeric(str_remove(units, "g"))) |>
  filter(!is.na(units))

#dataset for linear model
type_data <- new_bread_data |> group_by(product_name) %>%
  summarize(
    current_price = min(as.numeric(current_price), na.rm = TRUE),  # Smallest price for each product_name
    old_price = as.numeric(first(old_price)),  # Old price (arbitrary - takes the first occurrence)
    total_units = first(units),  # Total units
    vendor = first(vendor),  # Take the first vendor for simplicity
    bread_type = first(bread_type)  # Take the first bread_type
  )


#### Save data ####
write_parquet(x = type_data, sink = "~/final-paper/data/02-analysis_data/analysis_data.parquet")
write_parquet(x = new_bread_data, sink = "~/final-paper/data/02-analysis_data/nowtime_data.parquet")