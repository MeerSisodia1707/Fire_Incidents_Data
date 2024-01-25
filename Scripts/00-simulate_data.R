#### Preamble ####
# Purpose: Simulates the data of fire accidents across Toronto
# Author: Meer Sisodia
# Date: 22nd January 2024
# Contact: meer.sisodia@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(lubridate)
library(knitr)

#### Data Explanation ####

## First Table ##

# Table will have two columns : Year and Number of incidents in that particular 
# year. We will use a normal distribution for simulating the data.

## Simulate data ##

set.seed(853)
simulated_data <- tibble(
  years = factor(2011:2022),
  incidents = rnorm(12, mean = 2000, sd = 1000))

simulated_data

## Graphing the plot

ggplot(simulated_data, aes(x = years, y = incidents)) + geom_bar(stat = 'identity')

## Second Table ##

# Table will have two columns : Month and Number of incidents in that particular 
# month over all the years. We will use a normal distribution for simulating the 
# data.

## Simulate data ##

simulated_data_two <- tibble(
  Month = month(1:12),
  Incidents = rnorm(12, mean = 2000, sd = 1000))

simulated_data_two

simulated_data_two <- simulated_data_two |>
  mutate(Month = month(Month, label = TRUE,abbr = TRUE))

## Graphing the plot

ggplot(simulated_data_two, aes(x = Month, y = Incidents)) + geom_bar(stat = 'identity')
simulated_data_two


## Third Table ##

# Table will have two columns : Years and Number of deaths in that particular 
# year. We will use a normal distribution for simulating the data.


simulated_data_deaths <- tibble(
  years = factor(2011:2022),
  incidents = rnorm(12, mean = 100, sd = 50))

simulated_data_deaths

## Graphing the plot

ggplot(simulated_data_deaths, aes(x = years, y = incidents)) + geom_bar(stat = 'identity')


## Fourth Table ##

# Table will have two columns : Cause of fire and number of incidents in that particular 
# year. We will use a normal distribution for simulating the data.

simulated_data_sources <- tibble(
  Ignition_Source = c('Type-1', 'Type-2', 'Type-3', 'Type-4', 'Type-5'),
  Incidents = rnorm(5, mean = 2000, sd = 1000))

simulated_data_sources

kable(simulated_data_sources)













