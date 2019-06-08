library("readxl")
library("dplyr")
library("ggplot2")

# xls files
titanic_data <- read_excel("titanic3.xls")

ggplot(titanic_data,aes(pclass,fare))+
  geom_boxplot(aes(group = cut_width(pclass, 1))) + 
  ggtitle("Fare Vs Pclass")


titanic_data %>%  
  count(sex, pclass) %>% 
  group_by(sex) %>% 
  mutate(freq = n) %>% 
  ggplot(aes(x = pclass, y = freq, fill = sex)) + 
  geom_bar(stat="identity", position = 'dodge')
