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

clean_data <- raw_data |> select(TFS_Alarm_Time, Civilian_Casualties, Ignition_Source)
clean_data <- clean_data |> mutate(year = factor(year(TFS_Alarm_Time)), month = month(TFS_Alarm_Time))
clean_data <- clean_data |> select(-TFS_Alarm_Time)
clean_data
year_data <- clean_data |> select(year)
year_data <- year_data |> count(year)
year_data <- year_data |> rename(incidents = n)
year_data


month_data <- clean_data |> select(month)
month_data <- month_data |> count(month)
month_data <- month_data |> rename(incidents = n)
month_data <- month_data |> mutate(month = month(month, label = TRUE,abbr = TRUE))
month_data

clean_sample_data <- head(clean_data, 5)
raw_data_selected <- raw_data |> select(TFS_Alarm_Time, Civilian_Casualties, Ignition_Source)
sample_data <- head(raw_data_selected, 5)


#### Save data ####

write_csv(year_data, "Outputs/data/year_data.csv")
write_csv(month_data, "Outputs/data/month_data.csv")
write_csv(sample_data, "Outputs/data/sample_data.csv")
write_csv(clean_sample_data, "Outputs/data/clean_sample_data.csv")

