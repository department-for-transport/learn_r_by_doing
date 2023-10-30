# 
# library(forcats)
# 
# #import data 
# DailyUsage <- read.csv("https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1169293/full_data_clean.csv")
# 
# 
# #Look at the data
# head(DailyUsage)
# 
# summary(DailyUsage)
# 
# #2a. Replace underscores in transport Type with a space
# DailyUsage$transport_type <- str_replace_all(DailyUsage$transport_type, "_"," " )
# 
# #2b. Convert date field into date format
# 
# DailyUsage$date2 <- as.Date(DailyUsage$date, "%Y-%m-%d")
# 
# # Lets only keep motor vehicles
# 
# DailyUsage_Motor <- DailyUsage %>%  
#   filter(transport_type %in% c("all motor vehicles","cars","light commercial vehicles", "heavy goods vehicles")) 
# 
# 
# # 3. Create a ggplot line chart of the data
# ## with dates on the x axis and value on the y axis
# 
# 
# ggplot(data = DailyUsage_Motor, aes(x = date2, y= value, group=transport_type, color=transport_type)) +
#   geom_line()+
#   facet_wrap(~ transport_type) +
#   scale_y_continuous(labels = scales::percent_format(), limits=c(0,1.5)) +
#   scale_colour_brewer(palette = "Paired")+
#   labs(title = "Daily usage of motor vehicle by type",
#        subtitle = " January 3 2020 to July 10 2023",
#        y = "Percentage", x = "Date") +
#   theme_light ()  