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

#### Read data ####
data_filtered <- read_parquet(here::here("data/02-analysis_data/model_data.parquet"))
data_filtered <- data_filtered %>% mutate(pct = average_pct / 100)


### Model data ####
model <- 
  stan_glm(
    formula = pct ~ end_date_numeric + candidate_name, 
    data = data_filtered, 
    family = gaussian(),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 304
    )
summary(model)


#### Save model ####
saveRDS(
  model,
  file = "models/model.rds"
)
