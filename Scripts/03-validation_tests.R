#### Preamble ####
# Purpose: Tests the year_data and month_data csv files
# Author: Meer Sisodia
# Date: 22 January
# Contact: meer.sisodia@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None

year_data <- read_csv('Outputs/data/year_data.csv')
month_data <- read_csv('Outputs/data/month_data.csv')

years = year_data |> select(year)

test_year = tibble(
  years = 2011:2022
)
test_year == years

months = month_data |> select(month)

test_months = tibble(
  months = month(1:12)
)

test_months

test_months <- test_months |>
  mutate(months = month(months, label = TRUE,abbr = TRUE))
test_months
test_months == months
