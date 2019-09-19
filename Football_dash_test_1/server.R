#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  player_formulaText <- reactive({
    paste("Player: ", input$player)
  })
  
  action_formulaText <- reactive({
    paste("Action: ", input$action)
  })
  
  
      output$player_caption <- renderText({
        player_formulaText()
      })

    
      output$action_caption <- renderText({
        action_formulaText()
      })
      
      # output$playerBox <- renderInfoBox({
      #   infoBox(
      #     "Player: ", "name", icon = icon("thumbs-up", lib = "glyphicon"),
      #     color = "yellow"
      #   )
      # })
      output$contents <- renderTable({
        #example from: https://shiny.rstudio.com/reference/shiny/0.14/fileInput.html
        # input$file1 will be NULL initially. After the user selects
        # and uploads a file, it will be a data frame with 'name',
        # 'size', 'type', and 'datapath' columns. The 'datapath'
        # column will contain the local filenames where the data can
        # be found.
        inFile <- input$file1
        
        if (is.null(inFile))
          return(NULL)
        
        read.csv(inFile$datapath, header = input$header)
      })
 
      output$pitch_plot_test <- renderPlot({
        pitch_plot_test(input$team, input$action, input$player)
       # print(input$team)
      })
})
