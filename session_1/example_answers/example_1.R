# Explore what our data looks like
head(df)

# do we have missing values in any of our columns? -> NO
apply(df, 2, function(x) sum(is.na(x)))

# What are our date ranges? -> about 1200 days
min(df$date)
max(df$date)
max(df$date) - min(df$date)

# is our data evenly distributed by date, transport type? -> pretty much yeah
as.data.frame(table(df$transport_type)) %>% arrange(desc(Freq))
as.data.frame(table(table(df$date))) %>% arrange(desc(Freq))

# What's up with the spike in TFL Tube travel on 25/12/2022?
df %>% 
  filter(transport_type == "tfl_tube") %>% 
  slice_max(value, n=3)

# Did something happen to the other transport types then? -> NO
# As before, just now with a window around these dates.
df %>% 
  filter(date > "2022-12-20",
         date < "2022-12-30") %>% 
  ggplot(aes(x = date,
             y = value,
             col = transport_type)) + 
  geom_line() +
  geom_hline(yintercept = 1) +
  guides(col = guide_none()) +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  facet_wrap(vars(transport_type),
             nrow = 3,
             scales = "fixed")

# I guess it's just an outlier then. Let's remove it. 
# Remove the outlier
df$value[df$value > 3] <- NA

df %>% 
  ggplot(aes(x = date,
             y = value,
             col = transport_type)) + 
  geom_line() +
  geom_hline(yintercept = 1) +
  guides(col = guide_none()) +
  scale_y_continuous(labels = scales::percent_format()) +
  scale_x_date(date_breaks = "6 month", date_labels = "%b %Y",
               guide = guide_axis(n.dodge = 2)) +
  facet_wrap(vars(transport_type),
             nrow = 3,
             scales = "fixed")