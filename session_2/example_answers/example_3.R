# library(tidyverse)
# 
# countries <- data.table::fread(https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv) %>%
#   select(country_region)%>%
#   unique()
# 
# UK_sub_regions <- data.table::fread(https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv) %>%
#   filter(country_region == "United Kingdom")%>%
#   select(sub_region_1)%>%
#   unique()
# 
# key_regions <- c("Greater Manchester", "Greater London", "West Midlands", "West Yorkshire")
# 
# data_tab <- data.table::fread(https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv) %>%
#   tidyr::pivot_longer(cols = dplyr::contains("change_from_baseline"),names_to = "area_type")%>%
#   filter(country_region == "United Kingdom")%>%
#   filter(sub_region_1 %in% key_regions)%>%
#   filter(area_type == "workplaces_percent_change_from_baseline")%>%
#   filter(date >= as.Date("2020-03-01") & date <= as.Date("2020-03-31"))
# 
#   
# ggplot(data = data_tab,aes(x = date, y = value, colour = sub_region_1)) +
#   geom_line()
