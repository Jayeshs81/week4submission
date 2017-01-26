library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("World Phone Data - Select Data you want to display."),
  
  # Side bar with checkbox inputs for region and years 
  sidebarLayout(
    sidebarPanel(
      p("Select the Regions and Years for which the Phones data needs to be plotted 
        from the WorldPhones dataset."),
      checkboxGroupInput("regions", "Regions", names(as.data.frame(WorldPhones))),
      checkboxGroupInput("years", "Years", row.names(WorldPhones))
    ),
    
    # Show the plot with the selected data
    mainPanel(
       plotOutput("plotData")
    )
  )
))
