library(Lahman)
library(dplyr)
top <- Batting %>% 
  filter(yearID == 2016) %>%
  arrange(desc(HR)) %>%    # arrange by descending HR count
  slice(1:10)    # take entries 1-10
top %>% as_tibble()
Master %>% as_tibble()

#Use the correct join or bind function to create a combined 
#table of the names and statistics of the top 10 home run 
#(HR) hitters for 2016. This table should have the player ID,
#first name, last name, and number of HR for the top 10 players. 
#Name this data frame top_names.
top_names <- top %>% left_join(Master) %>%
  select(playerID, nameFirst, nameLast, HR)
top_names


#Inspect the Salaries data frame. Filter this data frame to the 2016 salaries, 
#then use the correct bind join function to add a salary column to the top_names 
#data frame from the previous question. Name the new data frame top_salary. Use this code framework:
top_salary <- Salaries %>% filter(yearID == 2016) %>%
  right_join(top_names) %>%
  select(nameFirst, nameLast, teamID, HR, salary)
top_salary

head(AwardsPlayers)
AwardsPlayers %>% filter(yearID == 2016) %>%
  semi_join(top_names)
a <- AwardsPlayers %>% filter(yearID == 2016) %>%
  anti_join(top_names) %>% 
  select(playerID)
a[!duplicated(a),]
