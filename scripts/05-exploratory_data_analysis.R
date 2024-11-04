#### Preamble ####
# Purpose: Models voter support for U.S. 2024 presidential candidates in key swing states,
#          analyzing polling trends and predicting election outcomes.
# Author: Andy Jiang
# Date: 30 October 2024
# Contact: ayx.jiang@mail.utoronto.ca
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
  first_model,
  file = "models/first_model.rds"
)


