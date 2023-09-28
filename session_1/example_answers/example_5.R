ggplot(data = tfl_22_23_fy, aes(x = date, y= value, group=transport_type, color=transport_type)) +
  geom_line()+
  scale_y_continuous(labels = scales::percent_format(), limits=c(0,1)) +
  labs(title = "April 2021 - March 2022 Usage of Transport for London Bus and Tube",
       y = "Percentage", x = "Date") +
  theme_bw() + 
  theme(legend.position = "bottom") +
  theme(plot.title = element_text(hjust = 0.5)) +
  theme(legend.title=element_blank())