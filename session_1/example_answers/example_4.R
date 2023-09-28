transport_data_clean <- transport_data %>% 
  rename("Transport Type" = transport_type, "Value" = value) %>% 
  mutate(`Transport Type` = gsub("_", " ", `Transport Type`)) %>% 
  
  ggplot(data = transport_data_clean, aes(x = date, y = Value, colour = `Transport Type`))+
  geom_line()+
  facet_wrap(~`Transport Type`)