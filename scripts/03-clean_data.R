#### Preamble ####
# Purpose: Cleans the raw data into 7 swing states
# Author: Rui Hu, Andy Jiang
# Date: 21 October 2024
# Contact: hr.hu@mail.utoronto.ca, ayx.jiang@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/raw_data.csv")

cleaned_data <- raw_data |> 
  filter(population == "rv", 
         state %in% c("Pennsylvania", "Georgia", "North Carolina", 
                      "Michigan", "Arizona", "Wisconsin", "Nevada")) |>
  select(pollster, state, start_date, end_date, question_id, sample_size,
         population, party, answer, candidate_name, hypothetical, pct)

#### Save data ####
write_parquet(cleaned_data, "data/02-analysis_data/analysis_data.parquet")

#### Clean data for model####
# Read the data
data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

# Change the form of date
data$end_date <- mdy(data$end_date)
data_filtered <- data %>%
  mutate(end_date_numeric = as.numeric(end_date))

# Calculate the average pct
data_filtered <- data_filtered %>% 
  filter(candidate_name %in% c("Donald Trump", "Kamala Harris")) %>%
  group_by(candidate_name, end_date_numeric, end_date) %>%
  summarize(average_pct = mean(pct, na.rm = TRUE)) %>%
  mutate(state = " Overall")

data_filtered <- data_filtered %>% mutate(pct = average_pct / 100)

#### Save data ####
write_csv(data_filtered, "data/02-analysis_data/model_data.csv")