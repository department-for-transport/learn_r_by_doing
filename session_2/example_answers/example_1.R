library(readr)
library(dplyr)
library(tidyr)
library(ggplot2)

##Read in data from web link (could also use data.table::fread for this)
data_all <- readr::read_csv(url(https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv))

##Filter down to UK data and county level data only
gb_country <- data_all %>%
  dplyr::filter(country_region_code == "GB") %>%
  dplyr::filter(is.na(sub_region_1))

##Pivot longer to convert data into tidy format, need to convert all to character first

gb_long <- gb_country %>%
  dplyr::mutate_all(as.character()) %>%
  tidyr::pivot_longer(cols = dplyr::contains("change_from_baseline")) %>% #only pivot useful data columns
  dplyr::select(-c(country_region_code, country_region, sub_region_1, sub_region_2, metro_area, 
                   iso_3166_2_code, census_fips_code, place_id)) %>%  #remove useless columns to simplify dataset
  dplyr::mutate(name = gsub("_percent_change_from_baseline", "", name)) #simplify names of groups
                
##Create basic line chart showing trend for each area type

chart <- ggplot2::ggplot(gb_long, aes(x = date, y = value, group = name, colour = name, main = "Changes")) +
  geom_line() +
  theme_classic() +
ggtitle("Travel patterns compared with February 2020") + #add plot title
  xlab("Date") + ylab("% of February 2020 travel") + #add axes titles
  labs(color = "Area type") #add legend title
