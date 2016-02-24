<<<<<<< HEAD
library(shiny); library(maps); library(mapproj)

# When using outside files, ALWAYS declare the FULL DIRECTION in your local
# machine

a <- "/Users/jramirezcastillo/GitHub/Shiny_Test"
b <- "/Lesson\ 5/Data/counties.rds"
d <- "/Lesson\ 5/helpers.R"
c <- paste(a, b, sep = "")
e <- paste(a, d, sep = "")
source(e)
counties <- readRDS(c)
rm(a,b,c,d,e)

# Create a map
# percent_map(counties$white, "darkgreen", "% white")

shinyServer(function(input, output) {
  
  output$map <- renderPlot({
    args <- switch(input$var,
                   "Percent White" = list(counties$white, "red", "% White"),
                   "Percent Black" = list(counties$black, "green",
                                          "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "blue",
                                             "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "yellow", 
                                          "% Asian"))
    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args)
  })
  
=======
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
  
>>>>>>> 288496ee74583be18c706209df92caf863a2d201
})

# When running an app from Shiny, the app name is the folder that contains
# the server.R and ui.R files.