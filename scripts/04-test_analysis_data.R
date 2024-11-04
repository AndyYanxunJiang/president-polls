#### Preamble ####
# Purpose: Tests analysis data
# Author: Andy Jiang
# Date: 4 November 2024
# Contact: ayx.jiang@mail.utoronto.ca
# Pre-requisites: cleaned the raw data


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(arrow)

# Load the cleaned data from the specified data folder
cleaned_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")

#### Test data ####

# Test that the dataset only includes the seven swing states
test_that("dataset includes only selected swing states", {
  swing_states <- c("Pennsylvania", "Georgia", "North Carolina", 
                    "Michigan", "Arizona", "Wisconsin", "Nevada")
  expect_true(all(cleaned_data$state %in% swing_states))
})

# Test that the dataset contains no missing values
test_that("dataset has no missing values", {
  expect_true(all(!is.na(cleaned_data)))
})

# Test that the `population` column contains only "rv" entries
test_that("population column contains only 'rv'", {
  expect_true(all(cleaned_data$population == "rv"))
})

# Test that the `candidate_name` column includes at least two candidates
test_that("candidate_name column has at least two unique candidates", {
  expect_true(length(unique(cleaned_data$candidate_name)) >= 2)
})

# Test that `sample_size` has only positive values
test_that("sample_size contains positive values", {
  expect_true(all(cleaned_data$sample_size > 0, na.rm = TRUE))
})