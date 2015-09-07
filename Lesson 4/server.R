library(shiny)

shinyServer(function(input, output) {

# Placing a function in ui.R tells Shiny where to display your object. Next, 
# you need to tell Shiny how to build the object.
  
# Do this by providing R code that builds the object in server.R. The code 
# should go in the unnamed function that appears inside shinyServer in your 
# server.R script.
  
# The unnamed function plays a special role in the Shiny process; it builds 
# a list-like object named output that contains all of the code needed to 
# update the R objects in your app. Each R object needs to have its own entry
# in the list.
  
# You can create an entry by defining a new element for output within the 
# unnamed function, like below. The element name should match the name of 
# the reactive element that you created in ui.R.
  
# In the script below, output$text1 matches textOutput("text1") in your 
# ui.R script.
  
  output$text1 <- renderText({
    paste("You have selected", input$var)
  })
  
  output$text2 <- renderText({
    paste("You have chosen a range", input$range[1], "to", input$range[2])
  })
  
# Each render* function takes a single argument: an R expression surrounded 
# by braces, {}. The expression can be one simple line of text, or it can 
# involve many lines of code, as if it were a complicated function call.
  
})

# When running an app from Shiny, the app name is the folder that contains
# the server.R and ui.R files.