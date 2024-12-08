mlb <- read.csv('Lab1_MLB_2023.csv')
mlb

library(ggplot2)

# Question 1
# Initialize
slugging_percentages <- ggplot(mlb)
slugging_percentages + geom_boxplot(aes(x = Slugging)) + 
  labs(
    title = "Slugging Percentages",
    x = "Slugging Percentages"
  )
fivenum(mlb$Slugging)
mean(mlb$Slugging)
sd(mlb$Slugging)

# Question 2
max_slug = max(mlb$Slugging)
player = (mlb$Name[mlb$Slugging == max_slug])
player

team = (mlb$Team[mlb$Slugging == max_slug])
team

# Question 3
slug_percent_strikeouts <- ggplot(mlb)
slug_percent_strikeouts + geom_point(aes(x = Slugging, y = Strike_Outs)) + 
  labs(
    title = "Strikeouts vs Slugging Percentages",
    x = "Slugging Percentages",
    y = "Strikeouts"
  ) + 
  geom_smooth(aes(x = Slugging, y = Strike_Outs), method = lm)
cor(mlb$Slugging, mlb$Strike_Outs)

# Question 4
mlb$powerhitter <- mlb$Home_Runs >= 10
table(mean(mlb$powerhitter))

# Question 5
slug_percent_strikeouts_powerhitter <- ggplot(mlb)
slug_percent_strikeouts_powerhitter + geom_point(aes(x = Slugging, y = Strike_Outs, color = powerhitter)) + 
  labs(
    title = "Strikeouts vs Slugging Percentages",
    x = "Slugging Percentages",
    y = "Strikeouts"
  ) + 
  geom_smooth(aes(x = Slugging, y = Strike_Outs), method = lm)

mean(mlb$powerhitter == TRUE)
sd(mlb$powerhitter == TRUE)
mean(mlb$powerhitter == FALSE)
sd(mlb$powerhitter == FALSE)
mean(mlb$powerhitter)
sd(mlb$powerhitter)
