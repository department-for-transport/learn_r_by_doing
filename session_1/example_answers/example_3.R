
# Read the data from the web
url <- "https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/1184462/full_data_clean.csv"
data <- read.csv(url)

# Check the first few rows of the data
head(data)

# Check the structure of the data
str(data)

# Create a ggplot line chart
ggplot(data, aes(x = date, y = value, color = transport_type)) +
  geom_line() +
  labs(
    title = "Daily Transport Usage by Mode",
    x = "Date",
    y = "Usage Index",
    color = "Transport Mode"
  ) +
  theme_minimal()

# Customize the ggplot chart
ggplot(data, aes(x = date, y = value, color = transport_type)) +
  geom_line() +
  labs(
    title = "Daily Transport Usage by Mode",
    x = "Date",
    y = "Usage Index",
    color = "Transport Mode"
  ) +
  theme_minimal() +
  scale_x_date(date_labels = "%Y-%m-%d", date_breaks = "1 month") +
  scale_color_manual(values = c("cars" = "blue", "tfl_tube" = "red", "tfl_bus" = "green")) +
  geom_vline(xintercept = as.Date(c("2020-03-23", "2021-03-23")), linetype = "dashed", color = "gray") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

