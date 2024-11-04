#### Preamble ####
# Purpose: Simulates a dataset of US electoral divisions, including the 
#state and party that won each division.
# Author: Rui Hu
# Date: 22 October 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed

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
  "Nebraska CD-2",
  "Michigan",
  "Ohio",
  "Wisconsin",
  "Georgia",
  "North Carolina",
  "Nevada",
  "Virginia"
)

# Political parties
parties <- c("DEM", "REP", "GRE", "IND", "LIB", "CON", "PSL")

# Create a dataset by randomly assigning states and parties to divisions
analysis_data <- tibble(
  division = paste("Division", 1:200),  # Add "Division" to make it a character
  state = sample(
    states,
    size = 200,
    replace = TRUE,
    prob = c(0.085, 0.047, 0.007, 0.142, 0.193, 0.005, 0.067, 0.078, 0.039, 
             0.07, 0.069, 0.021, 0.057) # Rough state population distribution
  ),
  party = sample(
    parties,
    size = 200,
    replace = TRUE,
    prob = c(0.35, 0.35, 0.15, 0.07, 0.04, 0.03, 0.01) # Rough party distribution
  )
)


#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
