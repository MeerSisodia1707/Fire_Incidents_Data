#### Preamble ####
# Purpose: Clean the fire incidents data
# Author: Meer Sisodia
# Date: 22 January 2024
# Contact: meer.sisodia@mail.utoronto.ca
# License: University of Toronto
# Pre-requisites: None

#### Workspace setup ####
library(tidyverse)
library(lubridate)
#### Clean and Prepare data ####
raw_data <- read_csv("Inputs/data/raw_data.csv")

clean_data <- raw_data |> select(TFS_Alarm_Time)
year_data <- clean_data |> mutate(TFS_Alarm_Time = factor(year(TFS_Alarm_Time)))
year_data <- year_data |> count(TFS_Alarm_Time)
year_data <- year_data |> rename(year = TFS_Alarm_Time)
year_data <- year_data |> rename(incidents = n)
year_data


month_data <- clean_data |> mutate(TFS_Alarm_Time = month(TFS_Alarm_Time))
month_data <- month_data |> count(TFS_Alarm_Time)
month_data <- month_data |> rename(month = TFS_Alarm_Time)
month_data <- month_data |> rename(incidents = n)
month_data <- month_data |>
  mutate(month = month(month, label = TRUE,abbr = TRUE))
month_data

#### Save data ####

write_csv(year_data, "Outputs/data/year_data.csv")
write_csv(month_data, "Outputs/data/month_data.csv")

