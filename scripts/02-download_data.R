#### Preamble ####
# Purpose: Downloads and saves the data from the website Fivethirtyeight.
# Author: Rui Hu, 
# Date: 21 October 2024
# Contact: hr.hu@mail.utoronto.ca, 
# License: N/A
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)

#### Download data ####
the_raw_data <- read.csv("data/01-raw_data/president_polls.csv")

#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(the_raw_data, "inputs/data/raw_data.csv") 

         
