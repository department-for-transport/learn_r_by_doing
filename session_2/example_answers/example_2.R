library(dplyr)
library(tidyverse)
library(ggplot2)

gmd <- data.table::fread(https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv) %>% filter(country_region_code=="GB")
gmd <- gmd %>% tidyr::pivot_longer(cols = dplyr::contains("change_from_baseline"))

plot <- ggplot(gmd,aes(x=date,y=value,group=name))+geom_line()
