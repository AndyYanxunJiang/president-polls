#### Preamble ####
# Purpose: Simulates a dataset of US electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(304)


#### Simulate data ####
# State names
states <- c(
  "Pennsylvania",
  "Arizona",
  "Montana",
  "Florida",
  "Texas",
  "Nebraska",
  "Michigan",
  "Ohio",
  "Wisconsin",
  "Georgia",
  "North Carolina",
  "Nevada",
  "Virginia"
)

# Political parties
parties <- c("DEM", "REP", "GRE", "LIB", "IND")

# Create a dataset by randomly assigning states and parties to divisions
analysis_data <- tibble(
  division = paste("Division", 1:151),  # Add "Division" to make it a character
  state = sample(
    states,
    size = 151,
    replace = TRUE,
    prob = c(0.25, 0.25, 0.15, 0.1, 0.1, 0.1, 0.025, 0.025) # Rough state population distribution
  ),
  party = sample(
    parties,
    size = 151,
    replace = TRUE,
    prob = c(0.40, 0.40, 0.05, 0.1, 0.05) # Rough party distribution
  )
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
