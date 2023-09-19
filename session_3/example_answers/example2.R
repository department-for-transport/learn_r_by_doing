taxi <- read_excel("Data/taxi.xlsx", sheet=1)

taxi_data <- taxi %>%
  pivot_longer(cols = -c("Region"),
               names_to = "Age",
               values_to = "Percentage") %>%
  filter(Region != "England and Wales" & Region != "England")

avg_age_data <- taxi_data %>%
  filter(Age == "Average age (years)")

taxi_data_new <- taxi_data %>%
  rename(Unknown = `Unknown [note 2]`) %>%
  filter(Age != "Average age (years)")

plot <- ggplot() + 
  geom_bar(data = taxi_data_new, aes(fill=Age, y=Percentage, x=Region), position="stack", stat="identity") +
  scale_fill_brewer(palette= "Spectral") +
  scale_color_brewer(palette= "Blues") +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) + 
  scale_y_continuous(limits=c(0, 100)) +
  geom_point(data = avg_age_data, aes(y=Percentage, x=Region, color = "Average Age")) +
  labs(colour = "")
plot+theme_light()
