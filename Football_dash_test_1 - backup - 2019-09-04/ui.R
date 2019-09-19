#https://groups.google.com/forum/#!topic/shiny-discuss/myaiuqDSVGc
#use above link for info on including dashboard elements in a fluidPage

shinyUI(fluidPage(
  # Adds in the random bit of javascript that somehow makes the map tab
  # size dynamically change with the sie of the window.
  #tags$script(jscode),
  
  # use this in non shinydashboard app
  #setBackgroundColor(color = "ghostwhite"),
  useShinydashboard(),
  theme = shinytheme("slate"),
    # Application title
    titlePanel("Football Test 1"),
  #dashboardHeader(title = "Football Test 1"),
    sidebarLayout(
        sidebarPanel(
          selectInput("team",
                      "Team:",
                      #c("player1", "player2")
                      choices = unique(statsbomb$team.name),
                      selected = statsbomb$team.name[1],
                      #multiple = FALSE
                      
          ),
            selectInput("player",
                        "Player:",
                        #c("player1", "player2")
                        choices = unique(statsbomb$player.name),
                        selected = statsbomb$player.name[2]
                        #add function to get names by team selected
            ),
            
            selectInput("action",
                        "Action:",
                        c("Shot", "Pass", "Cross", "Pressure", "Dribble", "Foul Won", "Foul Committed")
                        #c("statsbomb$pass.cross")
                        
            ),
            sliderInput("range", "Range:",
                        min = 0, max = 100,
                        value = c(0, 90)
            ),
          
          radioButtons("half", "Half: ",
                       c("Both" = 0, "1st" = 1, "2nd" = 2),
                       inline = TRUE
          ),
          
          fileInput("file1", "Choose CSV File",
                    accept = c(
                      "text/csv",
                      "text/comma-separated-values,text/plain",
                      ".csv")
          )

            
        ),

        # Show a plot of the generated distribution
        mainPanel(
          fluidRow(
            column(6,
            h3(textOutput("player_caption"))
            # infoBox(
            #   "Player", uiOutput("player_caption"), icon = icon("users"), color = "purple", fill = FALSE
            # ),
            #infoBox("Player", approvalBox, icon = icon("profile"))
            #infoBoxOutput("playerBox"),
            ),
            column(6,
            h3(textOutput("action_caption"))
            )
          ),
          tableOutput("contents"),
          plotOutput("pitch_plot_test")
        )
    )
))
