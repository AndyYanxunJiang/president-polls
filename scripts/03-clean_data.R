#### Preamble ####
# Purpose: Cleans the raw data into 7 swing states
# Author: Rui Hu, Andy Jiang
# Date: 21 October 2024
# Contact: hr.hu@mail.utoronto.ca, ayx.jiang@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <- raw_data |> 
  filter(population == "rv", 
         state %in% c("Pennsylvania", "Georgia", "North Carolina", 
                      "Michigan", "Arizona", "Wisconsin", "Nevada")) |>
  select(pollster, state, start_date, end_date, question_id, sample_size,
         population, party, answer, candidate_name, hypothetical, pct)

#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")
