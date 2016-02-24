library(shiny)

shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information from the 2010 US 
               Census."),
        
      selectInput("var",
                  label = "Choose a variable to display",
                  choices = list("Percent White",
                                 "Percent Black",
                                 "Percent Hispanic",
                                 "Percent Asian"), 
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
<<<<<<< HEAD
    mainPanel(plotOutput("map"))
=======
    mainPanel(
      textOutput("text1"),
      textOutput("text2")
      
# Notice that textOutput takes an argument, the character string “text1”. 
# Each of the *Output functions require a single argument: a character 
# string that Shiny will use as the name of your reactive element. Your 
# users will not see this name, but you will use it later.

    )
>>>>>>> 288496ee74583be18c706209df92caf863a2d201
  )
))

# When running an app from Shiny, the app name is the folder that contains
# the server.R and ui.R files.