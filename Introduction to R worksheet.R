# R= a new phone, R packages: Apps that you can download.
library(tidyverse)
library(nycflights13)
View(flights)

alaska_flights <- flights %>% 
  filter(carrier == "AS") # '==' indicates comparing not assigning
View(alaska_flights)

head(alaska_flights)
tail(alaska_flights)
glimpse(alaska_flights)
str(alaska_flights)
library(ggplot2)

ggplot(data = alaska_flights, mapping = aes(x = dep_delay, y = arr_delay))+ 
  geom_point(alpha = 0.2)+ #geom_point(alpha = 0.2) controls transparency of plot points 0 = invisible 1= highly visible)
  geom_jitter(width = 60, height = 40)  # jittering points so you can see better
colnames(alaska_flights)

View(weather)

early_january_weather <- weather %>% 
  filter(origin== "EWR" & month == 1 & day <= 15)
ggplot(data = early_january_weather, mapping = aes(x = time_hour, y = temp)) +
  geom_line()

ggplot(data = early_january_weather, mapping = aes(x = time_hour, y = dewp)) +
  geom_line()

ggplot(weather, aes(x = temp)) +
  geom_histogram(binwidth = 1, color= 'white', fill = 'steelblue')

ggplot(weather, aes(x = temp)) +
  geom_histogram(binwidth = 5, color= "white") +
  facet_wrap(~ month, nrow = 4) # creates histograms under certain condition of variable 'month'
# _age == not a valid variable
#.mass == valid variable
# atomic vector, most basic object in r i.e. 1:5 or 2^(3:5)

ls() # list everything saved in environment

portland_flight <- flights %>% 
  filter(dest == "PDX")
#To see many of these in action, let’s select all flights that left
#JFK airport heading to Burlington, Vermont ("BTV") or Seattle, 
#Washington ("SEA") in the months of October, November, or December. 

btv_sea_flights_fall <- flights %>% 
  filter(origin == "JFK", dest =="BTV" | dest == "SEA", month >= 10)

not_btv_sea_flights_fall <- flights %>% 
  filter(!(dest== "BTV"| dest == "SEA"))

many_airports <- flights %>% 
  filter(dest %in% c("BTV", "SEA", "PDX", "SFO", "BDL")) # %in% c() call multiple results for certain variable
View(many_airports)

summary_temp <- weather %>% 
  summarise(mean= mean(temp, na.rm = T), 
            std_dev = sd(temp, na.rm = T))
summary_temp

summary_montly_temp <- weather %>% 
  group_by(month) %>% 
  summarize(mean = mean(temp, na.rm = T),
            std_dev = sd(temp, na.rm = T))
summary_montly_temp

by_origin_monthly <- flights %>%
  group_by(origin, month) %>% 
  summarize(count = n())
View(by_origin_monthly)

flights <- flights %>% 
  mutate(gain = dep_delay- arr_delay)
View(flights)
