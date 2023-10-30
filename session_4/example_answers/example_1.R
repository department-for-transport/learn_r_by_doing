library(dplyr)
library(ggplot2)
library(ggimage)

readr::read_csv("https://raw.githubusercontent.com/department-for-transport/learn_r_by_doing/main/Data/ghost_stations.csv") %>%
  dplyr::arrange(`2020`) %>%
  head(5) %>%
  tidyr::pivot_longer(cols = `1998`:`2022`,
                      names_to = "year") %>%
  ggplot(aes(x= year, y = value, colour = station_name, group = station_name))+
    geom_image(image = "session_4/example_answers/ghost.svg")+
     theme_classic()
