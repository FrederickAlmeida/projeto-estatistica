library(dplyr)
my_data <- read.csv('Covid Live.csv')


# tratando os dados, inicialmente estao como char e com virgulas
my_data$Total.Cases <- as.numeric(gsub(",", "", my_data$Total.Cases))
my_data$Total.Deaths <- as.numeric(gsub(",", "", my_data$Total.Deaths))
my_data$Tot.Cases..1M.pop <- as.numeric(gsub(",", "", my_data$Tot.Cases..1M.pop))
my_data$Deaths..1M.pop <- as.numeric(gsub(",", "", my_data$Deaths..1M.pop))

# apos isso, as colunas total cases, total deaths, tot cases/1m e total deaths/1m estao prontas para serem usadas

# structure of the data
my_data %>%
  str()

# summary
my_data %>%
  summary()
