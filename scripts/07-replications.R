#### Preamble ####
# Purpose: Replicates and visualizes key polling trends and support graphs for the 2024 U.S. Presidential Election.
# Author: Rui Hu, Andy Jiang, Onon Burentuvshin
# Date: 4 November 2024
# Contact: hr.hu@mail.utoronto.ca, ayx.jiang@mail.utoronto.ca
# License: MIT
# Pre-requisites: N\A
# Any other information needed? N\A


#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Load data ####
polling_data <- read_parquet(here::here("data/02-analysis_data/analysis_data.parquet"))



