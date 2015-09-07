# server.R

library(quantmod)
a <- "/Users/jramirezcastillo/GitHub/Shiny_Test"
d <- "/Lesson\ 6/helpers.R"
e <- paste(a, d, sep = "")
source(e)

shinyServer(function(input, output) {
  
# You can limit what gets re-run during a reaction with reactive 
# expressions.
  
# A reactive expression is an R expression that uses widget input and 
# returns a value. The reactive expression will update this value whenever 
# the original widget changes.
  
# To create a reactive expression use the reactive function, which takes 
# an R expression surrounded by braces (just like the render* functions).
  
  dataInput <- reactive({
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
  finalInput <- reactive({
# If input$adjunt is not on, return dataInput(), else return adjusted data
    if (!input$adjust) return (dataInput())
    adjust(dataInput())
  })
  
  output$plot <- renderPlot({
    chartSeries(finalInput(), theme = chartTheme("white"), 
                type = "line", log.scale = input$log, TA = NULL)
  })

# Reactive expressions are a bit smarter than regular R functions. They 
# cache their values and know when their values have become outdated. What 
# does this mean? The first time that you run a reactive expression, the 
# expression will save its result in your computer’s memory. The next time 
# you call the reactive expression, it can return this saved result without 
# doing any computation (which will make your app faster).
                     
    
  
})