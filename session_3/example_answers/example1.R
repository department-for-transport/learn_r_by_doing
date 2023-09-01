library(rmarkdown)
library(markdown)
library(readxl)

#Read in taxi data

taxi_data <- read_excel("Data/taxi0116.xlsx")

#Pivot Data

taxi_data_tidy <- read_excel("Data/taxi0116.xlsx")%>%
pivot_longer(cols = -c(Region), names_to = "taxi_ages", values_to = "percent")

#Filter data

taxi_data_filtered <- taxi_data_tidy %>%
filter(!Region %in% c("England and Wales", "England")) 

#Stacked bar chart:

ggplot(taxi_data_filtered, aes(x = Region, y = percent, fill = taxi_ages))+
  geom_col()+
  scale_y_continuous(labels = scales::percent_format(scale = 1))+
  scale_colour_brewer(palette = "Dark2")+
  labs(title = "Percentage of each taxi age by region", x = "Region", y = "Percentage")+
scale_x_discrete(guide = guide_axis(angle = 45))
