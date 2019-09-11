## Module 2: Working with GitHub

# Load the GSODR and tidyverse packages
library(GSODR)
library(tidyverse)
install.packages("tidyverse")
# Download 2019 weather data for Raleigh by running the following 
# code:
d <- get_GSOD(years = 2019, station = "723060-13722")

# Next, we'll look at cumulative precipitation. 
# Run this code by placing your cursor anywhere in the 
# code block below and hitting "run":
ggplot(data = d, aes(x = YEARMODA, y = cumsum(PRCP)/25.4)) +
  geom_line() +
  ylab("Cumulative precipitation (in)") +
  xlab("Date") +
  scale_x_date(breaks = "month", date_labels = "%b") +
  scale_y_continuous(breaks = seq(0,40,5)) +
  theme_bw()

# We can also summarize the 2019 rainfall data to look at monthly
# totals:
d_monthly <- d %>% group_by(MONTH) %>% summarize(PRCP = sum(PRCP)/25.4); d_monthly

# The monthly totals can then also be visualized:
ggplot(data = d_monthly, aes(x = MONTH, y = PRCP)) +
  geom_bar(stat = "identity") +
  ylab("Precipitation (in)") +
  xlab("Month") +
  theme_classic()

# Which month had the greatest amount of rainfall in 2019? 
# Your answer: April!