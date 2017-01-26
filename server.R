library(shiny)
library(datasets)
library(ggplot2)
library(reshape2)
library(dplyr)

# Define server logic to display the plot
shinyServer(function(input, output) {
  
  # Interactively generate plot
  output$plotData <- renderPlot({
    # Get the regions and years selected by the user on each input
    cols <- input$regions
    rows <- input$years
    
    # Format the WorldPhones data for processing
    melted <- melt(WorldPhones)
    names(melted) <- c("Year", "Region", "Count")
    melted$Year <- as.factor(melted$Year)
    
    # Filter the WorldPhone data to obtain only the selected years and regions
    regData <- filter(melted, Year %in% rows, Region %in% cols)
    
    # Plot the selected data
    g <- ggplot(data = regData, aes(x = Year, y = Count))
    g <- g + geom_bar(aes(fill = Region), position = "dodge", stat = "identity")
    g <- g + xlab("Year") + ylab("# of Phones") + title("World Population of Phones")
    g
  })
  
})
