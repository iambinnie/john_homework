#ibrary(StatsBombR)
#library(soccermatics)

#library(ggplot2)
#data(statsbomb)

# custom plot of France defensive pressure events vs. Argentina

pitch_plot_test <- function(team, action, player){
  soccerPitch(widthPitch = 80, lengthPitch = 120, arrow = "r", theme = "grass", 
              title = "France (vs. Argentina)", 
              subtitle = "Pressure events") +
    geom_point(data = filter(statsbomb, team.name == team & type.name == action & player.name == player), 
               aes(x = location.x, y = location.y), 
               col = "blue", alpha = 0.5)
              #theme(plot.background = element_rect(fill = "transparent", colour = NA))
}
#stats_bomb_data <- StatsBombFreeEvents()

#match_test <- get.matchFree(Matches[1,])
#StatsBombData <- allclean(StatsBombData)
