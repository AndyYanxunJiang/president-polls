#### Preamble ####
# Purpose: Models a Bayesian regression model to predict polling trends for the 2024 U.S. Presidential Election.
# Author: Rui Hu
# Date: 4 November 2024
# Contact: hr.hu@mail.utoronto.ca
# License: MIT
# Pre-requisites: N\A
# Any other information needed? N\A


#### Workspace setup ####
library(tidyverse)
library(rstanarm)

#### Read data ####
data_filtered <- read_csv(here::here("data/02-analysis_data/model_data.csv"))
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
